@implementation FBADraftManager

+ (id)sharedInstance
{
  if (qword_100118130 != -1)
    dispatch_once(&qword_100118130, &stru_1000E75A8);
  return (id)qword_100118128;
}

- (FBADraftManager)init
{
  FBADraftManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBADraftManager;
  result = -[FBADraftManager init](&v3, "init");
  if (result)
    result->_inboxLiteMode = 0;
  return result;
}

- (void)reloadApp
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FBADraftManager mainViewController](self, "mainViewController"));
  objc_msgSend(v2, "reloadApp");

}

- (id)appStoryboard
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager rootController](self, "rootController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storyboard"));

  return v3;
}

- (void)respondToLaunchAction:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Responding to launch action [%{public}@]", buf, 0xCu);

  }
  -[FBADraftManager resetViewControllers](self, "resetViewControllers");
  if (objc_msgSend(v4, "showsItem"))
    goto LABEL_12;
  if (objc_msgSend(v4, "launchesSurvey"))
  {
    if (-[FBADraftManager hasOpenDraft](self, "hasOpenDraft"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager draftController](self, "draftController"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000391A4;
      v13[3] = &unk_1000E6378;
      v13[4] = self;
      v14 = v4;
      objc_msgSend(v7, "closeWithCompletion:", v13);

      v8 = v14;
LABEL_18:

      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "launchesFeedback"))
  {
    if (!objc_msgSend(v4, "launchesBatchUI"))
    {
      v9 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10009A9B8(v4);
      goto LABEL_13;
    }
LABEL_12:
    v9 = objc_claimAutoreleasedReturnValue(-[FBADraftManager mainViewController](self, "mainViewController"));
    -[NSObject respondToUrlAction:](v9, "respondToUrlAction:", v4);
LABEL_13:

    goto LABEL_14;
  }
  if (!-[FBADraftManager hasOpenDraft](self, "hasOpenDraft"))
    goto LABEL_12;
  if (!objc_msgSend(v4, "hasAttachments"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager draftController](self, "draftController"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000391E4;
    v11[3] = &unk_1000E6378;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v10, "closeWithCompletion:", v11);

    v8 = v12;
    goto LABEL_18;
  }
  -[FBADraftManager showDraftAttachmentOptionsWithAction:](self, "showDraftAttachmentOptionsWithAction:", v4);
LABEL_14:

}

- (void)beginFeedbackForSurvey:(id)a3 contentItem:(id)a4 forTeam:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  unsigned int v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "draftResponsesContentItemsForTeam:", v10));
  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ded_findWithBlock:", &stru_1000E75E8));
    v13 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ID"));
        v21 = 67109120;
        v22 = objc_msgSend(v15, "intValue");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Will edit survey with ID [%i] with form response", (uint8_t *)&v21, 8u);

      }
      -[FBADraftManager beginFeedbackWithDraft:](self, "beginFeedbackWithDraft:", v12);
    }
    else
    {
      if (v14)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ID"));
        v21 = 67109120;
        v22 = objc_msgSend(v19, "intValue");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Will edit survey with ID [%i] with form item", (uint8_t *)&v21, 8u);

      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
      -[FBADraftManager beginFeedbackWithDraft:](self, "beginFeedbackWithDraft:", v20);

    }
  }
  else
  {
    v16 = objc_msgSend(v8, "canTakeForTeam:", v10);
    v17 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    v12 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ID"));
        v21 = 67109120;
        v22 = objc_msgSend(v18, "intValue");
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will start draft for survey with ID [%i]", (uint8_t *)&v21, 8u);

      }
      v12 = objc_claimAutoreleasedReturnValue(-[FBADraftManager mainViewController](self, "mainViewController"));
      -[NSObject beginFeedbackForSurvey:forTeam:](v12, "beginFeedbackForSurvey:forTeam:", v8, v10);
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_10009AA44(v9);
    }
  }

}

- (void)beginFeedbackWithDraft:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (objc_msgSend(v4, "itemType") == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[FBADraftManager mainViewController](self, "mainViewController"));
    -[NSObject beginFeedbackWithDraftItem:](v5, "beginFeedbackWithDraftItem:", v4);
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10009AAD4(v4);
  }

}

- (void)beginFeedbackForTeam:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FBADraftManager mainViewController](self, "mainViewController"));
  objc_msgSend(v8, "beginBugForTeam:sender:", v7, v6);

}

- (void)deleteDraftFromContentItem:(id)a3 dismissViewOnCompletion:(BOOL)a4
{
  id v6;
  id v7;
  NSObject *activity;
  _QWORD block[4];
  id v10;
  FBADraftManager *v11;
  BOOL v12;

  v6 = a3;
  activity = _os_activity_create((void *)&_mh_execute_header, "Destroying Form Response", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039684;
  block[3] = &unk_1000E7638;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v7 = v6;
  os_activity_apply(activity, block);

}

- (BOOL)hasOpenDraft
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager draftController](self, "draftController"));
  if (v3)
    v4 = 1;
  else
    v4 = -[FBADraftManager hasOpenModalFeedbackController](self, "hasOpenModalFeedbackController");

  return v4;
}

- (BOOL)hasOpenModalFeedbackController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager rootController](self, "rootController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  v4 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
    v6 = objc_opt_class(iFBAFeedbackViewController);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)resetViewControllers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FBADraftManager rootController](self, "rootController"));
  objc_msgSend(v2, "resetViewControllers:", 1);

}

- (void)showModalFeedbackControllerForContentItem:(id)a3 launchAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager appStoryboard](self, "appStoryboard"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", CFSTR("iFBAFollowupViewController")));

  objc_msgSend(v12, "setContentItem:", v7);
  objc_msgSend(v12, "setLaunchAction:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationItem"));
  objc_msgSend(v9, "setRightBarButtonItem:", 0);

  v10 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v12);
  objc_msgSend(v10, "setModalInPresentation:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager rootController](self, "rootController"));
  objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)showDraftAttachmentOptionsWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DRAFT_ALREADY_OPEN_ALERT_TITLE"), &stru_1000EA660, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1000EA660, 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v9, 1, &stru_1000E7658));

  objc_msgSend(v7, "addAction:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DRAFT_ALREADY_OPEN_ALERT_ADD_CHOICE"), &stru_1000EA660, 0));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100039DB0;
  v24[3] = &unk_1000E64B8;
  v24[4] = self;
  v12 = v4;
  v25 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v24));

  objc_msgSend(v7, "addAction:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DRAFT_ALREADY_OPEN_ALERT_NEW_CHOICE"), &stru_1000EA660, 0));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100039E08;
  v22[3] = &unk_1000E64B8;
  v22[4] = self;
  v23 = v12;
  v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, v22));

  objc_msgSend(v7, "addAction:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v19, "setTintColor:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager draftController](self, "draftController"));
  objc_msgSend(v20, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)saveDraftIfNeeded
{
  unsigned int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  id v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  NSObject *v31;
  uint8_t *v32;
  int v33;
  _QWORD v34[4];
  id v35;
  uint8_t *v36;
  int v37;
  uint8_t buf[8];
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;

  v3 = -[FBADraftManager hasOpenDraft](self, "hasOpenDraft");
  v4 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FBA has open draft", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager draftController](self, "draftController"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "draftingController"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject formResponse](v5, "formResponse"));
    if (v5)
    {
      if (-[NSObject isSubmitting](v5, "isSubmitting"))
      {
        v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "FBA is submitting, no need to save draft.";
          v10 = v8;
          v11 = OS_LOG_TYPE_DEFAULT;
          v12 = 2;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      if (v7)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ID"));
        v14 = objc_msgSend(v13, "intValue");

        v15 = -[NSObject isDirty](v5, "isDirty");
        v16 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
        v8 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FBA has dirty draft response", buf, 2u);
          }

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          *(_QWORD *)buf = 0;
          v39 = buf;
          v40 = 0x2020000000;
          v41 = 0;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("save-%d"), v14));
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_10003A2A4;
          v34[3] = &unk_1000E7680;
          v37 = (int)v14;
          v20 = v17;
          v35 = v20;
          v36 = buf;
          v21 = objc_msgSend(v18, "beginBackgroundTaskWithName:expirationHandler:", v19, v34);

          *((_QWORD *)v39 + 3) = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[FBKData sharedInstance](FBKData, "sharedInstance"));
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10003A31C;
          v30[3] = &unk_1000E76A8;
          v8 = v20;
          v31 = v8;
          v32 = buf;
          v33 = (int)v14;
          objc_msgSend(v22, "saveFormResponse:completion:", v7, v30);

          _Block_object_dispose(buf, 8);
          goto LABEL_20;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = (_DWORD)v14;
          v9 = "FR [%d] is not dirty, nothing to save";
          v10 = v8;
          v11 = OS_LOG_TYPE_INFO;
          v12 = 8;
          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
    }
    v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10009ABAC(v8, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No open draft, nothing to save", buf, 2u);
  }
LABEL_21:

}

- (id)draftController
{
  return -[FBADraftManager modalFeedbackEditor](self, "modalFeedbackEditor");
}

- (id)modalFeedbackEditor
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager mainViewController](self, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedViewController"));

  if (v3)
  {
    v4 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

      v7 = objc_opt_class(FBKBugFormTableViewController);
      if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        goto LABEL_6;

    }
  }
  v6 = 0;
LABEL_6:
  v8 = objc_claimAutoreleasedReturnValue(+[FBALog appHandle](FBALog, "appHandle"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10009AC50((uint64_t)v6, v8);

  return v6;
}

- (id)mainViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBADraftManager rootController](self, "rootController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllerForColumn:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ded_findWithBlock:", &stru_1000E76C8));

  return v5;
}

- (id)rootController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));

  return v5;
}

- (BOOL)inboxLiteMode
{
  return self->_inboxLiteMode;
}

- (void)setInboxLiteMode:(BOOL)a3
{
  self->_inboxLiteMode = a3;
}

@end
