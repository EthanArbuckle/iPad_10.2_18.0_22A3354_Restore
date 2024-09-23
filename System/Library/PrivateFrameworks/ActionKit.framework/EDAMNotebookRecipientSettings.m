@implementation EDAMNotebookRecipientSettings

+ (id)structName
{
  return CFSTR("NotebookRecipientSettings");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_1789;
  if (!structFields_structFields_1789)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 2, 1, CFSTR("reminderNotifyEmail"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 1, CFSTR("reminderNotifyInApp"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 1, CFSTR("inMyList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 11, 1, CFSTR("stack"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)structFields_structFields_1789;
    structFields_structFields_1789 = v7;

    v2 = (void *)structFields_structFields_1789;
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

- (NSNumber)inMyList
{
  return self->_inMyList;
}

- (void)setInMyList:(id)a3
{
  objc_storeStrong((id *)&self->_inMyList, a3);
}

- (NSString)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
  objc_storeStrong((id *)&self->_stack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_inMyList, 0);
  objc_storeStrong((id *)&self->_reminderNotifyInApp, 0);
  objc_storeStrong((id *)&self->_reminderNotifyEmail, 0);
}

@end
