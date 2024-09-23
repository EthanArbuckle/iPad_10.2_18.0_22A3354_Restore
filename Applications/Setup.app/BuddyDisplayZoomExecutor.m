@implementation BuddyDisplayZoomExecutor

- (void)setPendingOption:(unint64_t)a3 chosenByUser:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id location;
  os_log_type_t v9;
  os_log_t oslog;
  BOOL v11;
  unint64_t v12;
  SEL v13;
  BuddyDisplayZoomExecutor *v14;
  uint8_t buf[24];

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    location = (id)DBSStringForDisplayZoomOption(v12);
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Set pending Display Zoom option to %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[BuddyDisplayZoomExecutor setChosenByUser:](v14, "setChosenByUser:", v11);
  v4 = +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
  v5 = objc_msgSend(v4, "displayZoomModes");
  v6 = (id)DBSStringForDisplayZoomOption(v12);
  v7 = objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  -[BuddyDisplayZoomExecutor setPendingMode:](v14, "setPendingMode:", v7);

}

- (BOOL)requiresCommit
{
  DBSDisplayZoomMode *v2;
  BOOL v3;
  id v4;
  id v5;
  DBSDisplayZoomMode *v6;
  id v7;
  id location[2];
  BuddyDisplayZoomExecutor *v10;
  BOOL v11;

  v10 = self;
  location[1] = (id)a2;
  v2 = -[BuddyDisplayZoomExecutor pendingMode](self, "pendingMode");
  v3 = v2 == 0;

  if (v3)
  {
    return 0;
  }
  else
  {
    v4 = +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController");
    location[0] = objc_msgSend(v4, "currentDisplayZoomMode");

    v5 = objc_msgSend(location[0], "displayZoomOption");
    v6 = -[BuddyDisplayZoomExecutor pendingMode](v10, "pendingMode");
    v7 = -[DBSDisplayZoomMode displayZoomOption](v6, "displayZoomOption");

    v11 = v5 != v7;
    objc_storeStrong(location, 0);
  }
  return v11;
}

- (BOOL)commitIfNeededWithRelaunchURL:(id)a3 transitionWithScreenshot:(BOOL)a4
{
  _BOOL8 v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t buf[15];
  os_log_type_t v10;
  os_log_t oslog;
  BOOL v12;
  id location[2];
  BuddyDisplayZoomExecutor *v14;
  char v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v5 = -[BuddyDisplayZoomExecutor requiresCommit](v14, "requiresCommit");
  if (v5)
  {
    -[BuddyDisplayZoomExecutor commitWithRelaunchURL:transitionWithScreenshot:](v14, "commitWithRelaunchURL:transitionWithScreenshot:", location[0], v12);
    v15 = 1;
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v10;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Pending Display Zoom already matches current mode; not committing change",
        buf,
        2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v15 = 0;
  }
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (void)commitWithRelaunchURL:(id)a3 transitionWithScreenshot:(BOOL)a4
{
  DBSDisplayZoomMode *v5;
  id v6;
  NSDictionary *v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  DBSDisplayZoomMode *v11;
  DBSDisplayZoomMode *v12;
  id v13;
  DBSDisplayZoomMode *v14;
  id v15;
  os_log_type_t v16;
  os_log_t v17;
  id v18;
  os_log_type_t v19;
  os_log_t oslog;
  BOOL v21;
  id location[2];
  BuddyDisplayZoomExecutor *v23;
  uint8_t v24[16];
  uint8_t buf[24];
  const __CFString *v26;
  id v27;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  if (-[BuddyDisplayZoomExecutor chosenByUser](v23, "chosenByUser"))
  {
    v26 = CFSTR("choice");
    v5 = -[BuddyDisplayZoomExecutor pendingMode](v23, "pendingMode");
    v6 = (id)DBSStringForDisplayZoomOption(-[DBSDisplayZoomMode displayZoomOption](v5, "displayZoomOption"));
    v27 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    AnalyticsSendEvent(CFSTR("com.apple.setupassistant.ios.displayZoom"), v7);

  }
  v8 = -[BuddyDisplayZoomExecutor willCommit](v23, "willCommit");

  if (v8)
  {
    v10 = (void (**)(_QWORD))-[BuddyDisplayZoomExecutor willCommit](v23, "willCommit");
    v10[2](v10);

  }
  if (location[0])
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v9);
    v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[BuddyDisplayZoomExecutor pendingMode](v23, "pendingMode");
      v18 = (id)DBSStringForDisplayZoomOption(-[DBSDisplayZoomMode displayZoomOption](v11, "displayZoomOption"));
      sub_10003EB04((uint64_t)buf, (uint64_t)v18, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v19, "Committing Display Zoom mode %@ with relaunch URL %@...", buf, 0x16u);

      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    v17 = (os_log_t)(id)_BYLoggingFacility(v9);
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[BuddyDisplayZoomExecutor pendingMode](v23, "pendingMode");
      v15 = (id)DBSStringForDisplayZoomOption(-[DBSDisplayZoomMode displayZoomOption](v12, "displayZoomOption"));
      sub_100038C28((uint64_t)v24, (uint64_t)v15);
      _os_log_impl((void *)&_mh_execute_header, v17, v16, "Committing Display Zoom mode %@...", v24, 0xCu);

      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong((id *)&v17, 0);
  }
  v13 = +[DBSDisplayZoomConfigurationController defaultController](DBSDisplayZoomConfigurationController, "defaultController", v15);
  v14 = -[BuddyDisplayZoomExecutor pendingMode](v23, "pendingMode");
  objc_msgSend(v13, "setDisplayZoomMode:withRelaunchURL:transitionWithScreenshot:", v14, location[0], v21);

  objc_storeStrong(location, 0);
}

- (DBSDisplayZoomMode)pendingMode
{
  return self->_pendingMode;
}

- (void)setPendingMode:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMode, a3);
}

- (id)willCommit
{
  return self->_willCommit;
}

- (void)setWillCommit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)chosenByUser
{
  return self->_chosenByUser;
}

- (void)setChosenByUser:(BOOL)a3
{
  self->_chosenByUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willCommit, 0);
  objc_storeStrong((id *)&self->_pendingMode, 0);
}

@end
