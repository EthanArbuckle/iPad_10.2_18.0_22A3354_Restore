@implementation EKReminderFetchRequestToken

- (EKReminderFetchRequestToken)initWithReminderStore:(id)a3
{
  id v4;
  EKReminderFetchRequestToken *v5;
  EKReminderFetchRequestToken *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKReminderFetchRequestToken;
  v5 = -[EKReminderFetchRequestToken init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_reminderStore, v4);

  return v6;
}

- (void)cancel
{
  id v3;
  id v4;

  -[EKReminderFetchRequestToken reminderStore](self, "reminderStore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "completionBlockForFetchRequestToken:remove:", self, 1);

}

- (EKReminderStore)reminderStore
{
  return (EKReminderStore *)objc_loadWeakRetained((id *)&self->_reminderStore);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reminderStore);
}

@end
