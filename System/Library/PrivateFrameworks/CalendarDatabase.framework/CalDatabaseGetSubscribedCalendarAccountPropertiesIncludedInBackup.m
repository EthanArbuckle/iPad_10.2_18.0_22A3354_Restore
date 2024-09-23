@implementation CalDatabaseGetSubscribedCalendarAccountPropertiesIncludedInBackup

void __CalDatabaseGetSubscribedCalendarAccountPropertiesIncludedInBackup_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0C8EF50];
  v3[0] = objc_opt_class();
  v2[1] = *MEMORY[0x1E0D0C548];
  v3[1] = objc_opt_class();
  v2[2] = *MEMORY[0x1E0D0C538];
  v3[2] = objc_opt_class();
  v2[3] = *MEMORY[0x1E0D0C560];
  v3[3] = objc_opt_class();
  v2[4] = *MEMORY[0x1E0D0C540];
  v3[4] = objc_opt_class();
  v2[5] = *MEMORY[0x1E0D0C558];
  v3[5] = objc_opt_class();
  v2[6] = *MEMORY[0x1E0D0C580];
  v3[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CalDatabaseGetSubscribedCalendarAccountPropertiesIncludedInBackup_properties;
  CalDatabaseGetSubscribedCalendarAccountPropertiesIncludedInBackup_properties = v0;

}

@end
