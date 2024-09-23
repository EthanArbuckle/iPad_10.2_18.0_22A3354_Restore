@implementation _KSTextReplacementHelper

+ (int64_t)validateTextReplacement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  void *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  objc_msgSend(v3, "phrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "length") == 0;
  if ((unint64_t)objc_msgSend(v4, "length") > 0x7D0)
    v6 = 3;
  if ((unint64_t)objc_msgSend(v5, "length") > 0x7D0)
    v6 = 5;
  if (v6)
    goto LABEL_6;
  v9 = objc_msgSend(v4, "_containsIdeographicCharacters");
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    if (objc_msgSend(v5, "length"))
      v13 = 0;
    else
      v13 = v12 == 1;
    if (v13)
      v14 = v9;
    else
      v14 = 1;
    if (v14 == 1)
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v15);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v6 = 4;
          goto LABEL_6;
        }
      }
      if ((objc_msgSend(v5, "_containsEmoji") & 1) != 0)
      {
        v6 = 7;
      }
      else
      {
        v17 = objc_msgSend(v5, "_containsCJKSymbolsAndPunctuation");
        if ((v17 & 1) != 0 || ((v9 ^ 1) & 1) != 0)
        {
          if ((v17 & 1) != 0)
          {
            v6 = 8;
            goto LABEL_6;
          }
        }
        else if (!objc_msgSend(v5, "length"))
        {
          v6 = 9;
          goto LABEL_6;
        }
        if (!objc_msgSend(v5, "_containsIdeographicCharacters"))
        {
          v6 = 0;
          goto LABEL_9;
        }
        v6 = 6;
      }
    }
    else
    {
      v6 = 3;
    }
  }
  else
  {
    v6 = 2;
  }
LABEL_6:
  KSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    +[_KSTextReplacementHelper validateTextReplacement:].cold.1(v6, v7);

LABEL_9:
  return v6;
}

+ (id)errorStringForCode:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) > 0xE)
    return CFSTR("_KSTextReplacementErrorNone");
  else
    return off_24E205D20[a3 + 2];
}

+ (id)textReplaceEntryFromTIDictionaryValue:(id)a3
{
  id v3;
  _KSTextReplacementEntry *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(_KSTextReplacementEntry);
  objc_msgSend(v3, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setPhrase:](v4, "setPhrase:", v5);

  objc_msgSend(v3, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTextReplacementEntry setShortcut:](v4, "setShortcut:", v6);

  objc_msgSend(v3, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_KSTextReplacementEntry setTimestamp:](v4, "setTimestamp:", v7);
  return v4;
}

+ (id)transactionFromTextReplacementEntry:(id)a3 forDelete:(BOOL)a4
{
  id v5;
  _KSTIUserDictionaryEntryValue *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _KSTIUserDictionaryTransaction *v15;
  _KSTIUserDictionaryTransaction *v16;

  v5 = a3;
  v6 = objc_alloc_init(_KSTIUserDictionaryEntryValue);
  objc_msgSend(v5, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTIUserDictionaryEntryValue setPhrase:](v6, "setPhrase:", v7);

  objc_msgSend(v5, "shortcut");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8
    || (v9 = (void *)v8,
        objc_msgSend(v5, "shortcut"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", &stru_24E206F98),
        v10,
        v9,
        v11))
  {
    objc_msgSend(v5, "phrase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShortcut:", v12);

  }
  objc_msgSend(v5, "shortcut");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTIUserDictionaryEntryValue setShortcut:](v6, "setShortcut:", v13);

  objc_msgSend(v5, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTIUserDictionaryEntryValue setTimestamp:](v6, "setTimestamp:", v14);

  v15 = objc_alloc_init(_KSTIUserDictionaryTransaction);
  v16 = v15;
  if (a4)
    -[_KSTIUserDictionaryTransaction setValueToDelete:](v15, "setValueToDelete:", v6);
  else
    -[_KSTIUserDictionaryTransaction setValueToInsert:](v15, "setValueToInsert:", v6);

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 forEntry:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = CFSTR("_KSTextReplacementEntryDidFailErrorKey");
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("KSTextReplacementErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FD8];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("KSTextReplacementErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 failedAdds:(id)a4 failedDeletes:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("_KSTextReplacementUpdateDidFailEntriesKey"));
  if (objc_msgSend(v8, "count"))
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("_KSTextReplacementDeleteDidFailEntriesKey"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("KSTextReplacementErrorDomain"), a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)multipleAddErrors:(id)a3 removeErrors:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("_KSTextReplacementUpdateDidFailErrorsKey"));
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("_KSTextReplacementDeleteDidFailErrorsKey"));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("KSTextReplacementErrorDomain"), 11, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)extractAggdMetricsForTextReplacement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logPhraseWordCount:", objc_msgSend(v5, "wordCount"));

  objc_msgSend(v4, "shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.phraseOnly"), CFSTR("com.apple.keyboard.textReplacement"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[_KSAggdLogger addValue:forDistributionKey:](_KSAggdLogger, "addValue:forDistributionKey:", 1, v8);

  }
}

+ (void)logPhraseWordCount:(int64_t)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  if (logPhraseWordCount__onceToken != -1)
    dispatch_once(&logPhraseWordCount__onceToken, &__block_literal_global_9);
  if ((unint64_t)(a3 - 1) > 4)
  {
    v5 = CFSTR("sixteenToInf");
    if ((unint64_t)a3 < 0x10)
      v5 = CFSTR("elevenToFifteen");
    if (a3 >= 11)
      v4 = v5;
    else
      v4 = CFSTR("sixToTen");
  }
  else
  {
    objc_msgSend((id)logPhraseWordCount__keyStringForCount, "objectAtIndexedSubscript:");
    v4 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (__CFString *)v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.countWords.%@"), CFSTR("com.apple.keyboard.textReplacement"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_KSAggdLogger addValue:forDistributionKey:](_KSAggdLogger, "addValue:forDistributionKey:", 1, v6);

}

+ (id)aggdPrefix
{
  return CFSTR("com.apple.keyboard.textReplacement");
}

+ (void)logAggdValueForSyncIsPull:(BOOL)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("com.apple.keyboard.textReplacement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v5)
    v7 = CFSTR(".pull");
  else
    v7 = CFSTR(".push");
  objc_msgSend(v6, "appendString:", v7);
  if (v4)
    v8 = CFSTR(".success");
  else
    v8 = CFSTR(".fail");
  objc_msgSend(v9, "appendString:", v8);
  +[_KSAggdLogger addValue:forScalarKey:](_KSAggdLogger, "addValue:forScalarKey:", 1, v9);

}

+ (id)appleLanguagesPreference
{
  CFPropertyListRef v2;
  void *v3;
  CFTypeID v4;

  v2 = CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x24BDBD568], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  v3 = (void *)v2;
  if (v2)
  {
    v4 = CFGetTypeID(v2);
    if (v4 != CFArrayGetTypeID())
    {
      CFRelease(v3);
      v3 = 0;
    }
  }
  return v3;
}

+ (id)sampleShortcut
{
  _KSTextReplacementEntry *v2;
  void *v3;
  uint64_t v4;
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

  v2 = objc_alloc_init(_KSTextReplacementEntry);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.TextInput"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_KSTextReplacementHelper appleLanguagesPreference](_KSTextReplacementHelper, "appleLanguagesPreference");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    NSLog(CFSTR("AppleLanguages preference: %@"), v4);
  else
    NSLog(CFSTR("Couldn't read AppleLanguages preference."));
  v6 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v3, "localizations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Preferred localization: %@"), v8);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("TIUserDictionarySampleShortcuts"), CFSTR("plist"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR(">>> Loading sample shortcut from %@"), v10);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("_LOCALIZABLE_"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKey:", CFSTR("shortcut"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_KSTextReplacementEntry setShortcut:](v2, "setShortcut:", v13);

      objc_msgSend(v12, "objectForKey:", CFSTR("target"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_KSTextReplacementEntry setPhrase:](v2, "setPhrase:", v14);

    }
  }
  else
  {
    NSLog(CFSTR(">>> Loading sample shortcut from %@"), 0);
  }

  return v2;
}

+ (void)fetchConfigurationPlistIfNeeded
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v2, "initWithSuiteName:", v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("configPullTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  if (!v5 || fabs(v6) >= 86400.0)
  {
    +[_KSTextReplacementHelper fetchConfigurationPlist](_KSTextReplacementHelper, "fetchConfigurationPlist", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __59___KSTextReplacementHelper_fetchConfigurationPlistIfNeeded__block_invoke;
      v13[3] = &unk_24E204DC0;
      v8 = v12;
      v14 = v8;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("configPullTime"));

      objc_msgSend(v7, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "containsObject:", CFSTR("osxMajorVersForCloudKitSync")))
      {

      }
      else
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("osxMajorVersForCloudKitSync"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v8, "setInteger:forKey:", 10, CFSTR("osxMajorVersForCloudKitSync"));
          objc_msgSend(v8, "setInteger:forKey:", 12, CFSTR("osxMinorVersForCloudKitSync"));
          objc_msgSend(v8, "setInteger:forKey:", 2, CFSTR("osxMinorSubversionForCloudKitSync"));
          objc_msgSend(v8, "setInteger:forKey:", 10, CFSTR("iOSMajorVersForCloudKitSync"));
          objc_msgSend(v8, "setInteger:forKey:", 2, CFSTR("iOSMinorVersForCloudKitSync"));
        }
      }

    }
  }

}

+ (id)fetchConfigurationPlist
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  KSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "+[_KSTextReplacementHelper fetchConfigurationPlist]";
    _os_log_impl(&dword_21DFEB000, v2, OS_LOG_TYPE_INFO, "%s  Fetching configuration plist", buf, 0xCu);
  }

  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/textinput/textinput-1.0.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:", v4);

  if (v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }

  return v6;
}

+ (void)validateTextReplacement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[_KSTextReplacementHelper errorStringForCode:](_KSTextReplacementHelper, "errorStringForCode:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "+[_KSTextReplacementHelper validateTextReplacement:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_21DFEB000, a2, OS_LOG_TYPE_ERROR, "%s  >>> ERROR: invalid TR entry, error: %@", (uint8_t *)&v4, 0x16u);

}

@end
