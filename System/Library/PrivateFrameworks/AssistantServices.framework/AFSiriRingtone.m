@implementation AFSiriRingtone

- (AFSiriRingtone)init
{

  return 0;
}

- (id)_bestVoiceInfoWithCurrentLocale:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  AFVoiceInfo *v14;

  v3 = a3;
  v4 = (void *)VSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("en");
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("US");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), v8, v12);
    v4 = (void *)v13;
  }
  v14 = -[AFVoiceInfo initWithLanguageCode:]([AFVoiceInfo alloc], "initWithLanguageCode:", v4);

  return v14;
}

- (AFSiriRingtone)initWithContacts:(id)a3
{
  id v4;
  AFSiriRingtone *v5;
  uint64_t v6;
  NSArray *contacts;
  AFVoiceInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  AFVoiceInfo *voiceInfo;
  AFVoiceInfo *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AFSiriRingtone;
  v5 = -[AFSiriRingtone init](&v21, sel_init);
  if (!v5)
    goto LABEL_12;
  v6 = objc_msgSend(v4, "copy");
  contacts = v5->_contacts;
  v5->_contacts = (NSArray *)v6;

  +[AFConnection outputVoice](AFConnection, "outputVoice");
  v8 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFVoiceInfo languageCode](v8, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_languageMismatch = objc_msgSend(v11, "hasPrefix:", v10) ^ 1;

  if (v5->_languageMismatch)
  {
    +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "assistantIsEnabled") ^ 1;

    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
    if (!v8)
    {
LABEL_7:
      -[AFSiriRingtone _bestVoiceInfoWithCurrentLocale:](v5, "_bestVoiceInfoWithCurrentLocale:", v9);
      v14 = objc_claimAutoreleasedReturnValue();

      v8 = (AFVoiceInfo *)v14;
      goto LABEL_8;
    }
  }
  if (v13)
    goto LABEL_7;
LABEL_8:
  voiceInfo = v5->_voiceInfo;
  v5->_voiceInfo = v8;
  v16 = v8;

  -[AFVoiceInfo languageCode](v5->_voiceInfo, "languageCode");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (__CFString *)v17;
  else
    v19 = CFSTR("en-US");
  objc_storeStrong((id *)&v5->_voiceLanguage, v19);

LABEL_12:
  return v5;
}

- (NSString)textToSpeak
{
  return (NSString *)-[AFSiriRingtone _generateSpokenTextForContacts:voiceLanguage:displayedCallerID:callerIDType:callDestinationID:callDestinationIDType:callServiceSpeakableName:](self, "_generateSpokenTextForContacts:voiceLanguage:displayedCallerID:callerIDType:callDestinationID:callDestinationIDType:callServiceSpeakableName:", self->_contacts, self->_voiceLanguage, self->_displayedCallerID, self->_callerIDType, self->_callDestinationID, self->_callDestinationIDType, self->_callServiceSpeakableName);
}

- (id)_generateSpokenTextForContacts:(id)a3 voiceLanguage:(id)a4 displayedCallerID:(id)a5 callerIDType:(int64_t)a6 callDestinationID:(id)a7 callDestinationIDType:(int64_t)a8 callServiceSpeakableName:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  if (!objc_msgSend(v15, "count")
    || (-[AFSiriRingtone _spokenTextForContacts:callServiceSpeakableName:languageCode:](self, "_spokenTextForContacts:callServiceSpeakableName:languageCode:", v15, v19, v16), (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!objc_msgSend(v19, "length") && ((unint64_t)(a6 - 3) < 2 || a8 == 1))
    {
      AFRingtoneLocalizedString(CFSTR("UNKNOWN_CALLER"), v16);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else if (v17)
    {
      -[AFSiriRingtone _spokenTextForCallerID:ofType:rawCaller:rawCallerType:languageCode:](self, "_spokenTextForCallerID:ofType:rawCaller:rawCallerType:languageCode:", v17, a6, v18, a8, v16);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v18)
      {
        v20 = 0;
        goto LABEL_12;
      }
      -[AFSiriRingtone _spokenTextForCallDestinationID:ofType:callServiceSpeakableName:languageCode:](self, "_spokenTextForCallDestinationID:ofType:callServiceSpeakableName:languageCode:", v18, a8, v19, v16);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v21;
  }
LABEL_12:

  return v20;
}

- (id)_spokenTextForOneContact:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = a5;
  -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spokenName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (v8)
    {
      AFRingtoneLocalizedString(CFSTR("CONTACT_WITH_TYPE"), v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v13, v12, v8);

    }
    else
    {
      v14 = v11;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_spokenTextForTwoContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "count");
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 > 1)
  {
    -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:", v12, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "givenName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "familyName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "spokenName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "familyName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "spokenName");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (!v15
      || !v17
      || !v26
      || !v24
      || !objc_msgSend(v26, "isEqualToString:", v24)
      || (AFRingtoneLocalizedString(CFSTR("TWO_CONTACTS_SHARED_FAMILY_NAME"), v10),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v21, v15, v18),
          v21,
          !v13))
    {
      if (!v25
        || !v18
        || (AFRingtoneLocalizedString(CFSTR("TWO_CONTACTS"), v10),
            v22 = v15,
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v19, v25, v18),
            v19,
            v15 = v22,
            !v13))
      {
        -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v12, v9, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v23, v9, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }

  }
  else
  {
    -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v12, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_spokenTextForThreeContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") > 2)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "spokenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:", v15, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "spokenName");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v11 = 0;
    if (v14 && v16)
    {
      AFRingtoneLocalizedString(CFSTR("THREE_CONTACTS"), v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v12;
      v18 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      objc_msgSend(v18, "setLocale:", v19);

      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v18, "stringFromNumber:", &unk_1E3AA5710);
      v21 = v15;
      v22 = v13;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v20, "initWithFormat:", v27, v14, v17, v23);

      v13 = v22;
      v15 = v21;

      v12 = v28;
    }
    if (v14 && !v11)
    {
      -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v12, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v11 && v17)
    {
      -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v15, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[AFSiriRingtone _spokenTextForTwoContacts:callServiceSpeakableName:languageCode:](self, "_spokenTextForTwoContacts:callServiceSpeakableName:languageCode:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_spokenTextForContacts:(id)a3 callServiceSpeakableName:(id)a4 languageCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") > 3)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "spokenName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriRingtone _phoneticNamesForContact:languageCode:](self, "_phoneticNamesForContact:languageCode:", v15, v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "spokenName");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v11 = 0;
    if (v14 && v16)
    {
      AFRingtoneLocalizedString(CFSTR("MORE_THAN_THREE_CONTACTS"), v10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v12;
      v18 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      objc_msgSend(v18, "setLocale:", v19);

      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      v28 = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringFromNumber:", v21);
      v22 = v13;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v20, "initWithFormat:", v27, v14, v17, v23);

      v13 = v22;
      v15 = v28;

      v12 = v29;
    }
    if (v14 && !v11)
    {
      -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v12, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v11 && v17)
    {
      -[AFSiriRingtone _spokenTextForOneContact:callServiceSpeakableName:languageCode:](self, "_spokenTextForOneContact:callServiceSpeakableName:languageCode:", v15, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    -[AFSiriRingtone _spokenTextForThreeContacts:callServiceSpeakableName:languageCode:](self, "_spokenTextForThreeContacts:callServiceSpeakableName:languageCode:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_spokenTextForCallerID:(id)a3 ofType:(int64_t)a4 rawCaller:(id)a5 rawCallerType:(int64_t)a6 languageCode:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v12 = a7;
  v13 = a5;
  -[AFSiriRingtone _escapeCallerIDString:forType:](self, "_escapeCallerIDString:forType:", a3, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFSiriRingtone _escapeCallDestinationIDString:forType:](self, "_escapeCallDestinationIDString:forType:", v13, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "length")
    || (AFRingtoneLocalizedString(CFSTR("CALLER_ID_WITH_RAW_CALLER"), v12),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v16, v14, v15),
        v16,
        !v17))
  {
    v17 = v14;
  }
  v18 = v17;

  return v18;
}

- (id)_spokenTextForCallDestinationID:(id)a3 ofType:(int64_t)a4 callServiceSpeakableName:(id)a5 languageCode:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v10 = a5;
  v11 = a6;
  -[AFSiriRingtone _escapeCallDestinationIDString:forType:](self, "_escapeCallDestinationIDString:forType:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
    goto LABEL_6;
  if ((unint64_t)(a4 - 1) > 1)
  {
    AFRingtoneLocalizedString(CFSTR("RAW_CALLER_WITH_SERVICE"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v14, v12, v10);

    if (!v13)
LABEL_6:
      v13 = v12;
  }
  else
  {
    v13 = v10;
    if (!v13)
      goto LABEL_6;
  }

  return v13;
}

- (void)_phoneticInfoForContact:(id)a3 languageCode:(id)a4 firstName:(id *)a5 middleName:(id *)a6 lastName:(id *)a7 nickname:(id *)a8
{
  void (__cdecl *v10)();
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
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
  _QWORD v41[4];
  id v42;

  v10 = (void (__cdecl *)())getCNContactPhonemeDataKey;
  v11 = a4;
  v12 = a3;
  v10();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "JSONObjectWithData:options:error:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v18 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v18, "objectForKey:", CFSTR("phonemeInformation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v37 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    if (v22)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __94__AFSiriRingtone__phoneticInfoForContact_languageCode_firstName_middleName_lastName_nickname___block_invoke;
      v41[3] = &unk_1E3A2CE00;
      v23 = v22;
      v42 = v23;
      v24 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AC0C3C](v41);
      v25 = (void *)*MEMORY[0x1E0D88600];
      v36 = v14;
      v26 = (void *)*MEMORY[0x1E0D88608];
      _FullyQualifiedDomainObjectProperty((void *)*MEMORY[0x1E0D88600], (void *)*MEMORY[0x1E0D88608], (void *)*MEMORY[0x1E0D88F70]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      _FullyQualifiedDomainObjectProperty(v25, v26, (void *)*MEMORY[0x1E0D88F80]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      _FullyQualifiedDomainObjectProperty(v25, v26, (void *)*MEMORY[0x1E0D88F78]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v26;
      v14 = v36;
      _FullyQualifiedDomainObjectProperty(v25, v33, (void *)*MEMORY[0x1E0D88F88]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v24)[2](v24, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
  }
  else
  {

  }
  v23 = 0;
  v28 = 0;
  v30 = 0;
  v32 = 0;
  v35 = 0;
LABEL_14:
  if (a5)
    *a5 = objc_retainAutorelease(v28);
  if (a6)
    *a6 = objc_retainAutorelease(v30);
  if (a7)
    *a7 = objc_retainAutorelease(v32);
  if (a8)
    *a8 = objc_retainAutorelease(v35);

}

- (id)_phoneticNamesForContact:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  AFSiriPhoneticContactNames *v13;
  AFPhonemeMapper *v14;
  AFPhonemeMapper *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v35;
  __CFString *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    -[AFSiriRingtone _phoneticInfoForContact:languageCode:firstName:middleName:lastName:nickname:](self, "_phoneticInfoForContact:languageCode:firstName:middleName:lastName:nickname:", v6, v7, &v41, &v40, &v39, &v38);
    v8 = v41;
    v9 = v40;
    v10 = v39;
    v11 = v38;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("en-IN")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\\toi=x-sampa-internal\\"), v12);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\\toi=orth\\"), v12);
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = CFSTR("\x1B/+");
      v36 = CFSTR("\x1B/+");
    }
    v37 = v7;
    v14 = -[AFPhonemeMapper initWithLanguageCode:]([AFPhonemeMapper alloc], "initWithLanguageCode:", v7);
    v15 = v14;
    if (v14)
    {
      -[AFPhonemeMapper stringByReplacingPhonemesInString:](v14, "stringByReplacingPhonemesInString:", v8);
      v16 = objc_claimAutoreleasedReturnValue();

      -[AFPhonemeMapper stringByReplacingPhonemesInString:](v15, "stringByReplacingPhonemesInString:", v9);
      v17 = objc_claimAutoreleasedReturnValue();

      -[AFPhonemeMapper stringByReplacingPhonemesInString:](v15, "stringByReplacingPhonemesInString:", v10);
      v18 = objc_claimAutoreleasedReturnValue();

      -[AFPhonemeMapper stringByReplacingPhonemesInString:](v15, "stringByReplacingPhonemesInString:", v11);
      v19 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v17;
      v10 = (id)v18;
      v11 = (id)v19;
      v8 = (id)v16;
    }
    -[AFSiriRingtone _addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:](self, "_addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:", v8, v36, v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFSiriRingtone _addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:](self, "_addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:", v9, v36, v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFSiriRingtone _addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:](self, "_addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:", v10, v36, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[AFSiriRingtone _addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:](self, "_addPhoneticEscapeIfNotEmptyNotNil:withStartEscape:withEndEscape:", v11, v36, v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v20, "length"))
    {
      objc_msgSend(v6, "pronunciationGivenName");
      v24 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v24;
    }
    if (!objc_msgSend(v22, "length"))
    {
      objc_msgSend(v6, "pronunciationFamilyName");
      v25 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v25;
    }
    if (!objc_msgSend(v20, "length"))
    {
      objc_msgSend(v6, "phoneticGivenName");
      v26 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v26;
    }
    if (!objc_msgSend(v21, "length"))
    {
      objc_msgSend(v6, "phoneticMiddleName");
      v27 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v27;
    }
    if (!objc_msgSend(v22, "length"))
    {
      objc_msgSend(v6, "phoneticFamilyName");
      v28 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v28;
    }
    v13 = objc_alloc_init(AFSiriPhoneticContactNames);
    -[AFSiriPhoneticContactNames setLanguageCode:](v13, "setLanguageCode:", v37);
    if (objc_msgSend(v20, "length"))
    {
      -[AFSiriPhoneticContactNames setGivenName:](v13, "setGivenName:", v20);
    }
    else
    {
      objc_msgSend(v6, "givenName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSiriPhoneticContactNames setGivenName:](v13, "setGivenName:", v29);

    }
    if (objc_msgSend(v21, "length"))
    {
      -[AFSiriPhoneticContactNames setMiddleName:](v13, "setMiddleName:", v21);
    }
    else
    {
      objc_msgSend(v6, "middleName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSiriPhoneticContactNames setMiddleName:](v13, "setMiddleName:", v30);

    }
    if (objc_msgSend(v22, "length"))
    {
      -[AFSiriPhoneticContactNames setFamilyName:](v13, "setFamilyName:", v22);
    }
    else
    {
      objc_msgSend(v6, "familyName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSiriPhoneticContactNames setFamilyName:](v13, "setFamilyName:", v31);

    }
    if (objc_msgSend(v23, "length"))
    {
      -[AFSiriPhoneticContactNames setNickname:](v13, "setNickname:", v23);
    }
    else
    {
      objc_msgSend(v6, "nickname");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[AFSiriPhoneticContactNames setNickname:](v13, "setNickname:", v32);

    }
    objc_msgSend(v6, "organizationName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFSiriPhoneticContactNames setOrganizationName:](v13, "setOrganizationName:", v33);

    v7 = v37;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_addPhoneticEscapeIfNotEmptyNotNil:(id)a3 withStartEscape:(id)a4 withEndEscape:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v8, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_escapeCallerIDString:(id)a3 forType:(int64_t)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  if ((unint64_t)(a4 - 1) <= 2)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", off_1E3A2CE40[a4 - 1], v5);

    v5 = (id)v6;
  }
  return v5;
}

- (id)_escapeCallDestinationIDString:(id)a3 forType:(int64_t)a4
{
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  __CFString *v9;

  v5 = (__CFString *)a3;
  v6 = v5;
  if (a4 == 1)
  {
    if (softLinkIMStringIsPhoneNumber(v5))
    {
      v7 = CFSTR("\x1B\\tn=phone\\%@\x1B\\tn=normal\\");
      goto LABEL_7;
    }
LABEL_9:
    v9 = &stru_1E3A37708;
    goto LABEL_10;
  }
  if (a4 == 2)
  {
    if ((softLinkIMStringIsEmail(v5) & 1) != 0)
    {
      v7 = CFSTR("\x1B\\tn=email\\%@\x1B\\tn=normal\\");
LABEL_7:
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v7, v6);

      v6 = (__CFString *)v8;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_8:
  v6 = v6;
  v9 = v6;
LABEL_10:

  return v9;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSString)displayedCallerID
{
  return self->_displayedCallerID;
}

- (void)setDisplayedCallerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)callerIDType
{
  return self->_callerIDType;
}

- (void)setCallerIDType:(int64_t)a3
{
  self->_callerIDType = a3;
}

- (NSString)callServiceSpeakableName
{
  return self->_callServiceSpeakableName;
}

- (void)setCallServiceSpeakableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)callDestinationID
{
  return self->_callDestinationID;
}

- (void)setCallDestinationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)callDestinationIDType
{
  return self->_callDestinationIDType;
}

- (void)setCallDestinationIDType:(int64_t)a3
{
  self->_callDestinationIDType = a3;
}

- (AFVoiceInfo)voiceInfo
{
  return self->_voiceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceInfo, 0);
  objc_storeStrong((id *)&self->_callDestinationID, 0);
  objc_storeStrong((id *)&self->_callServiceSpeakableName, 0);
  objc_storeStrong((id *)&self->_displayedCallerID, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

id __94__AFSiriRingtone__phoneticInfoForContact_languageCode_firstName_middleName_lastName_nickname___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  objc_msgSend(v3, "objectForKey:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (objc_msgSend(v6, "length"))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

@end
