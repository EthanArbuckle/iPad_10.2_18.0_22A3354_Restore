@implementation EKCalendar(Saving)

- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:
{
  void *v6;
  uint64_t v7;
  NSObject *v8;

  objc_msgSend(a1, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "saveCalendar:commit:error:", a1, 0, a4);

  if ((v7 & 1) == 0)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EKCalendar(Saving) CUIKEditingContext_saveWithSpan:error:].cold.1();

  }
  return v7;
}

- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:
{
  void *v6;
  uint64_t v7;
  NSObject *v8;

  objc_msgSend(a1, "eventStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "removeCalendar:commit:error:", a1, 0, a4);

  if ((v7 & 1) == 0)
  {
    +[CUIKLogSubsystem editingContext](CUIKLogSubsystem, "editingContext");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[EKCalendar(Saving) CUIKEditingContext_removeWithSpan:error:].cold.1();

  }
  return v7;
}

- (void)CUIKEditingContext_saveWithSpan:()Saving error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1B8A6A000, v0, v1, "Calendar %@ failed to save with error %@");
  OUTLINED_FUNCTION_2();
}

- (void)CUIKEditingContext_removeWithSpan:()Saving error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_1B8A6A000, v0, v1, "Calendar %@ failed to remove with error %@");
  OUTLINED_FUNCTION_2();
}

@end
