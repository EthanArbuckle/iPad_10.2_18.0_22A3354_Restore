@implementation CPMessageListItem(CKConversation)

- (void)initWithConversation:()CKConversation dateFormatter:timeFormatter:traitCollection:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  if (objc_msgSend(v10, "hasDisplayName"))
    objc_msgSend(v10, "displayName");
  else
    objc_msgSend(v10, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dateStringFromDate:dateFormatter:timeFormatter:", v15, v13, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "renderedAvatarImageWithSize:traitCollection:", v11, *MEMORY[0x1E0C932F0], *(double *)(MEMORY[0x1E0C932F0] + 8));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C93328]), "initWithLeadingItem:leadingImage:unread:", 0, v17, objc_msgSend(v10, "hasUnreadMessages"));
  objc_msgSend(v10, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(a1, "initWithConversationIdentifier:text:leadingConfiguration:trailingConfiguration:detailText:trailingText:", v19, v14, v18, 0, 0, v16);

  if (v20)
    objc_msgSend(v20, "setUserInfo:", v10);

  return v20;
}

- (id)_dateStringFromDate:()CKConversation dateFormatter:timeFormatter:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99D48];
  v10 = a3;
  objc_msgSend(v9, "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDateInToday:", v10);

  if (v12)
    v13 = v8;
  else
    v13 = v7;
  objc_msgSend(v13, "stringFromDate:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
