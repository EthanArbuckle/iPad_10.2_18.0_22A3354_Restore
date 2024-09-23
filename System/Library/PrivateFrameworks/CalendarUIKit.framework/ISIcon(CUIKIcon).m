@implementation ISIcon(CUIKIcon)

- (CUIKIcon)initWithDate:()CUIKIcon calendar:format:
{
  id v8;
  id v9;
  void *v10;
  CUIKIcon *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = -[CUIKIcon initWithDate:calendar:format:]([CUIKIcon alloc], "initWithDate:calendar:format:", v8, v9, a5);
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ISIcon(CUIKIcon) initWithDate:calendar:format:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (CUIKIcon)initWithDateComponents:()CUIKIcon calendar:format:forceNoTextEffects:
{
  id v10;
  id v11;
  void *v12;
  CUIKIcon *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10 && v11)
  {
    v13 = -[CUIKIcon initWithDateComponents:calendar:format:forceNoTextEffects:]([CUIKIcon alloc], "initWithDateComponents:calendar:format:forceNoTextEffects:", v10, v11, a5, a6);
  }
  else
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ISIcon(CUIKIcon) initWithDateComponents:calendar:format:forceNoTextEffects:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0;
  }

  return v13;
}

- (void)initWithDate:()CUIKIcon calendar:format:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "date or calendar are nil, returning nil", a5, a6, a7, a8, 0);
}

- (void)initWithDateComponents:()CUIKIcon calendar:format:forceNoTextEffects:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "dateComponents or calendar are nil, returning nil", a5, a6, a7, a8, 0);
}

@end
