@implementation IMSharedMessageAppSummary

+ (Class)dataSourceClass
{
  void *v3;
  Class result;
  Class v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE503F20 != -1)
    dispatch_once(&qword_1EE503F20, &unk_1E3FB3728);
  v3 = (void *)objc_msgSend(a1, "pluginPath");
  result = (Class)objc_msgSend(v3, "length");
  if (result)
  {
    objc_msgSend((id)qword_1EE503F08, "lock");
    v5 = (Class)objc_msgSend((id)qword_1EE503F10, "objectForKeyedSubscript:", v3);
    v6 = v5;
    if (!v5)
    {
      if ((objc_msgSend((id)qword_1EE503F18, "containsObject:", v3) & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        v7 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v7);
        if ((objc_msgSend(v8, "load") & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v9 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              v11 = 138412290;
              v12 = v3;
              _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "IMSharedMessageAppSummary - Failed to load bundle at path %@", (uint8_t *)&v11, 0xCu);
            }
          }
        }
        v5 = NSClassFromString((NSString *)objc_msgSend((id)objc_msgSend(v8, "infoDictionary"), "objectForKey:", CFSTR("CKDatasourceClass")));
        v10 = v5;
        if (v5)
          objc_msgSend((id)qword_1EE503F10, "setObject:forKey:", v5, v3);
        else
          objc_msgSend((id)qword_1EE503F18, "addObject:", v3);

      }
    }
    objc_msgSend((id)qword_1EE503F08, "unlock");
    return v5;
  }
  return result;
}

+ (id)pluginPath
{
  return 0;
}

+ (id)previewSummary
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_opt_class(), "dataSourceClass");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_previewSummary);
}

+ (id)previewSummaryWithPluginPayload:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](a1, sel_previewSummary);
}

+ (id)linkMetadataForPluginPayload:(id)a3
{
  return 0;
}

@end
