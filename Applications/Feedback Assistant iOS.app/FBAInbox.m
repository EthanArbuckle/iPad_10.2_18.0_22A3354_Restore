@implementation FBAInbox

- (BOOL)supportsSelection
{
  return 0;
}

- (BOOL)supportsDeletion
{
  return 0;
}

- (NSString)displayText
{
  return (NSString *)&stru_1000EA660;
}

- (UIImageSymbolConfiguration)iconConfiguration
{
  if (qword_100118048 != -1)
    dispatch_once(&qword_100118048, &stru_1000E6DE8);
  return (UIImageSymbolConfiguration *)(id)qword_100118040;
}

- (NSString)iconSystemImageName
{
  return (NSString *)FBKSystemImageNamePaper;
}

- (UIImage)icon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInbox iconSystemImageName](self, "iconSystemImageName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInbox iconConfiguration](self, "iconConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithConfiguration:", v5));

  return (UIImage *)v6;
}

- (id)inboxItemsForTeam:(id)a3 withSortDescriptors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBAInbox predicateForTeam:](self, "predicateForTeam:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentItems"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100025A00;
    v16[3] = &unk_1000E6E10;
    v17 = v10;
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ded_selectItemsPassingTest:", v16));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingDescriptors:", v7));
  }
  else
  {
    v14 = &__NSArray0__struct;
  }

  return v14;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  return 0;
}

- (id)predicateForTeam:(id)a3
{
  return 0;
}

- (BOOL)isCountingUnreadOnly
{
  return 1;
}

- (id)diffableIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self);
  return NSStringFromClass(v2);
}

- (int64_t)type
{
  return 1;
}

@end
