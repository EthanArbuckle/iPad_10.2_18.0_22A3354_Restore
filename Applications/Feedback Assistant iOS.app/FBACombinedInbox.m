@implementation FBACombinedInbox

- (int64_t)type
{
  return 1;
}

- (id)displayText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("COMBINED_INBOX"), &stru_1000EA660, 0));

  return v3;
}

- (id)iconSystemImageName
{
  return FBKSystemImageNameInbox;
}

- (id)predicateForTeam:(id)a3
{
  return +[FBKContentItem inboxPredicateWithTeam:](FBKContentItem, "inboxPredicateWithTeam:", a3);
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100037084;
  v9[3] = &unk_1000E74F8;
  v5 = v3;
  v10 = v5;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

@end
