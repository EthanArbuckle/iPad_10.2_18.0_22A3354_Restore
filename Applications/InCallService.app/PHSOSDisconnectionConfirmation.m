@implementation PHSOSDisconnectionConfirmation

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076640;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC9A8 != -1)
    dispatch_once(&qword_1002DC9A8, block);
  return (id)qword_1002DC9A0;
}

- (PHSOSDisconnectionConfirmation)init
{
  PHSOSDisconnectionConfirmation *v2;
  uint64_t v3;
  NSHashTable *delegates;
  uint64_t v5;
  NSMutableArray *alertControllers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHSOSDisconnectionConfirmation;
  v2 = -[PHSOSDisconnectionConfirmation init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    alertControllers = v2->_alertControllers;
    v2->_alertControllers = (NSMutableArray *)v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  objc_msgSend(v3, "setDisconnectCallPreflight:", 0);

  -[PHSOSDisconnectionConfirmation dismissAlertControllers](self, "dismissAlertControllers");
  v4.receiver = self;
  v4.super_class = (Class)PHSOSDisconnectionConfirmation;
  -[PHSOSDisconnectionConfirmation dealloc](&v4, "dealloc");
}

- (void)addDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation delegates](self, "delegates"));
  objc_msgSend(v5, "addObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation delegates](self, "delegates"));
  v7 = objc_msgSend(v6, "count");

  if (v7 == (id)1)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000768A4;
    v9[3] = &unk_1002864C0;
    objc_copyWeak(&v10, &from);
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "setDisconnectCallPreflight:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)removeDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation delegates](self, "delegates"));
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation delegates](self, "delegates"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v8, "setDisconnectCallPreflight:", 0);

  }
}

- (void)clearAllDelegates
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v4 = objc_msgSend(v3, "isEnhancedEmergencyEnabled");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    -[PHSOSDisconnectionConfirmation setDelegates:](self, "setDelegates:", v5);

    v6 = (id)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    objc_msgSend(v6, "setDisconnectCallPreflight:", 0);

  }
}

- (void)showSOSDisconnectConfirmation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v19 = a3;
  -[PHSOSDisconnectionConfirmation dismissAlertControllers](self, "dismissAlertControllers");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation delegates](self, "delegates"));
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v31;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v4);
        objc_initWeak(&location, self);
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("InCallService")));
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100076F6C;
        v25[3] = &unk_1002864E8;
        v9 = v19;
        v27 = v9;
        objc_copyWeak(&v28, &location);
        v10 = v6;
        v26 = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v8, 1, v25));
        objc_msgSend(v10, "addAction:", v11);

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("END_CALL_SOS"), &stru_10028DC20, CFSTR("InCallService")));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100076FD0;
        v21[3] = &unk_100286510;
        v23 = v9;
        v21[4] = self;
        objc_copyWeak(&v24, &location);
        v14 = v10;
        v22 = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v13, 2, v21));
        objc_msgSend(v14, "addAction:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation alertControllers](self, "alertControllers"));
        objc_msgSend(v16, "addObject:", v14);

        objc_msgSend(v5, "presentDisconnectionAlert:", v14);
        objc_destroyWeak(&v24);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        v4 = (char *)v4 + 1;
      }
      while (v20 != v4);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v20);
  }

}

- (void)dismissAlertControllers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation alertControllers](self, "alertControllers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "dismissViewControllerAnimated:completion:", 1, 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSDisconnectionConfirmation alertControllers](self, "alertControllers"));
  objc_msgSend(v8, "removeAllObjects");

}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_delegates, a3);
}

- (NSMutableArray)alertControllers
{
  return self->_alertControllers;
}

- (void)setAlertControllers:(id)a3
{
  objc_storeStrong((id *)&self->_alertControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertControllers, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end
