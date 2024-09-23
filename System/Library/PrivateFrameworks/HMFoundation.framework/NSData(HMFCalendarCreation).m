@implementation NSData(HMFCalendarCreation)

- (uint64_t)decodeDateComponents
{
  return objc_msgSend(MEMORY[0x1E0C99D78], "hmf_unarchiveFromData:error:", a1, 0);
}

- (id)decodeArrayOfDateComponents
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3710];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unarchivedObjectOfClasses:fromData:error:", v5, a1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)decodeCalendar
{
  return objc_msgSend(MEMORY[0x1E0C99D48], "hmf_unarchiveFromData:error:", a1, 0);
}

@end
