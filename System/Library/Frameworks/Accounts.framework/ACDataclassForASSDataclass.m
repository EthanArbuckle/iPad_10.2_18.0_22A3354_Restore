@implementation ACDataclassForASSDataclass

void __ACDataclassForASSDataclass_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.Dataclass.Mail");
  v2[1] = CFSTR("com.apple.Dataclass.Contacts");
  v3[0] = CFSTR("com.apple.Dataclass.Mail");
  v3[1] = CFSTR("com.apple.Dataclass.Contacts");
  v2[2] = CFSTR("com.apple.Dataclass.Calendars");
  v2[3] = CFSTR("com.apple.Dataclass.Reminders");
  v3[2] = CFSTR("com.apple.Dataclass.Calendars");
  v3[3] = CFSTR("com.apple.Dataclass.Reminders");
  v2[4] = CFSTR("com.apple.Dataclass.Bookmarks");
  v2[5] = CFSTR("com.apple.Dataclass.Notes");
  v3[4] = CFSTR("com.apple.Dataclass.Bookmarks");
  v3[5] = CFSTR("com.apple.Dataclass.Notes");
  v2[6] = CFSTR("com.apple.Dataclass.MediaStream");
  v2[7] = CFSTR("com.apple.Dataclass.DeviceLocator");
  v3[6] = CFSTR("com.apple.Dataclass.MediaStream");
  v3[7] = CFSTR("com.apple.Dataclass.DeviceLocator");
  v2[8] = CFSTR("com.apple.Dataclass.ContactsSearch");
  v2[9] = CFSTR("com.apple.Dataclass.Backup");
  v3[8] = CFSTR("com.apple.Dataclass.ContactsSearch");
  v3[9] = CFSTR("com.apple.Dataclass.Backup");
  v2[10] = CFSTR("com.apple.Dataclass.Ubiquity");
  v2[11] = CFSTR("com.apple.Dataclass.KeyValue");
  v3[10] = CFSTR("com.apple.Dataclass.Ubiquity");
  v3[11] = CFSTR("com.apple.Dataclass.KeyValue");
  v2[12] = CFSTR("com.apple.Dataclass.Shoebox");
  v2[13] = CFSTR("com.apple.Dataclass.SharedStreams");
  v3[12] = CFSTR("com.apple.Dataclass.Shoebox");
  v3[13] = CFSTR("com.apple.Dataclass.SharedStreams");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ACDataclassForASSDataclass_dataclassDictionary;
  ACDataclassForASSDataclass_dataclassDictionary = v0;

}

@end
