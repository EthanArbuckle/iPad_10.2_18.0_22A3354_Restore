@implementation NSString(CLFCommunicationLimit)

- (BOOL)isLessRestrictiveThanCommunicationLimit:()CLFCommunicationLimit
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  NSObject *v9;

  v4 = a3;
  CLFSortedCommunicationLimits();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", a1);
  v7 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CLFLog commonLog](CLFLog, "commonLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NSString(CLFCommunicationLimit) isLessRestrictiveThanCommunicationLimit:].cold.1(a1, (uint64_t)v4, v9);

    v8 = 0;
  }
  else
  {
    v8 = v6 > v7;
  }

  return v8;
}

- (void)isLessRestrictiveThanCommunicationLimit:()CLFCommunicationLimit .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_20D4E9000, log, OS_LOG_TYPE_FAULT, "Invalid communication limit (self: %@, other: %@", (uint8_t *)&v3, 0x16u);
}

@end
