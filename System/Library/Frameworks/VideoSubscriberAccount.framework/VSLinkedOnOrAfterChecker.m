@implementation VSLinkedOnOrAfterChecker

- (id)_minimumVersionsForBehavior:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 2);
  v5 = v4;
  if ((unint64_t)a3 <= 2)
  {
    v6 = (uint64_t)*(&off_1E939F6F8 + a3);
    v7 = (uint64_t)*(&off_1E939F710 + a3);
    v8 = (uint64_t)*(&off_1E939F728 + a3);
    objc_msgSend(v4, "addPointer:", v6);
    objc_msgSend(v5, "addPointer:", v7);
    objc_msgSend(v5, "addPointer:", v8);
  }
  return v5;
}

- (BOOL)shouldPerformBehavior:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[VSLinkedOnOrAfterChecker _minimumVersionsForBehavior:](self, "_minimumVersionsForBehavior:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(v4, "pointerAtIndex:", v5);
      if (dyld_program_sdk_at_least())
        break;
      if (++v5 >= (unint64_t)objc_msgSend(v4, "count"))
        goto LABEL_5;
    }
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Linked against SDK version that performs behavior %lu.", (uint8_t *)&v9, 0xCu);
    }
    v7 = 1;
  }
  else
  {
LABEL_5:
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Linked against SDK that pre-dates behavior %lu.", (uint8_t *)&v9, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

@end
