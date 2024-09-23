@implementation NSKeyedUnarchiver(NNMKUnarchivingUtils)

+ (id)unarchiveObjectOfClass:()NNMKUnarchivingUtils withData:
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;

  if (a4)
  {
    v5 = (objc_class *)MEMORY[0x24BDD1620];
    v6 = a4;
    v18 = 0;
    v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, &v18);

    v8 = v18;
    if (v8)
    {
      v9 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        +[NSKeyedUnarchiver(NNMKUnarchivingUtils) unarchiveObjectOfClass:withData:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
    objc_msgSend(v7, "decodeObjectOfClass:forKey:", a3, *MEMORY[0x24BDD0E88]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishDecoding");

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)unarchiveObjectOfClasses:()NNMKUnarchivingUtils withData:
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;

  v5 = a3;
  if (a4)
  {
    v6 = (objc_class *)MEMORY[0x24BDD1620];
    v7 = a4;
    v19 = 0;
    v8 = (void *)objc_msgSend([v6 alloc], "initForReadingFromData:error:", v7, &v19);

    v9 = v19;
    if (v9)
    {
      v10 = qword_253E87A90;
      if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
        +[NSKeyedUnarchiver(NNMKUnarchivingUtils) unarchiveObjectOfClass:withData:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    }
    objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v5, *MEMORY[0x24BDD0E88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishDecoding");

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)nnmk_allowedClasses
{
  if (nnmk_allowedClasses_onceToken != -1)
    dispatch_once(&nnmk_allowedClasses_onceToken, &__block_literal_global_7);
  return (id)nnmk_allowedClasses_allowedClasses;
}

+ (void)unarchiveObjectOfClass:()NNMKUnarchivingUtils withData:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22E161000, a2, a3, "Error unarchiving object. %{public}@", a5, a6, a7, a8, 2u);
}

@end
