@implementation _BMRemindersLibraryNode

+ (id)identifier
{
  return CFSTR("Reminders");
}

+ (id)Grocery
{
  return (id)objc_opt_class();
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

+ (id)sublibraries
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "Grocery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
