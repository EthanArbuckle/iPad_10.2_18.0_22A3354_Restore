@implementation EKEventAttendeeCommentsDetailItem

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  int v5;

  v5 = -[EKEvent isSelfOrganized](self->super._event, "isSelfOrganized", a3, a4);
  if (v5)
    LOBYTE(v5) = -[EKEventAttendeeCommentsDetailItem _numComments](self, "_numComments") != 0;
  return v5;
}

- (unint64_t)_numComments
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EKEvent attendees](self->super._event, "attendees", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "comment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D0CD90], "stringWithAutoCommentRemoved:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "length"))
          ++v5;

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Comments"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[EKEventAttendeeCommentsDetailItem _numComments](self, "_numComments");
  CUIKLocalizedStringForInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell detailTextLabel](v4, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[EKUITableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
  return v4;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return -[EKEventAttendeeCommentsDetailItem _numComments](self, "_numComments", a3) != 0;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  EKEventAttendeeCommentsEditViewController *v5;
  void *v6;
  void *v7;

  v5 = -[EKEventAttendeeCommentsEditViewController initWithEKEvent:]([EKEventAttendeeCommentsEditViewController alloc], "initWithEKEvent:", self->super._event);
  -[EKEventDetailItem viewControllerToPresentFrom](self, "viewControllerToPresentFrom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeeCommentsEditViewController setNavigationDelegate:](v5, "setNavigationDelegate:", v7);

  return v5;
}

@end
