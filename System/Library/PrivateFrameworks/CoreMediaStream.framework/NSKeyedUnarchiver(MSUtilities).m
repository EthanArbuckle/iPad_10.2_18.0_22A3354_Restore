@implementation NSKeyedUnarchiver(MSUtilities)

+ (id)MSSafeUnarchiveAllowedClasses
{
  if (MSSafeUnarchiveAllowedClasses_onceToken != -1)
    dispatch_once(&MSSafeUnarchiveAllowedClasses_onceToken, &__block_literal_global_5991);
  return (id)MSSafeUnarchiveAllowedClasses_allowedClasses;
}

+ (id)MSSafeUnarchiveObjectWithData:()MSUtilities outError:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(a1, "MSSafeUnarchiveAllowedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v8, v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "MSErrorWithDomain:code:description:", CFSTR("MSArchiverUtilitiesErrorDomain"), 0, CFSTR("Empty data"));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)MSSafeUnarchiveObjectWithFile:()MSUtilities outError:
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "MSSafeUnarchiveObjectWithData:outError:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
