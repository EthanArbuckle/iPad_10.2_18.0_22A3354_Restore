@implementation BuddyChoiceController

+ (id)cloudConfigSkipKey
{
  id location;
  os_log_type_t v4;
  os_log_t oslog;
  SEL aSelector;
  id v7;
  uint8_t buf[24];

  v7 = a1;
  aSelector = a2;
  oslog = (os_log_t)(id)_BYLoggingFacility(a1);
  v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    location = NSStringFromSelector(aSelector);
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Subclasses must implement %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

+ (unint64_t)applicableDispositions
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Sub-classes should override"), 0, 0, a2, a1));
}

- (void)setChoices:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void **v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t j;
  id from;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  id location[2];
  id val;
  _BYTE v30[128];

  val = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (*((id *)val + 2) != location[0])
  {
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v3 = location[0];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i < (unint64_t)v4; ++i)
        {
          if (*(_QWORD *)v24 != v5)
            objc_enumerationMutation(v3);
          v27 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v27, "setChoiceController:", 0);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v4);
    }

    objc_msgSend(val, "removeAllButtons");
    objc_storeStrong((id *)val + 2, location[0]);
    objc_initWeak(&from, val);
    for (j = 0; ; ++j)
    {
      v7 = j;
      if (v7 >= (unint64_t)objc_msgSend(*((id *)val + 2), "count"))
        break;
      v20 = objc_msgSend(*((id *)val + 2), "objectAtIndexedSubscript:", j);
      objc_msgSend(v20, "setChoiceController:", val);
      v19 = 0;
      v8 = 1;
      if (j)
        v8 = 2;
      v19 = v8;
      v9 = val;
      v10 = objc_msgSend(v20, "title");
      v11 = v19;
      v12 = _NSConcreteStackBlock;
      v13 = -1073741824;
      v14 = 0;
      v15 = sub_1000D2F38;
      v16 = &unk_100280E18;
      objc_copyWeak(&v18, &from);
      v17 = v20;
      objc_msgSend(v9, "addButtonWithTitle:style:action:", v10, v11, &v12);

      objc_storeStrong(&v17, 0);
      objc_destroyWeak(&v18);
      objc_storeStrong(&v20, 0);
    }
    objc_destroyWeak(&from);
  }
  objc_storeStrong(location, 0);
}

- (void)_tappedChoice:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  id *(*v7)(id *, char);
  void *v8;
  BuddyChoiceController *v9;
  id v10;
  id location[2];
  BuddyChoiceController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = location[0];
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_1000D3058;
  v8 = &unk_100281AF8;
  v9 = v12;
  v10 = location[0];
  objc_msgSend(v3, "runConfirmationIfNeededCompletion:", &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)didSelectChoice:(id)a3
{
  BFFFlowItemDelegate *v3;
  id location[2];
  BuddyChoiceController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyChoiceController delegate](v5, "delegate");
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v3, "flowItemDone:nextItemClass:", v5, objc_msgSend(location[0], "nextControllerClass"));

  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)choices
{
  return self->_choices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
