@implementation HMActionSetBuilder(HFIncludedContextProtocol)

- (void)hf_setValue:()HFIncludedContextProtocol forContextType:
{
  NSObject *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138413058;
    v12 = a1;
    v13 = 2080;
    v14 = "-[HMActionSetBuilder(HFIncludedContextProtocol) hf_setValue:forContextType:]";
    v15 = 1024;
    v16 = a3;
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", (uint8_t *)&v11, 0x26u);
  }

  switch(a4)
  {
    case 0:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataActionSetIsFavoriteKey");
      goto LABEL_9;
    case 1:
      NSLog(CFSTR("Action sets cannot be included in status"));
      break;
    case 2:
      NSLog(CFSTR("Action sets are not favoritable"));
      break;
    case 3:
      objc_msgSend(a1, "applicationData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("HFApplicationDataActionSetShowInHomeDashboard");
LABEL_9:
      HFAppDataSetValueIfChanged(v8, v10, v9);

      break;
    default:
      return;
  }
}

@end
