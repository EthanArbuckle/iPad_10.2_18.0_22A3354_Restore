@implementation NSMutableDictionary(DNDSModeAssertionStoreRecord)

- (void)dnds_setSafeLocalDateForTimestamp:()DNDSModeAssertionStoreRecord key:
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    v7 = a4;
    objc_msgSend(a3, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v9, 1, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v8, v7);

  }
}

@end
