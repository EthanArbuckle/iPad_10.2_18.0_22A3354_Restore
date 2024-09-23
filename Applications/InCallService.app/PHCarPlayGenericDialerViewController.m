@implementation PHCarPlayGenericDialerViewController

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "type") == (id)4)
        {
          objc_msgSend(v8, "removeObject:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dialerView"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "phonePadView"));
          objc_msgSend(v16, "performTapActionDownForHighlightedKey");

        }
        if (objc_msgSend(v13, "type") == (id)2 || objc_msgSend(v13, "type") == (id)3)
        {
          objc_msgSend(v8, "removeObject:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController view](self, "view"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
          objc_msgSend(v18, "pressesBegan:withEvent:", v19, v7);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayGenericDialerViewController;
  -[PHCarPlayGenericDialerViewController pressesBegan:withEvent:](&v21, "pressesBegan:withEvent:", v8, v7);

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "type") == (id)4)
        {
          objc_msgSend(v8, "removeObject:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dialerView"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "phonePadView"));
          objc_msgSend(v16, "performTapActionEndForHighlightedKey");

          -[PHCarPlayGenericDialerViewController setHandlingKeypadPress:](self, "setHandlingKeypadPress:", 0);
        }
        if (objc_msgSend(v13, "type") == (id)2 || objc_msgSend(v13, "type") == (id)3)
        {
          objc_msgSend(v8, "removeObject:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController view](self, "view"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
          objc_msgSend(v18, "pressesEnded:withEvent:", v19, v7);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayGenericDialerViewController;
  -[PHCarPlayGenericDialerViewController pressesEnded:withEvent:](&v21, "pressesEnded:withEvent:", v8, v7);

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "mutableCopy");
  if (-[PHCarPlayGenericDialerViewController handlingKeypadPress](self, "handlingKeypadPress"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController dialerController](self, "dialerController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dialerView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "phonePadView"));
    objc_msgSend(v11, "performTapActionCancelForHighlightedKey");

    -[PHCarPlayGenericDialerViewController setHandlingKeypadPress:](self, "setHandlingKeypadPress:", 0);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "type") == (id)2 || objc_msgSend(v17, "type") == (id)3)
        {
          objc_msgSend(v8, "removeObject:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayGenericDialerViewController view](self, "view"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "window"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v17));
          objc_msgSend(v19, "pressesCancelled:withEvent:", v20, v7);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayGenericDialerViewController;
  -[PHCarPlayGenericDialerViewController pressesCancelled:withEvent:](&v21, "pressesCancelled:withEvent:", v8, v7);

}

- (DialerController)dialerController
{
  return (DialerController *)objc_getProperty(self, a2, 17, 1);
}

- (void)setDialerController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 17);
}

- (int64_t)currentHighlightedControlIndex
{
  return *(int64_t *)((char *)&self->_dialerController + 1);
}

- (void)setCurrentHighlightedControlIndex:(int64_t)a3
{
  *(DialerController **)((char *)&self->_dialerController + 1) = (DialerController *)a3;
}

- (PHCarPlayNoContentBannerView)noContentBannerView
{
  return (PHCarPlayNoContentBannerView *)objc_getProperty(self, a2, 33, 1);
}

- (void)setNoContentBannerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 33);
}

- (AVExternalDevice)carPlayExternalDevice
{
  return (AVExternalDevice *)objc_getProperty(self, a2, 41, 1);
}

- (void)setCarPlayExternalDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 41);
}

- (BOOL)limitedSoftPhoneKeypad
{
  return *(&self->super._respondsToEventsWhileInCall + 1);
}

- (void)setLimitedSoftPhoneKeypad:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 1) = a3;
}

- (BOOL)handlingKeypadPress
{
  return *(&self->super._respondsToEventsWhileInCall + 2);
}

- (void)setHandlingKeypadPress:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_noContentBannerView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_currentHighlightedControlIndex + 1), 0);
  objc_storeStrong((id *)&self->_handlingKeypadPress, 0);
}

@end
