@implementation BuddyMenuController

+ (BOOL)supportsHomeGesture
{
  return objc_msgSend(a1, "_useSideButton", a2, a1) & 1;
}

+ (BOOL)_useSideButton
{
  id v2;
  BOOL v3;

  v2 = +[BYDevice currentDevice](BYDevice, "currentDevice", a2, a1);
  v3 = (objc_msgSend(v2, "hasHomeButton") & 1) == 0;

  return v3;
}

+ (id)menuButtonConsumerWithHandler:(id)a3
{
  BuddyMenuController *v3;
  id v4;
  id v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [BuddyMenuController alloc];
  v6 = -[BuddyMenuController initWithHandler:](v3, "initWithHandler:", location[0]);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BuddyMenuController)initWithHandler:(id)a3
{
  id v3;
  BuddyMenuController *v4;
  BuddyLongPressButtonConsumer *v5;
  id v6;
  BuddySinglePressUpButtonConsumer *v7;
  BuddySinglePressUpButtonConsumer *v8;
  BuddyMenuController *v9;
  id v11;
  id v12;
  id obj;
  objc_super v14;
  id location[2];
  id v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v16;
  v16 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)BuddyMenuController;
  v4 = -[BuddyMenuController init](&v14, "init");
  v16 = v4;
  objc_storeStrong(&v16, v4);
  if (v4)
  {
    obj = objc_opt_new(NSMutableArray);
    if ((objc_msgSend((id)objc_opt_class(v16), "_useSideButton") & 1) != 0)
    {
      v5 = [BuddyLongPressButtonConsumer alloc];
      v12 = -[BuddyButtonConsumer initWithButtonKind:handler:](v5, "initWithButtonKind:handler:", 2, location[0]);
      objc_msgSend(obj, "addObject:", v12);
      v6 = location[0];
      location[0] = 0;

      objc_storeStrong(&v12, 0);
    }
    v7 = [BuddySinglePressUpButtonConsumer alloc];
    v8 = -[BuddyButtonConsumer initWithButtonKind:handler:](v7, "initWithButtonKind:handler:", 1, location[0]);
    objc_msgSend(obj, "addObject:", v8, v8);
    objc_storeStrong((id *)v16 + 1, obj);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&obj, 0);
  }
  v9 = (BuddyMenuController *)v16;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v16, 0);
  return v9;
}

- (void)invalidate
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  _QWORD v7[8];
  id v8;
  SEL v9;
  BuddyMenuController *v10;
  _BYTE v11[128];

  v10 = self;
  v9 = a2;
  memset(v7, 0, sizeof(v7));
  v2 = v10->_consumers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7[2];
    do
    {
      for (i = 0; i < (unint64_t)v3; ++i)
      {
        if (*(_QWORD *)v7[2] != v4)
          objc_enumerationMutation(v2);
        v8 = *(id *)(v7[1] + 8 * i);
        v6 = objc_msgSend(v8, "buttonConsumer");
        objc_msgSend(v6, "invalidate");

      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", v7, v11, 16);
    }
    while (v3);
  }

  objc_storeStrong((id *)&v10->_consumers, 0);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BuddyMenuController *v4;

  v4 = self;
  v3 = a2;
  -[BuddyMenuController invalidate](self, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)BuddyMenuController;
  -[BuddyMenuController dealloc](&v2, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumers, 0);
}

@end
