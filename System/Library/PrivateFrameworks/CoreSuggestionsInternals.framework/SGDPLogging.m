@implementation SGDPLogging

+ (void)logReminder:(id)a3 actionType:(unsigned __int16)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("en")))
  {
    +[SGDPLogging logActionVerb:actionType:](SGDPLogging, "logActionVerb:actionType:", v6, v4);
    +[SGDPLogging logReminderTitle:actionType:](SGDPLogging, "logReminderTitle:actionType:", v6, v4);
  }

}

+ (void)logActionVerb:(id)a3 actionType:(unsigned __int16)a4
{
  int v4;
  id v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD v16[2];

  v4 = a4;
  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CFSTR("com.apple.suggestions.ReminderSuggested");
  switch(v4)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      goto LABEL_17;
    case 1:
      goto LABEL_6;
    case 6:
      v6 = CFSTR("com.apple.suggestions.ReminderConfirmed");
      goto LABEL_6;
    case 7:
      v6 = CFSTR("com.apple.suggestions.ReminderRejected");
LABEL_6:
      +[SGReminderExtractionModel sharedInstance](SGReminderExtractionModel, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "whitelistedVerbInContent:", v9);
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v6);
        v16[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSObject record:](v10, "record:", v11);

        sgRemindersLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "SGDPLogging: Logged actionVerb to DP for reminder", v15, 2u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "SGDPLogging: Unable to log actionVerb for reminder", v15, 2u);
        }

      }
      else
      {
        sgRemindersLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGDPLogging: No actionVerb found in Reminder", v15, 2u);
        }
      }

      break;
    default:
      sgRemindersLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v15 = 0;
        _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "SGDPLogging: No recorder key for reminders log", v15, 2u);
      }
      break;
  }

LABEL_17:
}

+ (void)_logReminderTitleSequence:(id)a3 recorderKey:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = a4;
  v21 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1C3BD4F6C]();
        v13 = (void *)MEMORY[0x1E0D1D330];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 + i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "word:atPosition:", v11, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v15);

        objc_autoreleasePoolPop(v12);
      }
      v9 += i;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D338]), "initWithKey:", v19);
  if (objc_msgSend(v16, "record:", v21))
  {
    sgPrivateLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v27 = obj;
      v28 = 2112;
      v29 = v19;
      _os_log_debug_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEBUG, "SGDPLogging: Logged suggested reminder title sequence %@ to DP with key %@", buf, 0x16u);
    }

    sgRemindersLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_INFO, "SGDPLogging: Logged suggested reminder title to DP", buf, 2u);
    }
  }
  else
  {
    sgRemindersLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v18, OS_LOG_TYPE_ERROR, "SGDPLogging: Unable to log suggested reminder title sequence for reminder", buf, 2u);
    }
  }

}

+ (void)_logReminderTitleUnknownTokens:(id)a3 recorderKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v6);
  if (objc_msgSend(v7, "record:", v5))
  {
    sgPrivateLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_debug_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEBUG, "SGDPLogging: Logged unknown reminder title tokens %@ to DP with key %@", (uint8_t *)&v10, 0x16u);
    }

    sgRemindersLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGDPLogging: Logged unknown reminder title tokens to DP", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    sgRemindersLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "SGDPLogging: Unable to log unknown reminder title tokens for reminder", (uint8_t *)&v10, 2u);
    }
  }

}

+ (void)logReminderTitle:(id)a3 actionType:(unsigned __int16)a4
{
  int v4;
  id v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v8 = CFSTR("com.apple.suggestions.reminders.en_US.TitleSuggested");
  v9 = CFSTR("com.apple.suggestions.reminders.en_US.UnknownTokenSuggested");
  switch(v4)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      break;
    case 1:
      goto LABEL_7;
    case 6:
      v8 = CFSTR("com.apple.suggestions.reminders.en_US.TitleConfirmed");
      v9 = CFSTR("com.apple.suggestions.reminders.en_US.UnknownTokenConfirmed");
      goto LABEL_7;
    case 7:
      v8 = CFSTR("com.apple.suggestions.reminders.en_US.TitleRejected");
      v9 = CFSTR("com.apple.suggestions.reminders.en_US.UnknownTokenRejected");
LABEL_7:
      objc_msgSend(v6, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_tokenizeTitle:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_BOOLMaskVectorForTokens:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_loggableTitleSequence:withMask:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_loggableUnknownTokenSequence:withMask:", v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_logReminderTitleSequence:recorderKey:", v14, v8);
      objc_msgSend(a1, "_logReminderTitleUnknownTokens:recorderKey:", v15, v9);

      break;
    default:
      sgRemindersLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGDPLogging: No recorder key for reminder title log", v16, 2u);
      }

      break;
  }

}

+ (void)logUserCreatedReminderTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D19EC0], "defaultLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("en")))
  {
    objc_msgSend(a1, "_tokenizeTitle:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_BOOLMaskVectorForTokens:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_loggableTitleSequence:withMask:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_loggableUnknownTokenSequence:withMask:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_logReminderTitleSequence:recorderKey:", v8, CFSTR("com.apple.suggestions.reminders.en_US.ReminderTitleCreated"));
    objc_msgSend(a1, "_logReminderTitleUnknownTokens:recorderKey:", v9, CFSTR("com.apple.suggestions.reminders.en_US.ReminderTitleCreatedWithUnknowns"));

  }
  else
  {
    sgRemindersLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGDPLogging: Found unsupported device language %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

+ (id)_tokenizeTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SGPOSTagger sharedInstance](SGPOSTagger, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenizeTextContent:languageHint:", v3, CFSTR("en"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_34388);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_BOOLMaskVectorForTokens:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0D1D318];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithTableClassName:maxOutputBitLength:", CFSTR("_DPHuffmanTable_Reminders_Title_en_US"), 10);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__SGDPLogging__BOOLMaskVectorForTokens___block_invoke;
  v9[3] = &unk_1E7DB7350;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_loggableTitleSequence:(id)a3 withMask:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SGDPLogging__loggableTitleSequence_withMask___block_invoke;
  v9[3] = &unk_1E7DB7378;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "_pas_mappedArrayWithIndexedTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_loggableUnknownTokenSequence:(id)a3 withMask:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SGDPLogging__loggableUnknownTokenSequence_withMask___block_invoke;
  v9[3] = &unk_1E7DB7378;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "_pas_mappedArrayWithIndexedTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __54__SGDPLogging__loggableUnknownTokenSequence_withMask___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(v6, "BOOLValue");

  if ((a1 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

__CFString *__47__SGDPLogging__loggableTitleSequence_withMask___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v6, "BOOLValue");

  if ((_DWORD)a1)
  {
    objc_msgSend(v5, "text");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "tags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v5, "tags");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = CFSTR("unk");
    }
  }

  return v7;
}

id __40__SGDPLogging__BOOLMaskVectorForTokens___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "tokenExist:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v8;
}

BOOL __30__SGDPLogging__tokenizeTitle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "annotationType") == 2;
}

@end
