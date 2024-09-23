@implementation ATXContextMenuFeedbackTracker

+ (void)logContextMenuFeedbackForDismissOnceWithSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
  objc_msgSend(a1, "_logContextMenuFeedbackWithMenuActionType:suggestion:consumerSubType:tracker:", 1, a3, a4, a5);
}

+ (void)logContextMenuFeedbackForNeverShowAgainWithSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 tracker:(id)a5
{
  objc_msgSend(a1, "_logContextMenuFeedbackWithMenuActionType:suggestion:consumerSubType:tracker:", 2, a3, a4, a5);
}

+ (void)_logContextMenuFeedbackWithMenuActionType:(int)a3 suggestion:(id)a4 consumerSubType:(unsigned __int8)a5 tracker:(id)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v6 = a5;
  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setMenuActionType:", v8);
  objc_msgSend(v11, "clientModelSpecification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientModelId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClientModelId:", v14);

  v15 = (void *)MEMORY[0x1E0D811A8];
  objc_msgSend(v11, "executableSpecification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringForExecutableType:", objc_msgSend(v16, "executableType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setExecutableType:", v17);

  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConsumerSubType:", v18);

  objc_msgSend(a1, "_suggestionStringForProactiveSuggestion:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSuggestion:", v19);
  objc_msgSend(v10, "trackScalarForMessage:", v12);

  __atxlog_handle_metrics();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[ATXContextMenuFeedbackTracker _logContextMenuFeedbackWithMenuActionType:suggestion:consumerSubType:tracker:].cold.1((objc_class *)a1, v12, v20);

}

+ (id)_suggestionStringForProactiveSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "actionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "executableSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executableIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (void)_logContextMenuFeedbackWithMenuActionType:(NSObject *)a3 suggestion:consumerSubType:tracker:.cold.1(objc_class *a1, void *a2, NSObject *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "menuActionType");
  if ((_DWORD)v7 == 1)
  {
    v8 = CFSTR("DismissOnce");
  }
  else if ((_DWORD)v7 == 2)
  {
    v8 = CFSTR("NeverShowAgain");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a2, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "executableType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138413570;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v8;
  v18 = 2112;
  v19 = v9;
  v20 = 2112;
  v21 = v10;
  v22 = 2112;
  v23 = v11;
  _os_log_debug_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBContextMenuFeedbackTracker with consumerSubType: %@, menuActionType: %@, suggestion: %@, clientModelId: %@, executableType: %@", buf, 0x3Eu);

}

@end
