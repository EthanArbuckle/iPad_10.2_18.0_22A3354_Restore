@implementation CNEditInAppAction

- (CNEditInAppAction)initWithContact:(id)a3 activityManager:(id)a4
{
  id v7;
  CNEditInAppAction *v8;
  CNEditInAppAction *v9;
  CNEditInAppAction *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNEditInAppAction;
  v8 = -[CNContactAction initWithContact:](&v12, sel_initWithContact_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_activityManager, a4);
    v10 = v9;
  }

  return v9;
}

- (void)performActionWithSender:(id)a3
{
  void *v4;
  id v5;

  -[CNEditInAppAction activityManager](self, "activityManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactAction contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishRequestToEditContact:", v4);

}

- (id)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EDIT_IN_APP_ACTION"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end
