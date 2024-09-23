@implementation BuddyButtonMonitor

- (BuddyButtonMonitor)init
{
  void *v2;
  int v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *);
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  SEL v13;
  id location;
  BuddyButtonMonitor *v15;

  v13 = a2;
  location = 0;
  v12.receiver = self;
  v12.super_class = (Class)BuddyButtonMonitor;
  location = -[BuddyButtonMonitor init](&v12, "init");
  objc_storeStrong(&location, location);
  if (!location)
    goto LABEL_6;
  v11 = objc_msgSend(objc_alloc((Class)HIDEventSystemClient), "initWithType:", 1);
  if (v11)
  {
    objc_msgSend(v11, "setMatching:", &off_100290C88);
    v2 = &_dispatch_main_q;
    objc_msgSend(v11, "setDispatchQueue:", v2);

    v5 = _NSConcreteStackBlock;
    v6 = -1073741824;
    v7 = 0;
    v8 = sub_10017907C;
    v9 = &unk_100283DE0;
    v10 = location;
    objc_msgSend(v11, "setEventHandler:", &v5);
    objc_msgSend(v11, "activate");
    objc_storeStrong(&v10, 0);
    v4 = 0;
  }
  else
  {
    v15 = 0;
    v4 = 1;
  }
  objc_storeStrong(&v11, 0);
  if (!v4)
LABEL_6:
    v15 = (BuddyButtonMonitor *)location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (BOOL)isAnyButtonPressed
{
  return self->_anyButtonPressed;
}

- (void)setAnyButtonPressed:(BOOL)a3
{
  self->_anyButtonPressed = a3;
}

@end
