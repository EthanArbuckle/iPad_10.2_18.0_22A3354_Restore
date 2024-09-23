@implementation MXBeginRequest

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (int)inputOrigin
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_inputOrigin;
  else
    return 0;
}

- (void)setInputOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_inputOrigin = a3;
}

- (void)setHasInputOrigin:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInputOrigin
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)inputOriginAsString:(int)a3
{
  if (a3 < 0x13)
    return off_2512EF640[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsInputOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UndefinedInputOrigin")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeButton")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteButton")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteAppButton")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AssistantSpeechButton")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AssistantTextInput")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PriorRequest")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VoiceTrigger")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ServerGenerated")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MotionGesture")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RaiseToSpeak")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClientGenerated")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TapToRefresh")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BackgroundRefresh")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BluetoothVoiceTrigger")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BluetoothDoubleTap")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TriggerlessFollowup")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DialogButtonTap")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MagusFollowup")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAudioMetadata
{
  return self->_audioMetadata != 0;
}

- (void)setEnablePartialResults:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enablePartialResults = a3;
}

- (void)setHasEnablePartialResults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnablePartialResults
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsPromptedDictation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isPromptedDictation = a3;
}

- (void)setHasIsPromptedDictation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsPromptedDictation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsPromptedConfirmation:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isPromptedConfirmation = a3;
}

- (void)setHasIsPromptedConfirmation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPromptedConfirmation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasForegroundAppId
{
  return self->_foregroundAppId != 0;
}

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isAutoPunctuationEnabled = a3;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearInlineLmeItems
{
  -[NSMutableArray removeAllObjects](self->_inlineLmeItems, "removeAllObjects");
}

- (void)addInlineLmeItems:(id)a3
{
  id v4;
  NSMutableArray *inlineLmeItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  inlineLmeItems = self->_inlineLmeItems;
  v8 = v4;
  if (!inlineLmeItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_inlineLmeItems;
    self->_inlineLmeItems = v6;

    v4 = v8;
    inlineLmeItems = self->_inlineLmeItems;
  }
  -[NSMutableArray addObject:](inlineLmeItems, "addObject:", v4);

}

- (unint64_t)inlineLmeItemsCount
{
  return -[NSMutableArray count](self->_inlineLmeItems, "count");
}

- (id)inlineLmeItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_inlineLmeItems, "objectAtIndex:", a3);
}

+ (Class)inlineLmeItemsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXBeginRequest;
  -[MXBeginRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXBeginRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestId;
  uint64_t inputOrigin;
  __CFString *v7;
  MXAudioMetadata *audioMetadata;
  void *v9;
  char has;
  void *v11;
  NSString *foregroundAppId;
  void *v13;
  NSMutableArray *inlineLmeItems;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("request_id"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    inputOrigin = self->_inputOrigin;
    if (inputOrigin >= 0x13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_inputOrigin);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_2512EF640[inputOrigin];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("input_origin"));

  }
  audioMetadata = self->_audioMetadata;
  if (audioMetadata)
  {
    -[MXAudioMetadata dictionaryRepresentation](audioMetadata, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("audio_metadata"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enablePartialResults);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("enable_partial_results"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPromptedDictation);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("is_prompted_dictation"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPromptedConfirmation);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("is_prompted_confirmation"));

  }
LABEL_14:
  foregroundAppId = self->_foregroundAppId;
  if (foregroundAppId)
    objc_msgSend(v4, "setObject:forKey:", foregroundAppId, CFSTR("foreground_app_id"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAutoPunctuationEnabled);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("is_auto_punctuation_enabled"));

  }
  inlineLmeItems = self->_inlineLmeItems;
  if (inlineLmeItems)
    objc_msgSend(v4, "setObject:forKey:", inlineLmeItems, CFSTR("inline_lme_items"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXBeginRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_requestId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_audioMetadata)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_foregroundAppId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_inlineLmeItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_inputOrigin;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  if (self->_audioMetadata)
  {
    objc_msgSend(v10, "setAudioMetadata:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 48) = self->_enablePartialResults;
    *((_BYTE *)v4 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_9:
      if ((has & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((_BYTE *)v4 + 51) = self->_isPromptedDictation;
  *((_BYTE *)v4 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    *((_BYTE *)v4 + 50) = self->_isPromptedConfirmation;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_11:
  if (self->_foregroundAppId)
  {
    objc_msgSend(v10, "setForegroundAppId:");
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 49) = self->_isAutoPunctuationEnabled;
    *((_BYTE *)v4 + 52) |= 4u;
  }
  if (-[MXBeginRequest inlineLmeItemsCount](self, "inlineLmeItemsCount"))
  {
    objc_msgSend(v10, "clearInlineLmeItems");
    v6 = -[MXBeginRequest inlineLmeItemsCount](self, "inlineLmeItemsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[MXBeginRequest inlineLmeItemsAtIndex:](self, "inlineLmeItemsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addInlineLmeItems:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  char has;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_inputOrigin;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v8 = -[MXAudioMetadata copyWithZone:](self->_audioMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 48) = self->_enablePartialResults;
    *(_BYTE *)(v5 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_BYTE *)(v5 + 51) = self->_isPromptedDictation;
  *(_BYTE *)(v5 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 50) = self->_isPromptedConfirmation;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
LABEL_7:
  v11 = -[NSString copyWithZone:](self->_foregroundAppId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 49) = self->_isAutoPunctuationEnabled;
    *(_BYTE *)(v5 + 52) |= 4u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_inlineLmeItems;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addInlineLmeItems:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *requestId;
  char has;
  MXAudioMetadata *audioMetadata;
  NSString *foregroundAppId;
  char v9;
  NSMutableArray *inlineLmeItems;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:"))
      goto LABEL_43;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_inputOrigin != *((_DWORD *)v4 + 8))
      goto LABEL_43;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_43;
  }
  audioMetadata = self->_audioMetadata;
  if ((unint64_t)audioMetadata | *((_QWORD *)v4 + 1))
  {
    if (!-[MXAudioMetadata isEqual:](audioMetadata, "isEqual:"))
      goto LABEL_43;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0)
      goto LABEL_43;
    if (self->_enablePartialResults)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_43;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_43;
    if (self->_isPromptedDictation)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_43;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_43;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_43;
    if (self->_isPromptedConfirmation)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_43;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_43;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_43;
  }
  foregroundAppId = self->_foregroundAppId;
  if ((unint64_t)foregroundAppId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](foregroundAppId, "isEqual:"))
      goto LABEL_43;
    has = (char)self->_has;
  }
  if ((has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_49;
LABEL_43:
    v9 = 0;
    goto LABEL_44;
  }
  if ((*((_BYTE *)v4 + 52) & 4) == 0)
    goto LABEL_43;
  if (!self->_isAutoPunctuationEnabled)
  {
    if (!*((_BYTE *)v4 + 49))
      goto LABEL_49;
    goto LABEL_43;
  }
  if (!*((_BYTE *)v4 + 49))
    goto LABEL_43;
LABEL_49:
  inlineLmeItems = self->_inlineLmeItems;
  if ((unint64_t)inlineLmeItems | *((_QWORD *)v4 + 3))
    v9 = -[NSMutableArray isEqual:](inlineLmeItems, "isEqual:");
  else
    v9 = 1;
LABEL_44:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_requestId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_inputOrigin;
  else
    v4 = 0;
  v5 = -[MXAudioMetadata hash](self->_audioMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v6 = 2654435761 * self->_enablePartialResults;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_isPromptedDictation;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_isPromptedConfirmation;
    goto LABEL_11;
  }
LABEL_10:
  v8 = 0;
LABEL_11:
  v9 = -[NSString hash](self->_foregroundAppId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v10 = 2654435761 * self->_isAutoPunctuationEnabled;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSMutableArray hash](self->_inlineLmeItems, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  MXAudioMetadata *audioMetadata;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[MXBeginRequest setRequestId:](self, "setRequestId:");
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_inputOrigin = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  audioMetadata = self->_audioMetadata;
  v6 = *((_QWORD *)v4 + 1);
  if (audioMetadata)
  {
    if (v6)
      -[MXAudioMetadata mergeFrom:](audioMetadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[MXBeginRequest setAudioMetadata:](self, "setAudioMetadata:");
  }
  v7 = *((_BYTE *)v4 + 52);
  if ((v7 & 2) != 0)
  {
    self->_enablePartialResults = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 52);
    if ((v7 & 0x10) == 0)
    {
LABEL_12:
      if ((v7 & 8) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
  {
    goto LABEL_12;
  }
  self->_isPromptedDictation = *((_BYTE *)v4 + 51);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
LABEL_13:
    self->_isPromptedConfirmation = *((_BYTE *)v4 + 50);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 2))
    -[MXBeginRequest setForegroundAppId:](self, "setForegroundAppId:");
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    self->_isAutoPunctuationEnabled = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 4u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 3);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[MXBeginRequest addInlineLmeItems:](self, "addInlineLmeItems:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (MXAudioMetadata)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_audioMetadata, a3);
}

- (BOOL)enablePartialResults
{
  return self->_enablePartialResults;
}

- (BOOL)isPromptedDictation
{
  return self->_isPromptedDictation;
}

- (BOOL)isPromptedConfirmation
{
  return self->_isPromptedConfirmation;
}

- (NSString)foregroundAppId
{
  return self->_foregroundAppId;
}

- (void)setForegroundAppId:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundAppId, a3);
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (NSMutableArray)inlineLmeItems
{
  return self->_inlineLmeItems;
}

- (void)setInlineLmeItems:(id)a3
{
  objc_storeStrong((id *)&self->_inlineLmeItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_inlineLmeItems, 0);
  objc_storeStrong((id *)&self->_foregroundAppId, 0);
  objc_storeStrong((id *)&self->_audioMetadata, 0);
}

@end
