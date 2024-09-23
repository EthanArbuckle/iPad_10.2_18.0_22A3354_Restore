@implementation CalAccountErrorSeverity

+ (unint64_t)severityForError:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 9)
    return qword_18FC71180[a3];
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[CalAccountErrorSeverity severityForError:].cold.1(a3, v5);

  return 0;
}

+ (void)severityForError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Can't determine severity of unknown error: %lu", (uint8_t *)&v2, 0xCu);
}

@end
