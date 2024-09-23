@implementation _INPBRunVoiceCommandIntentResponse

- (void)setAppBundleId:(id)a3
{
  NSString *v4;
  NSString *appBundleId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  appBundleId = self->_appBundleId;
  self->_appBundleId = v4;

}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setContinueRunning:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_continueRunning = a3;
}

- (BOOL)hasContinueRunning
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasContinueRunning:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setCustomResponsesDisabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_customResponsesDisabled = a3;
}

- (BOOL)hasCustomResponsesDisabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasCustomResponsesDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setIntentCategory:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_intentCategory = a3;
  }
}

- (BOOL)hasIntentCategory
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)intentCategoryAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x15 && ((0x1FFDFFu >> v3) & 1) != 0)
  {
    v4 = off_1E228F8C0[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsIntentCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_INFORMATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_AUDIO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_VIDEO")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_ORDER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_NAVIGATION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_START")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SHARE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CREATE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_TOGGLE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_DOWNLOAD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_LOG")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CHECK_IN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_WORKFLOW")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_REQUEST")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_SET")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CALL_AUDIO")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_CALL_VIDEO")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_PLAY_SOUND")) & 1) != 0)
  {
    v4 = 20;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY_USER_ACTIVITY")))
  {
    v4 = 21;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setInterstitialDisabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_interstitialDisabled = a3;
}

- (BOOL)hasInterstitialDisabled
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasInterstitialDisabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setLocalizedAppName:(id)a3
{
  NSString *v4;
  NSString *localizedAppName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localizedAppName = self->_localizedAppName;
  self->_localizedAppName = v4;

}

- (BOOL)hasLocalizedAppName
{
  return self->_localizedAppName != 0;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (BOOL)hasParameters
{
  return self->_parameters != 0;
}

- (void)setPrefersExecutionOnCompanion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_prefersExecutionOnCompanion = a3;
}

- (BOOL)hasPrefersExecutionOnCompanion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasPrefersExecutionOnCompanion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setResponseTemplate:(id)a3
{
  NSString *v4;
  NSString *responseTemplate;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  responseTemplate = self->_responseTemplate;
  self->_responseTemplate = v4;

}

- (BOOL)hasResponseTemplate
{
  return self->_responseTemplate != 0;
}

- (void)setSteps:(id)a3
{
  NSArray *v4;
  NSArray *steps;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  steps = self->_steps;
  self->_steps = v4;

}

- (void)clearSteps
{
  -[NSArray removeAllObjects](self->_steps, "removeAllObjects");
}

- (void)addStep:(id)a3
{
  id v4;
  NSArray *steps;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  steps = self->_steps;
  v8 = v4;
  if (!steps)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_steps;
    self->_steps = v6;

    v4 = v8;
    steps = self->_steps;
  }
  -[NSArray addObject:](steps, "addObject:", v4);

}

- (unint64_t)stepsCount
{
  return -[NSArray count](self->_steps, "count");
}

- (id)stepAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", a3);
}

- (void)setToggleState:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xDF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x20;
    self->_toggleState = a3;
  }
}

- (BOOL)hasToggleState
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasToggleState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (id)toggleStateAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("ON");
  if (a3 == 2)
  {
    v3 = CFSTR("OFF");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsToggleState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("OFF")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setUnderlyingIntent:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingIntent, a3);
}

- (BOOL)hasUnderlyingIntent
{
  return self->_underlyingIntent != 0;
}

- (void)setUnderlyingIntentResponse:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingIntentResponse, a3);
}

- (BOOL)hasUnderlyingIntentResponse
{
  return self->_underlyingIntentResponse != 0;
}

- (void)setUnderlyingIntentTitle:(id)a3
{
  NSString *v4;
  NSString *underlyingIntentTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  underlyingIntentTitle = self->_underlyingIntentTitle;
  self->_underlyingIntentTitle = v4;

}

- (BOOL)hasUnderlyingIntentTitle
{
  return self->_underlyingIntentTitle != 0;
}

- (void)setVerb:(id)a3
{
  NSString *v4;
  NSString *verb;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  verb = self->_verb;
  self->_verb = v4;

}

- (BOOL)hasVerb
{
  return self->_verb != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRunVoiceCommandIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBRunVoiceCommandIntentResponse appBundleId](self, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_INPBRunVoiceCommandIntentResponse hasContinueRunning](self, "hasContinueRunning"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBRunVoiceCommandIntentResponse hasIntentCategory](self, "hasIntentCategory"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBRunVoiceCommandIntentResponse hasInterstitialDisabled](self, "hasInterstitialDisabled"))
    PBDataWriterWriteBOOLField();
  -[_INPBRunVoiceCommandIntentResponse localizedAppName](self, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBRunVoiceCommandIntentResponse parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBRunVoiceCommandIntentResponse parameters](self, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBRunVoiceCommandIntentResponse hasPrefersExecutionOnCompanion](self, "hasPrefersExecutionOnCompanion"))
    PBDataWriterWriteBOOLField();
  -[_INPBRunVoiceCommandIntentResponse responseTemplate](self, "responseTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_steps;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  if (-[_INPBRunVoiceCommandIntentResponse hasToggleState](self, "hasToggleState", v21))
    PBDataWriterWriteInt32Field();
  -[_INPBRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBRunVoiceCommandIntentResponse underlyingIntentTitle](self, "underlyingIntentTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    PBDataWriterWriteStringField();
  -[_INPBRunVoiceCommandIntentResponse verb](self, "verb");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    PBDataWriterWriteStringField();

}

- (_INPBRunVoiceCommandIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBRunVoiceCommandIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRunVoiceCommandIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBRunVoiceCommandIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBRunVoiceCommandIntentResponse initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBRunVoiceCommandIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBRunVoiceCommandIntentResponse *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v5 = -[_INPBRunVoiceCommandIntentResponse init](+[_INPBRunVoiceCommandIntentResponse allocWithZone:](_INPBRunVoiceCommandIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_appBundleId, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setAppBundleId:](v5, "setAppBundleId:", v6);

  if (-[_INPBRunVoiceCommandIntentResponse hasContinueRunning](self, "hasContinueRunning"))
    -[_INPBRunVoiceCommandIntentResponse setContinueRunning:](v5, "setContinueRunning:", -[_INPBRunVoiceCommandIntentResponse continueRunning](self, "continueRunning"));
  if (-[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled"))
    -[_INPBRunVoiceCommandIntentResponse setCustomResponsesDisabled:](v5, "setCustomResponsesDisabled:", -[_INPBRunVoiceCommandIntentResponse customResponsesDisabled](self, "customResponsesDisabled"));
  if (-[_INPBRunVoiceCommandIntentResponse hasIntentCategory](self, "hasIntentCategory"))
    -[_INPBRunVoiceCommandIntentResponse setIntentCategory:](v5, "setIntentCategory:", -[_INPBRunVoiceCommandIntentResponse intentCategory](self, "intentCategory"));
  if (-[_INPBRunVoiceCommandIntentResponse hasInterstitialDisabled](self, "hasInterstitialDisabled"))
    -[_INPBRunVoiceCommandIntentResponse setInterstitialDisabled:](v5, "setInterstitialDisabled:", -[_INPBRunVoiceCommandIntentResponse interstitialDisabled](self, "interstitialDisabled"));
  v7 = (void *)-[NSString copyWithZone:](self->_localizedAppName, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setLocalizedAppName:](v5, "setLocalizedAppName:", v7);

  v8 = -[_INPBDictionary copyWithZone:](self->_parameters, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setParameters:](v5, "setParameters:", v8);

  if (-[_INPBRunVoiceCommandIntentResponse hasPrefersExecutionOnCompanion](self, "hasPrefersExecutionOnCompanion"))
    -[_INPBRunVoiceCommandIntentResponse setPrefersExecutionOnCompanion:](v5, "setPrefersExecutionOnCompanion:", -[_INPBRunVoiceCommandIntentResponse prefersExecutionOnCompanion](self, "prefersExecutionOnCompanion"));
  v9 = (void *)-[NSString copyWithZone:](self->_responseTemplate, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setResponseTemplate:](v5, "setResponseTemplate:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_steps, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setSteps:](v5, "setSteps:", v10);

  if (-[_INPBRunVoiceCommandIntentResponse hasToggleState](self, "hasToggleState"))
    -[_INPBRunVoiceCommandIntentResponse setToggleState:](v5, "setToggleState:", -[_INPBRunVoiceCommandIntentResponse toggleState](self, "toggleState"));
  v11 = -[_INPBArchivedObject copyWithZone:](self->_underlyingIntent, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setUnderlyingIntent:](v5, "setUnderlyingIntent:", v11);

  v12 = -[_INPBArchivedObject copyWithZone:](self->_underlyingIntentResponse, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setUnderlyingIntentResponse:](v5, "setUnderlyingIntentResponse:", v12);

  v13 = (void *)-[NSString copyWithZone:](self->_underlyingIntentTitle, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setUnderlyingIntentTitle:](v5, "setUnderlyingIntentTitle:", v13);

  v14 = (void *)-[NSString copyWithZone:](self->_verb, "copyWithZone:", a3);
  -[_INPBRunVoiceCommandIntentResponse setVerb:](v5, "setVerb:", v14);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int continueRunning;
  int v14;
  int customResponsesDisabled;
  int v16;
  int intentCategory;
  int v18;
  int interstitialDisabled;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  int prefersExecutionOnCompanion;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  int toggleState;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  BOOL v64;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_71;
  -[_INPBRunVoiceCommandIntentResponse appBundleId](self, "appBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse appBundleId](self, "appBundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBRunVoiceCommandIntentResponse appBundleId](self, "appBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_71;
  }
  else
  {

  }
  v12 = -[_INPBRunVoiceCommandIntentResponse hasContinueRunning](self, "hasContinueRunning");
  if (v12 != objc_msgSend(v4, "hasContinueRunning"))
    goto LABEL_71;
  if (-[_INPBRunVoiceCommandIntentResponse hasContinueRunning](self, "hasContinueRunning"))
  {
    if (objc_msgSend(v4, "hasContinueRunning"))
    {
      continueRunning = self->_continueRunning;
      if (continueRunning != objc_msgSend(v4, "continueRunning"))
        goto LABEL_71;
    }
  }
  v14 = -[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled");
  if (v14 != objc_msgSend(v4, "hasCustomResponsesDisabled"))
    goto LABEL_71;
  if (-[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled"))
  {
    if (objc_msgSend(v4, "hasCustomResponsesDisabled"))
    {
      customResponsesDisabled = self->_customResponsesDisabled;
      if (customResponsesDisabled != objc_msgSend(v4, "customResponsesDisabled"))
        goto LABEL_71;
    }
  }
  v16 = -[_INPBRunVoiceCommandIntentResponse hasIntentCategory](self, "hasIntentCategory");
  if (v16 != objc_msgSend(v4, "hasIntentCategory"))
    goto LABEL_71;
  if (-[_INPBRunVoiceCommandIntentResponse hasIntentCategory](self, "hasIntentCategory"))
  {
    if (objc_msgSend(v4, "hasIntentCategory"))
    {
      intentCategory = self->_intentCategory;
      if (intentCategory != objc_msgSend(v4, "intentCategory"))
        goto LABEL_71;
    }
  }
  v18 = -[_INPBRunVoiceCommandIntentResponse hasInterstitialDisabled](self, "hasInterstitialDisabled");
  if (v18 != objc_msgSend(v4, "hasInterstitialDisabled"))
    goto LABEL_71;
  if (-[_INPBRunVoiceCommandIntentResponse hasInterstitialDisabled](self, "hasInterstitialDisabled"))
  {
    if (objc_msgSend(v4, "hasInterstitialDisabled"))
    {
      interstitialDisabled = self->_interstitialDisabled;
      if (interstitialDisabled != objc_msgSend(v4, "interstitialDisabled"))
        goto LABEL_71;
    }
  }
  -[_INPBRunVoiceCommandIntentResponse localizedAppName](self, "localizedAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse localizedAppName](self, "localizedAppName");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    -[_INPBRunVoiceCommandIntentResponse localizedAppName](self, "localizedAppName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedAppName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (!v24)
      goto LABEL_71;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntentResponse parameters](self, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse parameters](self, "parameters");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_INPBRunVoiceCommandIntentResponse parameters](self, "parameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_71;
  }
  else
  {

  }
  v30 = -[_INPBRunVoiceCommandIntentResponse hasPrefersExecutionOnCompanion](self, "hasPrefersExecutionOnCompanion");
  if (v30 != objc_msgSend(v4, "hasPrefersExecutionOnCompanion"))
    goto LABEL_71;
  if (-[_INPBRunVoiceCommandIntentResponse hasPrefersExecutionOnCompanion](self, "hasPrefersExecutionOnCompanion"))
  {
    if (objc_msgSend(v4, "hasPrefersExecutionOnCompanion"))
    {
      prefersExecutionOnCompanion = self->_prefersExecutionOnCompanion;
      if (prefersExecutionOnCompanion != objc_msgSend(v4, "prefersExecutionOnCompanion"))
        goto LABEL_71;
    }
  }
  -[_INPBRunVoiceCommandIntentResponse responseTemplate](self, "responseTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse responseTemplate](self, "responseTemplate");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBRunVoiceCommandIntentResponse responseTemplate](self, "responseTemplate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseTemplate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_71;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntentResponse steps](self, "steps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "steps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse steps](self, "steps");
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = (void *)v37;
    -[_INPBRunVoiceCommandIntentResponse steps](self, "steps");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "steps");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v39, "isEqual:", v40);

    if (!v41)
      goto LABEL_71;
  }
  else
  {

  }
  v42 = -[_INPBRunVoiceCommandIntentResponse hasToggleState](self, "hasToggleState");
  if (v42 != objc_msgSend(v4, "hasToggleState"))
    goto LABEL_71;
  if (-[_INPBRunVoiceCommandIntentResponse hasToggleState](self, "hasToggleState"))
  {
    if (objc_msgSend(v4, "hasToggleState"))
    {
      toggleState = self->_toggleState;
      if (toggleState != objc_msgSend(v4, "toggleState"))
        goto LABEL_71;
    }
  }
  -[_INPBRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_INPBRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingIntent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_71;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingIntentResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_INPBRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingIntentResponse");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_71;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntentResponse underlyingIntentTitle](self, "underlyingIntentTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingIntentTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_70;
  -[_INPBRunVoiceCommandIntentResponse underlyingIntentTitle](self, "underlyingIntentTitle");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[_INPBRunVoiceCommandIntentResponse underlyingIntentTitle](self, "underlyingIntentTitle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "underlyingIntentTitle");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_71;
  }
  else
  {

  }
  -[_INPBRunVoiceCommandIntentResponse verb](self, "verb");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "verb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBRunVoiceCommandIntentResponse verb](self, "verb");
    v59 = objc_claimAutoreleasedReturnValue();
    if (!v59)
    {

LABEL_74:
      v64 = 1;
      goto LABEL_72;
    }
    v60 = (void *)v59;
    -[_INPBRunVoiceCommandIntentResponse verb](self, "verb");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "verb");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if ((v63 & 1) != 0)
      goto LABEL_74;
  }
  else
  {
LABEL_70:

  }
LABEL_71:
  v64 = 0;
LABEL_72:

  return v64;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  unint64_t v14;
  unint64_t v15;
  NSUInteger v16;
  uint64_t v18;
  NSUInteger v19;

  v19 = -[NSString hash](self->_appBundleId, "hash");
  if (-[_INPBRunVoiceCommandIntentResponse hasContinueRunning](self, "hasContinueRunning"))
    v3 = -[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled", 2654435761 * self->_continueRunning);
  else
    v3 = -[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled", 0);
  if (v3)
    v4 = 2654435761 * self->_customResponsesDisabled;
  else
    v4 = 0;
  if (-[_INPBRunVoiceCommandIntentResponse hasIntentCategory](self, "hasIntentCategory"))
    v5 = 2654435761 * self->_intentCategory;
  else
    v5 = 0;
  if (-[_INPBRunVoiceCommandIntentResponse hasInterstitialDisabled](self, "hasInterstitialDisabled"))
    v6 = 2654435761 * self->_interstitialDisabled;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_localizedAppName, "hash");
  v8 = -[_INPBDictionary hash](self->_parameters, "hash");
  if (-[_INPBRunVoiceCommandIntentResponse hasPrefersExecutionOnCompanion](self, "hasPrefersExecutionOnCompanion"))
    v9 = 2654435761 * self->_prefersExecutionOnCompanion;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_responseTemplate, "hash");
  v11 = -[NSArray hash](self->_steps, "hash");
  if (-[_INPBRunVoiceCommandIntentResponse hasToggleState](self, "hasToggleState"))
    v12 = 2654435761 * self->_toggleState;
  else
    v12 = 0;
  v13 = v18 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v14 = v11 ^ v12 ^ -[_INPBArchivedObject hash](self->_underlyingIntent, "hash");
  v15 = v13 ^ v14 ^ -[_INPBArchivedObject hash](self->_underlyingIntentResponse, "hash");
  v16 = -[NSString hash](self->_underlyingIntentTitle, "hash");
  return v15 ^ v16 ^ -[NSString hash](self->_verb, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_appBundleId)
  {
    -[_INPBRunVoiceCommandIntentResponse appBundleId](self, "appBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("appBundleId"));

  }
  if (-[_INPBRunVoiceCommandIntentResponse hasContinueRunning](self, "hasContinueRunning"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse continueRunning](self, "continueRunning"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("continueRunning"));

  }
  if (-[_INPBRunVoiceCommandIntentResponse hasCustomResponsesDisabled](self, "hasCustomResponsesDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse customResponsesDisabled](self, "customResponsesDisabled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("customResponsesDisabled"));

  }
  if (-[_INPBRunVoiceCommandIntentResponse hasIntentCategory](self, "hasIntentCategory"))
  {
    v8 = -[_INPBRunVoiceCommandIntentResponse intentCategory](self, "intentCategory");
    v9 = v8 - 1;
    if ((v8 - 1) < 0x15 && ((0x1FFDFFu >> v9) & 1) != 0)
    {
      v10 = off_1E228F8C0[v9];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("intentCategory"));

  }
  if (-[_INPBRunVoiceCommandIntentResponse hasInterstitialDisabled](self, "hasInterstitialDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse interstitialDisabled](self, "interstitialDisabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("interstitialDisabled"));

  }
  if (self->_localizedAppName)
  {
    -[_INPBRunVoiceCommandIntentResponse localizedAppName](self, "localizedAppName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("localizedAppName"));

  }
  -[_INPBRunVoiceCommandIntentResponse parameters](self, "parameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("parameters"));

  if (-[_INPBRunVoiceCommandIntentResponse hasPrefersExecutionOnCompanion](self, "hasPrefersExecutionOnCompanion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse prefersExecutionOnCompanion](self, "prefersExecutionOnCompanion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("prefersExecutionOnCompanion"));

  }
  if (self->_responseTemplate)
  {
    -[_INPBRunVoiceCommandIntentResponse responseTemplate](self, "responseTemplate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("responseTemplate"));

  }
  if (-[NSArray count](self->_steps, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = self->_steps;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "dictionaryRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v22);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("step"));
  }
  if (-[_INPBRunVoiceCommandIntentResponse hasToggleState](self, "hasToggleState"))
  {
    v26 = -[_INPBRunVoiceCommandIntentResponse toggleState](self, "toggleState");
    if ((_DWORD)v26 == 1)
    {
      v27 = CFSTR("ON");
    }
    else if ((_DWORD)v26 == 2)
    {
      v27 = CFSTR("OFF");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("toggleState"));

  }
  -[_INPBRunVoiceCommandIntentResponse underlyingIntent](self, "underlyingIntent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("underlyingIntent"));

  -[_INPBRunVoiceCommandIntentResponse underlyingIntentResponse](self, "underlyingIntentResponse");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("underlyingIntentResponse"));

  if (self->_underlyingIntentTitle)
  {
    -[_INPBRunVoiceCommandIntentResponse underlyingIntentTitle](self, "underlyingIntentTitle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("underlyingIntentTitle"));

  }
  if (self->_verb)
  {
    -[_INPBRunVoiceCommandIntentResponse verb](self, "verb");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("verb"));

  }
  return v3;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (BOOL)continueRunning
{
  return self->_continueRunning;
}

- (BOOL)customResponsesDisabled
{
  return self->_customResponsesDisabled;
}

- (int)intentCategory
{
  return self->_intentCategory;
}

- (BOOL)interstitialDisabled
{
  return self->_interstitialDisabled;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (_INPBDictionary)parameters
{
  return self->_parameters;
}

- (BOOL)prefersExecutionOnCompanion
{
  return self->_prefersExecutionOnCompanion;
}

- (NSString)responseTemplate
{
  return self->_responseTemplate;
}

- (NSArray)steps
{
  return self->_steps;
}

- (int)toggleState
{
  return self->_toggleState;
}

- (_INPBArchivedObject)underlyingIntent
{
  return self->_underlyingIntent;
}

- (_INPBArchivedObject)underlyingIntentResponse
{
  return self->_underlyingIntentResponse;
}

- (NSString)underlyingIntentTitle
{
  return self->_underlyingIntentTitle;
}

- (NSString)verb
{
  return self->_verb;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verb, 0);
  objc_storeStrong((id *)&self->_underlyingIntentTitle, 0);
  objc_storeStrong((id *)&self->_underlyingIntentResponse, 0);
  objc_storeStrong((id *)&self->_underlyingIntent, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_responseTemplate, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
