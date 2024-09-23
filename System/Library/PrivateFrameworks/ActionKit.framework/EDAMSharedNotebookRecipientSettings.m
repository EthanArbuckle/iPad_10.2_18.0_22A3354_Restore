@implementation EDAMSharedNotebookRecipientSettings

+ (id)structName
{
  return CFSTR("SharedNotebookRecipientSettings");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1770;
  if (!structFields_structFields_1770)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("reminderNotifyEmail"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("reminderNotifyInApp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)structFields_structFields_1770;
    structFields_structFields_1770 = v5;

    v2 = (void *)structFields_structFields_1770;
  }
  return v2;
}

- (NSNumber)reminderNotifyEmail
{
  return self->_reminderNotifyEmail;
}

- (void)setReminderNotifyEmail:(id)a3
{
  objc_storeStrong((id *)&self->_reminderNotifyEmail, a3);
}

- (NSNumber)reminderNotifyInApp
{
  return self->_reminderNotifyInApp;
}

- (void)setReminderNotifyInApp:(id)a3
{
  objc_storeStrong((id *)&self->_reminderNotifyInApp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderNotifyInApp, 0);
  objc_storeStrong((id *)&self->_reminderNotifyEmail, 0);
}

@end
