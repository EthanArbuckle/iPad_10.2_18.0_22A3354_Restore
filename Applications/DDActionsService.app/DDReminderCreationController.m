@implementation DDReminderCreationController

- (DDReminderCreationController)initWithAction:(id)a3 delegate:(id)a4
{
  DDReminderCreationController *v4;
  dispatch_group_t v5;
  OS_dispatch_group *group;
  dispatch_queue_t v7;
  OS_dispatch_queue *updaterQueue;
  NSDateComponents *v9;
  NSDateComponents *reminderDueDateComponents;
  NSAttributedString *v11;
  NSAttributedString *reminderNotes;
  NSString *v13;
  NSString *reminderLocation;
  NSUserActivity *v15;
  NSUserActivity *reminderUserActivity;
  DDReminderCreationController *v18;
  NSObject *log;
  os_log_type_t type;
  id v21;
  id v22;
  id v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v29;
  uint8_t v30[15];
  char v31;
  id v32;
  void **v33;
  int v34;
  int v35;
  void (*v36)(uint64_t, void *, void *);
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id from;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;
  id v48;
  id location[2];
  DDReminderCreationController *v50;

  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = 0;
  objc_storeStrong(&v48, a4);
  v4 = v50;
  v50 = 0;
  v47.receiver = v4;
  v47.super_class = (Class)DDReminderCreationController;
  v50 = -[DDReminderCreationController init](&v47, "init");
  objc_storeStrong((id *)&v50, v50);
  if (v50)
  {
    objc_storeWeak((id *)&v50->_delegate, v48);
    if (!v50->_group)
    {
      v5 = dispatch_group_create();
      group = v50->_group;
      v50->_group = (OS_dispatch_group *)v5;

    }
    if (!v50->_updaterQueue)
    {
      v7 = dispatch_queue_create("com.apple.MobileDataDetectors.serviceActionReminder", 0);
      updaterQueue = v50->_updaterQueue;
      v50->_updaterQueue = (OS_dispatch_queue *)v7;

    }
    v46 = objc_msgSend(location[0], "associatedResults");
    v25 = objc_msgSend(location[0], "associatedResults");
    v27 = objc_msgSend(location[0], "context");
    v26 = objc_msgSend(v48, "_hostApplicationBundleIdentifier");
    v45 = (id)DDUIAugmentedContextForEvent(v25, v27);

    v9 = (NSDateComponents *)sub_100015D98(v46, v45, &v50->_isAllDay);
    reminderDueDateComponents = v50->_reminderDueDateComponents;
    v50->_reminderDueDateComponents = v9;

    if (v50->_reminderDueDateComponents)
    {
      v44 = sub_100015700(v46, v45);
      if (v44)
      {
        -[DDReminderCreationController setTitle:](v50, "setTitle:", v44);
        objc_storeStrong((id *)&v50->_backupReminderTitle, v50->_reminderTitle);
      }
      v23 = objc_msgSend(v48, "_hostApplicationBundleIdentifier");
      LOBYTE(v24) = 0;
      if ((sub_1000117E0(v23) & 1) != 0)
        v24 = _DDUICalendarIsTitleGenerationUsed(v45) ^ 1;

      if ((v24 & 1) != 0)
      {
        v43 = sub_1000153E0(v46, v45);
        if (objc_msgSend(v43, "length"))
        {
          objc_initWeak(&from, v50);
          v41 = +[SGSuggestionsService serviceForReminders](SGSuggestionsService, "serviceForReminders");
          if (v41)
          {
            v40 = v50->_group;
            dispatch_group_enter((dispatch_group_t)v40);
            v22 = v41;
            v21 = v43;
            v33 = _NSConcreteStackBlock;
            v34 = -1073741824;
            v35 = 0;
            v36 = sub_100011838;
            v37 = &unk_100020A60;
            objc_copyWeak(&v39, &from);
            v38 = v40;
            objc_msgSend(v22, "reminderTitleForContent:withCompletion:", v21, &v33);
            objc_storeStrong(&v38, 0);
            objc_destroyWeak(&v39);
            objc_storeStrong(&v40, 0);
          }
          else
          {
            v32 = &_os_log_default;
            v31 = 16;
            if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
            {
              log = v32;
              type = v31;
              sub_100005D3C(v30);
              _os_log_error_impl((void *)&_mh_execute_header, log, type, "Failed to get serviceForReminders", v30, 2u);
            }
            objc_storeStrong(&v32, 0);
          }
          objc_storeStrong(&v41, 0);
          objc_destroyWeak(&from);
        }
        v29 = sub_100015798(v46, v45);
        if (v29)
        {
          v11 = (NSAttributedString *)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v29);
          reminderNotes = v50->_reminderNotes;
          v50->_reminderNotes = v11;

        }
        v13 = (NSString *)sub_100015AEC(v46, v45);
        reminderLocation = v50->_reminderLocation;
        v50->_reminderLocation = v13;

        v15 = (NSUserActivity *)(id)sub_100015FD8(v46, v45);
        reminderUserActivity = v50->_reminderUserActivity;
        v50->_reminderUserActivity = v15;

        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v43, 0);
      }
      objc_storeStrong(&v44, 0);
    }
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
  }
  v18 = v50;
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v50, 0);
  return v18;
}

- (void)reminderCreationViewController:(id)a3 didCreateReminder:(BOOL)a4 error:(id)a5
{
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id location[2];
  DDReminderCreationController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  v10 = 0;
  objc_storeStrong(&v10, a5);
  WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  objc_msgSend(WeakRetained, "setCancellable:", 1);

  objc_msgSend(location[0], "dismissViewControllerAnimated:completion:", 1, 0);
  v9 = objc_loadWeakRetained((id *)&v13->_delegate);
  v8 = objc_msgSend(v9, "_remoteViewControllerProxy");
  objc_msgSend(v8, "actionDidFinishShouldDismiss:", 1);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)setTitle:(id)a3
{
  id v3;
  NSAttributedString *v4;
  NSAttributedString *reminderTitle;
  _UNKNOWN **v6;
  id location[2];
  DDReminderCreationController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v6 = &off_100021328;
    v3 = objc_alloc((Class)NSAttributedString);
    v4 = (NSAttributedString *)objc_msgSend(v3, "initWithString:attributes:", location[0], v6);
    reminderTitle = v8->_reminderTitle;
    v8->_reminderTitle = v4;

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (NSAttributedString)title
{
  dispatch_time_t v2;
  NSObject *group;

  group = self->_group;
  v2 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(group, v2))
    return self->_backupReminderTitle;
  else
    return self->_reminderTitle;
}

- (NSAttributedString)notes
{
  return self->_reminderNotes;
}

- (NSURL)url
{
  return 0;
}

- (NSDateComponents)dueDateComponents
{
  return self->_reminderDueDateComponents;
}

- (BOOL)isAllDayDueDate
{
  return self->_isAllDay;
}

- (CLLocation)location
{
  return 0;
}

- (NSString)locationString
{
  return self->_reminderLocation;
}

- (NSUserActivity)userActivity
{
  return self->_reminderUserActivity;
}

- (BOOL)wantsExtendedDetailOnlyView
{
  return 1;
}

- (DDReminderViewController)delegate
{
  return (DDReminderViewController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderUserActivity, 0);
  objc_storeStrong((id *)&self->_reminderLocation, 0);
  objc_storeStrong((id *)&self->_reminderDueDateComponents, 0);
  objc_storeStrong((id *)&self->_reminderNotes, 0);
  objc_storeStrong((id *)&self->_backupReminderTitle, 0);
  objc_storeStrong((id *)&self->_reminderTitle, 0);
  objc_storeStrong((id *)&self->_updaterQueue, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
