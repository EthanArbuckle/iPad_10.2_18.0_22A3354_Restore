@implementation CNMetricsUIReporter

- (id)eventKeyPrefix
{
  return CFSTR("com.apple.contacts.ui.");
}

- (void)logContactShownforApplication:(id)a3
{
  -[CNMetricsReporter logSimpleEvent:forApplication:andLog:](self, "logSimpleEvent:forApplication:andLog:", CFSTR("contactShown"), a3, 0);
}

- (void)logSearchUsageforApplication:(id)a3
{
  -[CNMetricsReporter logSimpleEvent:forApplication:andLog:](self, "logSimpleEvent:forApplication:andLog:", CFSTR("searchPerformed"), a3, 0);
}

- (void)logSearchActionWithDictionary:(id)a3
{
  -[CNMetricsReporter sendDictionary:forEvent:andLog:](self, "sendDictionary:forEvent:andLog:", a3, CFSTR("searchAction"), 0);
}

- (void)logSearchResultsFetchedforApplication:(id)a3 fromSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v4 = a4;
  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = [v6 alloc];
  v13[0] = v7;
  v12[0] = CFSTR("application");
  v12[1] = CFSTR("isSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("isSelection");
  v13[1] = v9;
  v13[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDictionary:", v10);
  -[CNMetricsUIReporter logSearchActionWithDictionary:](self, "logSearchActionWithDictionary:", v11);

}

- (void)logSearchResultsSelectedforApplication:(id)a3 fromSuggestions:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v4 = a4;
  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = [v6 alloc];
  v13[0] = v7;
  v12[0] = CFSTR("application");
  v12[1] = CFSTR("isSuggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("isSelection");
  v13[1] = v9;
  v13[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithDictionary:", v10);
  -[CNMetricsUIReporter logSearchActionWithDictionary:](self, "logSearchActionWithDictionary:", v11);

}

- (void)logActionDictionary:(id)a3
{
  -[CNMetricsReporter sendDictionary:forEvent:andLog:](self, "sendDictionary:forEvent:andLog:", a3, CFSTR("activity"), 0);
}

- (id)emptyDictionaryForAction:(id)a3 andApplication:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v12[0] = CFSTR("action");
  v12[1] = CFSTR("application");
  v13[0] = v7;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithDictionary:", v9);
  return v10;
}

- (void)logUnknownContactGeminiViewDifferentChannelSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0C99E08]);
  v9 = CFSTR("differentSIMLineSelected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithDictionary:", v7);

  -[CNMetricsReporter sendDictionary:forEvent:andLog:](self, "sendDictionary:forEvent:andLog:", v8, CFSTR("unknownNumberSIMLinePicker"), 0);
}

@end
