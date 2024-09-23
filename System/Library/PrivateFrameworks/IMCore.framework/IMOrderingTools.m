@implementation IMOrderingTools

- (void)startTrackingChat:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalInstall");

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "guid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMOrderingTools setUpJSONFileForChatGUID:](self, "setUpJSONFileForChatGUID:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_printChangeInItemsToJSON_, CFSTR("__kIMChatItemsDidChangeNotification"), 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "---Tried to trace guids on a non internal install!!!!!-----", v10, 2u);
    }

  }
}

- (void)setUpJSONFileForChatGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invertedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", &stru_1E4725068);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMOrderingTools pathToDirectoryOfJSONFile](self, "pathToDirectoryOfJSONFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ordering_output_%@_%lu.json"), v8, (unint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createFileAtPath:contents:attributes:", v13, 0, 0);

  -[IMOrderingTools setJsonFilePath:](self, "setJsonFilePath:", v13);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "JSON File for chatGUID %@ can be found at this path: %@", buf, 0x16u);
    }

  }
}

- (void)printChangeInItemsToJSONFromChat:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "guid");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "chatItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Print change items for chat %@ at time %@ current item count %@", buf, 0x20u);

    }
  }
  objc_msgSend(v4, "chatItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (!v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "stringWithFormat:", CFSTR("ItemsChangedEvent-%f"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMOrderingTools messageDictionariesFromItemsInChat:withEventKey:](self, "messageDictionariesFromItemsInChat:withEventKey:", v4, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMOrderingTools currentJsonArray](self, "currentJsonArray");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v16);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v15;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Appending event key %@ with items JSON Array %@", buf, 0x16u);
      }

    }
    -[IMOrderingTools writeDataToJSONFile:](self, "writeDataToJSONFile:", v17);

  }
}

- (void)printChangeInItemsToJSON:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Print change in items %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMOrderingTools printChangeInItemsToJSONFromChat:](self, "printChangeInItemsToJSONFromChat:", v6);

}

- (id)currentJsonArray
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[IMOrderingTools jsonFilePath](self, "jsonFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    v4 = 0;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
    goto LABEL_9;
  }
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_8;
LABEL_9:
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  return v6;
}

- (void)writeDataToJSONFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMOrderingTools jsonFilePath](self, "jsonFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeToFile:atomically:", v5, 1);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "We didn't find a json file to persist for path %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (id)messageDictionariesFromItemsInChat:(id)a3 withEventKey:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "chatItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  objc_msgSend(v10, "addObject:", v6);
  objc_msgSend(v7, "chatItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1A20B1970;
  v14[3] = &unk_1E4720AD0;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v11, "__enumerateItemsWithOptions:usingBlock:", 1, v14);

  return v12;
}

- (NSString)jsonFilePath
{
  return self->_jsonFilePath;
}

- (void)setJsonFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_jsonFilePath, a3);
}

- (NSMutableArray)jsonArray
{
  return self->_jsonArray;
}

- (void)setJsonArray:(id)a3
{
  objc_storeStrong((id *)&self->_jsonArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonArray, 0);
  objc_storeStrong((id *)&self->_jsonFilePath, 0);
}

@end
