@implementation MXBeginDictation

- (BOOL)hasAudioMetadata
{
  return self->_audioMetadata != 0;
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasFieldId
{
  return self->_fieldId != 0;
}

- (BOOL)hasFieldLabel
{
  return self->_fieldLabel != 0;
}

- (BOOL)hasApplicationName
{
  return self->_applicationName != 0;
}

- (BOOL)hasApplicationVersion
{
  return self->_applicationVersion != 0;
}

- (int)keyboardType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_keyboardType;
  else
    return 0;
}

- (void)setKeyboardType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_keyboardType = a3;
}

- (void)setHasKeyboardType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeyboardType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)keyboardTypeAsString:(int)a3
{
  if (a3 < 0x10)
    return off_2512EF798[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeyboardType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KeyboardTypeDefault")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASCIICapable")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Alphabet")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NumbersAndPunctuation")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NumberPad")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DecimalPad")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailAddress")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PhonePad")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NamePhonePad")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Twitter")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WebSearch")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Assistant")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASCIICapableNumberPad")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NonEmoji")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Messages")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)keyboardReturnKey
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_keyboardReturnKey;
  else
    return 0;
}

- (void)setKeyboardReturnKey:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_keyboardReturnKey = a3;
}

- (void)setHasKeyboardReturnKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyboardReturnKey
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)keyboardReturnKeyAsString:(int)a3
{
  if (a3 < 0xC)
    return off_2512EF818[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKeyboardReturnKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KeyboardReturnKeyDefault")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Go")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Google")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Join")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Next")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Route")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Search")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Send")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Yahoo")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Done")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmergencyCall")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSelectedText
{
  return self->_selectedText != 0;
}

- (BOOL)hasPrefixText
{
  return self->_prefixText != 0;
}

- (BOOL)hasPostfixText
{
  return self->_postfixText != 0;
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

- (void)clearLanguages
{
  -[NSMutableArray removeAllObjects](self->_languages, "removeAllObjects");
}

- (void)addLanguages:(id)a3
{
  id v4;
  NSMutableArray *languages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  languages = self->_languages;
  v8 = v4;
  if (!languages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_languages;
    self->_languages = v6;

    v4 = v8;
    languages = self->_languages;
  }
  -[NSMutableArray addObject:](languages, "addObject:", v4);

}

- (unint64_t)languagesCount
{
  return -[NSMutableArray count](self->_languages, "count");
}

- (id)languagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_languages, "objectAtIndex:", a3);
}

+ (Class)languagesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRegion
{
  return self->_region != 0;
}

- (BOOL)hasActivationToken
{
  return self->_activationToken != 0;
}

- (void)setCensorSpeech:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_censorSpeech = a3;
}

- (void)setHasCensorSpeech:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCensorSpeech
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSpeakerIndependentRecognition:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_speakerIndependentRecognition = a3;
}

- (void)setHasSpeakerIndependentRecognition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSpeakerIndependentRecognition
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setSaveRequestAudio:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_saveRequestAudio = a3;
}

- (void)setHasSaveRequestAudio:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSaveRequestAudio
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasKeyboardIdentifier
{
  return self->_keyboardIdentifier != 0;
}

- (void)setEnablePartialResults:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_enablePartialResults = a3;
}

- (void)setHasEnablePartialResults:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEnablePartialResults
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
    return off_2512EF878[a3];
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

- (void)setIsAutoPunctuationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isAutoPunctuationEnabled = a3;
}

- (void)setHasIsAutoPunctuationEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsAutoPunctuationEnabled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)MXBeginDictation;
  -[MXBeginDictation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXBeginDictation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MXAudioMetadata *audioMetadata;
  void *v5;
  NSString *requestId;
  NSString *fieldId;
  NSString *fieldLabel;
  NSString *applicationName;
  NSString *applicationVersion;
  char has;
  uint64_t keyboardType;
  __CFString *v13;
  uint64_t keyboardReturnKey;
  __CFString *v15;
  NSString *selectedText;
  NSString *prefixText;
  NSString *postfixText;
  NSMutableArray *inlineLmeItems;
  NSMutableArray *languages;
  NSString *region;
  NSData *activationToken;
  char v23;
  void *v24;
  NSString *keyboardIdentifier;
  char v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  uint64_t inputOrigin;
  __CFString *v33;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  audioMetadata = self->_audioMetadata;
  if (audioMetadata)
  {
    -[MXAudioMetadata dictionaryRepresentation](audioMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("audio_metadata"));

  }
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("request_id"));
  fieldId = self->_fieldId;
  if (fieldId)
    objc_msgSend(v3, "setObject:forKey:", fieldId, CFSTR("field_id"));
  fieldLabel = self->_fieldLabel;
  if (fieldLabel)
    objc_msgSend(v3, "setObject:forKey:", fieldLabel, CFSTR("field_label"));
  applicationName = self->_applicationName;
  if (applicationName)
    objc_msgSend(v3, "setObject:forKey:", applicationName, CFSTR("application_name"));
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
    objc_msgSend(v3, "setObject:forKey:", applicationVersion, CFSTR("application_version"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    keyboardType = self->_keyboardType;
    if (keyboardType >= 0x10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_keyboardType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_2512EF798[keyboardType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("keyboard_type"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    keyboardReturnKey = self->_keyboardReturnKey;
    if (keyboardReturnKey >= 0xC)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_keyboardReturnKey);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_2512EF818[keyboardReturnKey];
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("keyboard_return_key"));

  }
  selectedText = self->_selectedText;
  if (selectedText)
    objc_msgSend(v3, "setObject:forKey:", selectedText, CFSTR("selected_text"));
  prefixText = self->_prefixText;
  if (prefixText)
    objc_msgSend(v3, "setObject:forKey:", prefixText, CFSTR("prefix_text"));
  postfixText = self->_postfixText;
  if (postfixText)
    objc_msgSend(v3, "setObject:forKey:", postfixText, CFSTR("postfix_text"));
  inlineLmeItems = self->_inlineLmeItems;
  if (inlineLmeItems)
    objc_msgSend(v3, "setObject:forKey:", inlineLmeItems, CFSTR("inline_lme_items"));
  languages = self->_languages;
  if (languages)
    objc_msgSend(v3, "setObject:forKey:", languages, CFSTR("languages"));
  region = self->_region;
  if (region)
    objc_msgSend(v3, "setObject:forKey:", region, CFSTR("region"));
  activationToken = self->_activationToken;
  if (activationToken)
    objc_msgSend(v3, "setObject:forKey:", activationToken, CFSTR("activation_token"));
  v23 = (char)self->_has;
  if ((v23 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_censorSpeech);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("censor_speech"));

    v23 = (char)self->_has;
    if ((v23 & 0x80) == 0)
    {
LABEL_39:
      if ((v23 & 0x40) == 0)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_39;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_speakerIndependentRecognition);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("speaker_independent_recognition"));

  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_40:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_saveRequestAudio);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("save_request_audio"));

  }
LABEL_41:
  keyboardIdentifier = self->_keyboardIdentifier;
  if (keyboardIdentifier)
    objc_msgSend(v3, "setObject:forKey:", keyboardIdentifier, CFSTR("keyboard_identifier"));
  v26 = (char)self->_has;
  if ((v26 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_45;
LABEL_52:
    inputOrigin = self->_inputOrigin;
    if (inputOrigin >= 0x13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_inputOrigin);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_2512EF878[inputOrigin];
    }
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("input_origin"));

    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_46;
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enablePartialResults);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("enable_partial_results"));

  v26 = (char)self->_has;
  if ((v26 & 1) != 0)
    goto LABEL_52;
LABEL_45:
  if ((v26 & 0x20) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAutoPunctuationEnabled);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("is_auto_punctuation_enabled"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXBeginDictationReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_audioMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_requestId)
    PBDataWriterWriteStringField();
  if (self->_fieldId)
    PBDataWriterWriteStringField();
  if (self->_fieldLabel)
    PBDataWriterWriteStringField();
  if (self->_applicationName)
    PBDataWriterWriteStringField();
  if (self->_applicationVersion)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_selectedText)
    PBDataWriterWriteStringField();
  if (self->_prefixText)
    PBDataWriterWriteStringField();
  if (self->_postfixText)
    PBDataWriterWriteStringField();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = self->_inlineLmeItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_languages;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  if (self->_region)
    PBDataWriterWriteStringField();
  if (self->_activationToken)
    PBDataWriterWriteDataField();
  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v16 = (char)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_43:
      if ((v16 & 0x40) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_43;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
LABEL_44:
    PBDataWriterWriteBOOLField();
LABEL_45:
  if (self->_keyboardIdentifier)
    PBDataWriterWriteStringField();
  v17 = (char)self->_has;
  if ((v17 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_49;
LABEL_56:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_51;
    goto LABEL_50;
  }
  PBDataWriterWriteBOOLField();
  v17 = (char)self->_has;
  if ((v17 & 1) != 0)
    goto LABEL_56;
LABEL_49:
  if ((v17 & 0x20) != 0)
LABEL_50:
    PBDataWriterWriteBOOLField();
LABEL_51:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  _BYTE *v14;
  char v15;
  char v16;
  id v17;

  v4 = a3;
  v17 = v4;
  if (self->_audioMetadata)
  {
    objc_msgSend(v4, "setAudioMetadata:");
    v4 = v17;
  }
  if (self->_requestId)
  {
    objc_msgSend(v17, "setRequestId:");
    v4 = v17;
  }
  if (self->_fieldId)
  {
    objc_msgSend(v17, "setFieldId:");
    v4 = v17;
  }
  if (self->_fieldLabel)
  {
    objc_msgSend(v17, "setFieldLabel:");
    v4 = v17;
  }
  if (self->_applicationName)
  {
    objc_msgSend(v17, "setApplicationName:");
    v4 = v17;
  }
  if (self->_applicationVersion)
  {
    objc_msgSend(v17, "setApplicationVersion:");
    v4 = v17;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_keyboardType;
    *((_BYTE *)v4 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_keyboardReturnKey;
    *((_BYTE *)v4 + 144) |= 2u;
  }
  if (self->_selectedText)
    objc_msgSend(v17, "setSelectedText:");
  if (self->_prefixText)
    objc_msgSend(v17, "setPrefixText:");
  if (self->_postfixText)
    objc_msgSend(v17, "setPostfixText:");
  if (-[MXBeginDictation inlineLmeItemsCount](self, "inlineLmeItemsCount"))
  {
    objc_msgSend(v17, "clearInlineLmeItems");
    v6 = -[MXBeginDictation inlineLmeItemsCount](self, "inlineLmeItemsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[MXBeginDictation inlineLmeItemsAtIndex:](self, "inlineLmeItemsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addInlineLmeItems:", v9);

      }
    }
  }
  if (-[MXBeginDictation languagesCount](self, "languagesCount"))
  {
    objc_msgSend(v17, "clearLanguages");
    v10 = -[MXBeginDictation languagesCount](self, "languagesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[MXBeginDictation languagesAtIndex:](self, "languagesAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addLanguages:", v13);

      }
    }
  }
  if (self->_region)
    objc_msgSend(v17, "setRegion:");
  v14 = v17;
  if (self->_activationToken)
  {
    objc_msgSend(v17, "setActivationToken:");
    v14 = v17;
  }
  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
  {
    v14[136] = self->_censorSpeech;
    v14[144] |= 8u;
    v15 = (char)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_37:
      if ((v15 & 0x40) == 0)
        goto LABEL_39;
      goto LABEL_38;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_37;
  }
  v14[140] = self->_speakerIndependentRecognition;
  v14[144] |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_38:
    v14[139] = self->_saveRequestAudio;
    v14[144] |= 0x40u;
  }
LABEL_39:
  if (self->_keyboardIdentifier)
  {
    objc_msgSend(v17, "setKeyboardIdentifier:");
    v14 = v17;
  }
  v16 = (char)self->_has;
  if ((v16 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_43;
LABEL_50:
    *((_DWORD *)v14 + 16) = self->_inputOrigin;
    v14[144] |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  v14[137] = self->_enablePartialResults;
  v14[144] |= 0x10u;
  v16 = (char)self->_has;
  if ((v16 & 1) != 0)
    goto LABEL_50;
LABEL_43:
  if ((v16 & 0x20) != 0)
  {
LABEL_44:
    v14[138] = self->_isAutoPunctuationEnabled;
    v14[144] |= 0x20u;
  }
LABEL_45:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char has;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  char v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MXAudioMetadata copyWithZone:](self->_audioMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v8;

  v10 = -[NSString copyWithZone:](self->_fieldId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_fieldLabel, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSString copyWithZone:](self->_applicationName, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v16 = -[NSString copyWithZone:](self->_applicationVersion, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_keyboardType;
    *(_BYTE *)(v5 + 144) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_keyboardReturnKey;
    *(_BYTE *)(v5 + 144) |= 2u;
  }
  v19 = -[NSString copyWithZone:](self->_selectedText, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v19;

  v21 = -[NSString copyWithZone:](self->_prefixText, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v21;

  v23 = -[NSString copyWithZone:](self->_postfixText, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v23;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v25 = self->_inlineLmeItems;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addInlineLmeItems:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v27);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v31 = self->_languages;
  v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v47 != v34)
          objc_enumerationMutation(v31);
        v36 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v46);
        objc_msgSend((id)v5, "addLanguages:", v36);

      }
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v33);
  }

  v37 = -[NSString copyWithZone:](self->_region, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v37;

  v39 = -[NSData copyWithZone:](self->_activationToken, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v39;

  v41 = (char)self->_has;
  if ((v41 & 8) != 0)
  {
    *(_BYTE *)(v5 + 136) = self->_censorSpeech;
    *(_BYTE *)(v5 + 144) |= 8u;
    v41 = (char)self->_has;
    if ((v41 & 0x80) == 0)
    {
LABEL_21:
      if ((v41 & 0x40) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x80) == 0)
  {
    goto LABEL_21;
  }
  *(_BYTE *)(v5 + 140) = self->_speakerIndependentRecognition;
  *(_BYTE *)(v5 + 144) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_22:
    *(_BYTE *)(v5 + 139) = self->_saveRequestAudio;
    *(_BYTE *)(v5 + 144) |= 0x40u;
  }
LABEL_23:
  v42 = -[NSString copyWithZone:](self->_keyboardIdentifier, "copyWithZone:", a3, (_QWORD)v46);
  v43 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v42;

  v44 = (char)self->_has;
  if ((v44 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_25;
LABEL_32:
    *(_DWORD *)(v5 + 64) = self->_inputOrigin;
    *(_BYTE *)(v5 + 144) |= 1u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_26;
  }
  *(_BYTE *)(v5 + 137) = self->_enablePartialResults;
  *(_BYTE *)(v5 + 144) |= 0x10u;
  v44 = (char)self->_has;
  if ((v44 & 1) != 0)
    goto LABEL_32;
LABEL_25:
  if ((v44 & 0x20) != 0)
  {
LABEL_26:
    *(_BYTE *)(v5 + 138) = self->_isAutoPunctuationEnabled;
    *(_BYTE *)(v5 + 144) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  MXAudioMetadata *audioMetadata;
  NSString *requestId;
  NSString *fieldId;
  NSString *fieldLabel;
  NSString *applicationName;
  NSString *applicationVersion;
  NSString *selectedText;
  NSString *prefixText;
  NSString *postfixText;
  NSMutableArray *inlineLmeItems;
  NSMutableArray *languages;
  NSString *region;
  NSData *activationToken;
  char has;
  NSString *keyboardIdentifier;
  BOOL v20;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  audioMetadata = self->_audioMetadata;
  if ((unint64_t)audioMetadata | *((_QWORD *)v4 + 4))
  {
    if (!-[MXAudioMetadata isEqual:](audioMetadata, "isEqual:"))
      goto LABEL_81;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:"))
      goto LABEL_81;
  }
  fieldId = self->_fieldId;
  if ((unint64_t)fieldId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](fieldId, "isEqual:"))
      goto LABEL_81;
  }
  fieldLabel = self->_fieldLabel;
  if ((unint64_t)fieldLabel | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](fieldLabel, "isEqual:"))
      goto LABEL_81;
  }
  applicationName = self->_applicationName;
  if ((unint64_t)applicationName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](applicationName, "isEqual:"))
      goto LABEL_81;
  }
  applicationVersion = self->_applicationVersion;
  if ((unint64_t)applicationVersion | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](applicationVersion, "isEqual:"))
      goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 4) == 0 || self->_keyboardType != *((_DWORD *)v4 + 21))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 144) & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 2) == 0 || self->_keyboardReturnKey != *((_DWORD *)v4 + 20))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 144) & 2) != 0)
  {
    goto LABEL_81;
  }
  selectedText = self->_selectedText;
  if ((unint64_t)selectedText | *((_QWORD *)v4 + 16)
    && !-[NSString isEqual:](selectedText, "isEqual:"))
  {
    goto LABEL_81;
  }
  prefixText = self->_prefixText;
  if ((unint64_t)prefixText | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](prefixText, "isEqual:"))
      goto LABEL_81;
  }
  postfixText = self->_postfixText;
  if ((unint64_t)postfixText | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](postfixText, "isEqual:"))
      goto LABEL_81;
  }
  inlineLmeItems = self->_inlineLmeItems;
  if ((unint64_t)inlineLmeItems | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](inlineLmeItems, "isEqual:"))
      goto LABEL_81;
  }
  languages = self->_languages;
  if ((unint64_t)languages | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](languages, "isEqual:"))
      goto LABEL_81;
  }
  region = self->_region;
  if ((unint64_t)region | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](region, "isEqual:"))
      goto LABEL_81;
  }
  activationToken = self->_activationToken;
  if ((unint64_t)activationToken | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](activationToken, "isEqual:"))
      goto LABEL_81;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 8) == 0)
      goto LABEL_81;
    if (self->_censorSpeech)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x80) == 0)
      goto LABEL_81;
    if (self->_speakerIndependentRecognition)
    {
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 140))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x40) == 0)
      goto LABEL_81;
    if (self->_saveRequestAudio)
    {
      if (!*((_BYTE *)v4 + 139))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 139))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x40) != 0)
  {
    goto LABEL_81;
  }
  keyboardIdentifier = self->_keyboardIdentifier;
  if ((unint64_t)keyboardIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](keyboardIdentifier, "isEqual:"))
      goto LABEL_81;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x10) == 0)
      goto LABEL_81;
    if (self->_enablePartialResults)
    {
      if (!*((_BYTE *)v4 + 137))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 137))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 1) == 0 || self->_inputOrigin != *((_DWORD *)v4 + 16))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 144) & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 144) & 0x20) != 0)
    {
      if (self->_isAutoPunctuationEnabled)
      {
        if (!*((_BYTE *)v4 + 138))
          goto LABEL_81;
      }
      else if (*((_BYTE *)v4 + 138))
      {
        goto LABEL_81;
      }
      v20 = 1;
      goto LABEL_82;
    }
LABEL_81:
    v20 = 0;
    goto LABEL_82;
  }
  v20 = (*((_BYTE *)v4 + 144) & 0x20) == 0;
LABEL_82:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  unint64_t v33;

  v33 = -[MXAudioMetadata hash](self->_audioMetadata, "hash");
  v3 = -[NSString hash](self->_requestId, "hash");
  v4 = -[NSString hash](self->_fieldId, "hash");
  v5 = -[NSString hash](self->_fieldLabel, "hash");
  v6 = -[NSString hash](self->_applicationName, "hash");
  v7 = -[NSString hash](self->_applicationVersion, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_keyboardType;
  else
    v8 = 0;
  v31 = v8;
  v32 = v7;
  v26 = v6;
  v27 = v3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = -[NSString hash](self->_selectedText, "hash", 2654435761 * self->_keyboardReturnKey);
  else
    v9 = -[NSString hash](self->_selectedText, "hash", 0);
  v10 = v9;
  v11 = -[NSString hash](self->_prefixText, "hash");
  v12 = -[NSString hash](self->_postfixText, "hash");
  v30 = -[NSMutableArray hash](self->_inlineLmeItems, "hash");
  v29 = -[NSMutableArray hash](self->_languages, "hash");
  v28 = -[NSString hash](self->_region, "hash");
  v13 = -[NSData hash](self->_activationToken, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v14 = 2654435761 * self->_censorSpeech;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_9;
  }
  else
  {
    v14 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_9:
      v15 = 2654435761 * self->_speakerIndependentRecognition;
      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_12:
  v25 = v10;
  v16 = v13;
  v17 = v5;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    v18 = 2654435761 * self->_saveRequestAudio;
  else
    v18 = 0;
  v19 = -[NSString hash](self->_keyboardIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v20 = 2654435761 * self->_enablePartialResults;
  else
    v20 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v21 = 2654435761 * self->_inputOrigin;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_20;
LABEL_22:
    v22 = 0;
    return v27 ^ v33 ^ v4 ^ v17 ^ v26 ^ v32 ^ v31 ^ v24 ^ v25 ^ v11 ^ v12 ^ v30 ^ v29 ^ v28 ^ v16 ^ v14 ^ v15 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
  v21 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_22;
LABEL_20:
  v22 = 2654435761 * self->_isAutoPunctuationEnabled;
  return v27 ^ v33 ^ v4 ^ v17 ^ v26 ^ v32 ^ v31 ^ v24 ^ v25 ^ v11 ^ v12 ^ v30 ^ v29 ^ v28 ^ v16 ^ v14 ^ v15 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  char v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  audioMetadata = self->_audioMetadata;
  v6 = *((_QWORD *)v4 + 4);
  if (audioMetadata)
  {
    if (v6)
      -[MXAudioMetadata mergeFrom:](audioMetadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[MXBeginDictation setAudioMetadata:](self, "setAudioMetadata:");
  }
  if (*((_QWORD *)v4 + 15))
    -[MXBeginDictation setRequestId:](self, "setRequestId:");
  if (*((_QWORD *)v4 + 5))
    -[MXBeginDictation setFieldId:](self, "setFieldId:");
  if (*((_QWORD *)v4 + 6))
    -[MXBeginDictation setFieldLabel:](self, "setFieldLabel:");
  if (*((_QWORD *)v4 + 2))
    -[MXBeginDictation setApplicationName:](self, "setApplicationName:");
  if (*((_QWORD *)v4 + 3))
    -[MXBeginDictation setApplicationVersion:](self, "setApplicationVersion:");
  v7 = *((_BYTE *)v4 + 144);
  if ((v7 & 4) != 0)
  {
    self->_keyboardType = *((_DWORD *)v4 + 21);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v4 + 144);
  }
  if ((v7 & 2) != 0)
  {
    self->_keyboardReturnKey = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 16))
    -[MXBeginDictation setSelectedText:](self, "setSelectedText:");
  if (*((_QWORD *)v4 + 13))
    -[MXBeginDictation setPrefixText:](self, "setPrefixText:");
  if (*((_QWORD *)v4 + 12))
    -[MXBeginDictation setPostfixText:](self, "setPostfixText:");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = *((id *)v4 + 7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        -[MXBeginDictation addInlineLmeItems:](self, "addInlineLmeItems:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v10);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = *((id *)v4 + 11);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        -[MXBeginDictation addLanguages:](self, "addLanguages:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 14))
    -[MXBeginDictation setRegion:](self, "setRegion:");
  if (*((_QWORD *)v4 + 1))
    -[MXBeginDictation setActivationToken:](self, "setActivationToken:");
  v18 = *((_BYTE *)v4 + 144);
  if ((v18 & 8) != 0)
  {
    self->_censorSpeech = *((_BYTE *)v4 + 136);
    *(_BYTE *)&self->_has |= 8u;
    v18 = *((_BYTE *)v4 + 144);
    if ((v18 & 0x80) == 0)
    {
LABEL_46:
      if ((v18 & 0x40) == 0)
        goto LABEL_48;
      goto LABEL_47;
    }
  }
  else if ((*((_BYTE *)v4 + 144) & 0x80) == 0)
  {
    goto LABEL_46;
  }
  self->_speakerIndependentRecognition = *((_BYTE *)v4 + 140);
  *(_BYTE *)&self->_has |= 0x80u;
  if ((*((_BYTE *)v4 + 144) & 0x40) != 0)
  {
LABEL_47:
    self->_saveRequestAudio = *((_BYTE *)v4 + 139);
    *(_BYTE *)&self->_has |= 0x40u;
  }
LABEL_48:
  if (*((_QWORD *)v4 + 9))
    -[MXBeginDictation setKeyboardIdentifier:](self, "setKeyboardIdentifier:");
  v19 = *((_BYTE *)v4 + 144);
  if ((v19 & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 144) & 1) == 0)
      goto LABEL_52;
LABEL_59:
    self->_inputOrigin = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 144) & 0x20) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
  self->_enablePartialResults = *((_BYTE *)v4 + 137);
  *(_BYTE *)&self->_has |= 0x10u;
  v19 = *((_BYTE *)v4 + 144);
  if ((v19 & 1) != 0)
    goto LABEL_59;
LABEL_52:
  if ((v19 & 0x20) != 0)
  {
LABEL_53:
    self->_isAutoPunctuationEnabled = *((_BYTE *)v4 + 138);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_54:

}

- (MXAudioMetadata)audioMetadata
{
  return self->_audioMetadata;
}

- (void)setAudioMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_audioMetadata, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSString)fieldId
{
  return self->_fieldId;
}

- (void)setFieldId:(id)a3
{
  objc_storeStrong((id *)&self->_fieldId, a3);
}

- (NSString)fieldLabel
{
  return self->_fieldLabel;
}

- (void)setFieldLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fieldLabel, a3);
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
  objc_storeStrong((id *)&self->_applicationName, a3);
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationVersion:(id)a3
{
  objc_storeStrong((id *)&self->_applicationVersion, a3);
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_storeStrong((id *)&self->_selectedText, a3);
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setPrefixText:(id)a3
{
  objc_storeStrong((id *)&self->_prefixText, a3);
}

- (NSString)postfixText
{
  return self->_postfixText;
}

- (void)setPostfixText:(id)a3
{
  objc_storeStrong((id *)&self->_postfixText, a3);
}

- (NSMutableArray)inlineLmeItems
{
  return self->_inlineLmeItems;
}

- (void)setInlineLmeItems:(id)a3
{
  objc_storeStrong((id *)&self->_inlineLmeItems, a3);
}

- (NSMutableArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_languages, a3);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSData)activationToken
{
  return self->_activationToken;
}

- (void)setActivationToken:(id)a3
{
  objc_storeStrong((id *)&self->_activationToken, a3);
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)speakerIndependentRecognition
{
  return self->_speakerIndependentRecognition;
}

- (BOOL)saveRequestAudio
{
  return self->_saveRequestAudio;
}

- (NSString)keyboardIdentifier
{
  return self->_keyboardIdentifier;
}

- (void)setKeyboardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardIdentifier, a3);
}

- (BOOL)enablePartialResults
{
  return self->_enablePartialResults;
}

- (BOOL)isAutoPunctuationEnabled
{
  return self->_isAutoPunctuationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_postfixText, 0);
  objc_storeStrong((id *)&self->_languages, 0);
  objc_storeStrong((id *)&self->_keyboardIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineLmeItems, 0);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_storeStrong((id *)&self->_fieldId, 0);
  objc_storeStrong((id *)&self->_audioMetadata, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_activationToken, 0);
}

@end
