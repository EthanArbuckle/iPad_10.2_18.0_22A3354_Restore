@implementation FBAOutbox

- (BOOL)supportsSelection
{
  return 1;
}

- (BOOL)supportsDeletion
{
  return 1;
}

- (int64_t)type
{
  return 3;
}

- (id)displayText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OUTBOX_INBOX"), &stru_1000EA660, 0));

  return v3;
}

- (id)iconSystemImageName
{
  return FBKSystemImageNameOutbox;
}

- (id)predicateForTeam:(id)a3
{
  return +[FBKContentItem outboxPredicateWithTeam:](FBKContentItem, "outboxPredicateWithTeam:", a3);
}

- (id)fetchRequesForInboxItemsInTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FBKContentItem fetchRequest](FBKContentItem, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAOutbox predicateForTeam:](self, "predicateForTeam:", v4));

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  return 0;
}

@end
