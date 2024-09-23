@implementation NLPLearnerUtils

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerUtils");
    v3 = (void *)sLog_0;
    sLog_0 = (uint64_t)v2;

  }
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1)
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global);
  return isInternalInstall_sIsInternalInstall;
}

uint64_t __36__NLPLearnerUtils_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isInternalInstall_sIsInternalInstall = result;
  return result;
}

+ (id)getAttachmentURLByName:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, 0, 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[NLPLearnerUtils getAttachmentURLByName:attachments:error:](NLPLearnerUtils, "getAttachmentURLByName:attachments:error:", v9, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)getAttachmentURLByName:(id)a3 attachments:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasSuffix:", v7);

        if (v17)
        {
          objc_msgSend(v15, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v21, 0);

          if ((v22 & 1) != 0)
          {
            a5 = v15;
          }
          else if (a5)
          {
            v23 = (void *)MEMORY[0x24BDD1540];
            v33 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ resource not downloaded"), v7);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 5, v25);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            a5 = 0;
          }
          v19 = v10;
          goto LABEL_16;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (a5)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("missing %@ resource for PFL"), v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.QuickTypeDESPlugin"), 5, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
LABEL_16:

  }
  return a5;
}

+ (void)removeTemporaryFile:(id)a3
{
  id v3;
  id v4;
  int v5;
  id v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v7 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
  v6 = v7;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG))
      +[NLPLearnerUtils removeTemporaryFile:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR))
  {
    +[NLPLearnerUtils removeTemporaryFile:].cold.2();
  }

}

+ (id)messageContentForEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;

  objc_msgSend(a3, "interaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INTypedInteractionWithInteraction();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG))
      +[NLPLearnerUtils messageContentForEvent:].cold.1();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v5, "_nonNilParameters"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "containsObject:", CFSTR("userTypedContent")),
          v7,
          v8))
    {
      objc_msgSend(v5, "userTypedContent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG))
        +[NLPLearnerUtils messageContentForEvent:].cold.2();
    }
    else
    {
      v9 = sLog_0;
      if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR))
        +[NLPLearnerUtils messageContentForEvent:].cold.3(v9);
      v6 = 0;
    }
  }

  return v6;
}

+ (id)messageContentForEvent:(id)a3 andLanguage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v5 = a4;
  +[NLPLearnerUtils messageContentForEvent:](NLPLearnerUtils, "messageContentForEvent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (+[NLPLearnerUtils languageForText:](NLPLearnerUtils, "languageForText:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", v5),
        v7,
        (v8 & 1) == 0))
  {
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG))
      +[NLPLearnerUtils messageContentForEvent:andLanguage:].cold.1();
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v6, "length") <= 0x1D
    && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDDFC10]) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG))
      +[NLPLearnerUtils messageContentForEvent:andLanguage:].cold.2();
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = v6;
LABEL_9:

  return v9;
}

+ (unint64_t)sourceForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char v10;

  v3 = a3;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("MobileSMS"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsString:", CFSTR("mobilemail"));

    if ((v10 & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR))
        +[NLPLearnerUtils sourceForEvent:].cold.1();
      v7 = 0;
    }
  }

  return v7;
}

+ (id)languageForText:(id)a3
{
  return +[NLPLearnerUtils languageForText:checkVietnamese:](NLPLearnerUtils, "languageForText:checkVietnamese:", a3, 1);
}

+ (id)languageForText:(id)a3 checkVietnamese:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  Class *v6;
  id v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  if (v4 && (objc_msgSend((id)objc_opt_class(), "checkVietnameseCharactersInText:", v5) & 1) != 0)
    v6 = (Class *)0x24BDDFD30;
  else
    v6 = (Class *)0x24BDDFD50;
  v7 = objc_alloc_init(*v6);
  objc_msgSend(v7, "processString:", v5);
  objc_msgSend(v7, "dominantLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)checkVietnameseCharactersInText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "vietnameseCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v5);

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)removeTemporaryFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22630F000, v0, v1, "Removed temporary file %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)removeTemporaryFile:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22630F000, v0, OS_LOG_TYPE_ERROR, "Failed to remove temporary file %@: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)messageContentForEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22630F000, v0, v1, "Processing sent message from CoreDuet: '%{sensitive}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)messageContentForEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22630F000, v0, v1, "Processing sent email from CoreDuet:\n'%{sensitive}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)messageContentForEvent:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22630F000, log, OS_LOG_TYPE_ERROR, "Failed to extract message for CoreDuet event's intent", v1, 2u);
}

+ (void)messageContentForEvent:andLanguage:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22630F000, v0, OS_LOG_TYPE_DEBUG, "'%{sensitive}@' discarded (detected language not matching %@)", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)messageContentForEvent:andLanguage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22630F000, v0, v1, "'%{sensitive}@' discarded (too short)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)sourceForEvent:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22630F000, v0, OS_LOG_TYPE_ERROR, "Telemtry not supported for CoreDuet event %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
