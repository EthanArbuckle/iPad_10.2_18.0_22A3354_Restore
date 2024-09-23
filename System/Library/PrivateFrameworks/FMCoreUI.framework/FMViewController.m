@implementation FMViewController

- (FMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMViewController;
  return -[FMViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (FMViewController)init
{
  void *v3;
  void *v4;
  FMViewController *v5;
  FMViewController *v6;
  objc_super v8;

  -[FMViewController controllerNibName](self, "controllerNibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMViewController actualNibNameForName:](self, "actualNibNameForName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[FMViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", v4, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FMViewController;
    v5 = -[FMViewController init](&v8, sel_init);
  }
  v6 = v5;

  return v6;
}

- (void)dealloc
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[FMViewController allKVOObservers](self, "allKVOObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          LogCategory_Unspecified();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v9;
            _os_log_error_impl(&dword_20DBDA000, v10, OS_LOG_TYPE_ERROR, "Leaked KVO Observer: %@", buf, 0xCu);
          }

          -[FMViewController removeKVOBlockForToken:](self, "removeKVOBlockForToken:", v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v6);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)FMViewController;
  -[FMViewController dealloc](&v11, sel_dealloc);
}

- (void)addKVOObservationToken:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[FMViewController kvoObservationTokens](self, "kvoObservationTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMViewController setKvoObservationTokens:](self, "setKvoObservationTokens:", v10);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[FMViewController kvoObservationTokens](self, "kvoObservationTokens", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_7:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        objc_msgSend(v17, "object");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v8)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v20 = v17;

      if (v20)
        goto LABEL_18;
    }
    else
    {
LABEL_13:

    }
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE2FE50]), "initWithObject:", v8);
LABEL_18:
    -[FMViewController kvoObservationTokens](self, "kvoObservationTokens");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v20);
    v19 = objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = objc_claimAutoreleasedReturnValue();
      -[FMViewController kvoObservationTokens](self, "kvoObservationTokens");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v20);

    }
    -[NSObject addObject:](v19, "addObject:", v6);

  }
  else
  {
    LogCategory_Unspecified();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FMObservingCell addKVOObservationToken:forObject:].cold.1(v19);
  }

}

- (void)removeKVOObservationTokens
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[FMViewController kvoObservationTokens](self, "kvoObservationTokens");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v25;
    *(_QWORD *)&v4 = 138412290;
    v18 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[FMViewController kvoObservationTokens](self, "kvoObservationTokens", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "object");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v12 = v10;
          v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v21 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v11, "removeKVOBlockForToken:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
              }
              v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
            }
            while (v14);
          }
        }
        else
        {
          LogCategory_Unspecified();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v29 = v10;
            _os_log_error_impl(&dword_20DBDA000, v12, OS_LOG_TYPE_ERROR, "Unable to remove KVO tokenSet [%@] because observedObject is nil!", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v5);
  }

  -[FMViewController kvoObservationTokens](self, "kvoObservationTokens");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllObjects");

}

- (void)addNotificationToken:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMViewController.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[inToken class] respondsToSelector:@selector(isAnObserver:)]"));

  }
  -[FMViewController notificationTokens](self, "notificationTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMViewController setNotificationTokens:](self, "setNotificationTokens:", v7);

  }
  -[FMViewController notificationTokens](self, "notificationTokens");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v5);

}

- (void)removeNotificationTokens
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FMViewController notificationTokens](self, "notificationTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[FMViewController notificationTokens](self, "notificationTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMViewController;
  -[FMViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMViewController;
  -[FMViewController awakeFromNib](&v2, sel_awakeFromNib);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  -[FMViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  -[FMViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMViewController;
  -[FMViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[FMViewController removeKVOObservationTokens](self, "removeKVOObservationTokens");
  -[FMViewController removeNotificationTokens](self, "removeNotificationTokens");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMViewController;
  -[FMViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[FMViewController removeKVOObservationTokens](self, "removeKVOObservationTokens");
  -[FMViewController removeNotificationTokens](self, "removeNotificationTokens");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FMViewController;
  -[FMViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  -[FMViewController willMoveToParentViewController:](&v3, sel_willMoveToParentViewController_, a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMViewController;
  -[FMViewController didMoveToParentViewController:](&v3, sel_didMoveToParentViewController_, a3);
}

- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMViewController;
  -[FMViewController performSegueWithIdentifier:sender:](&v4, sel_performSegueWithIdentifier_sender_, a3, a4);
}

- (NSString)controllerNibName
{
  objc_class *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("ViewController")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:", CFSTR("ViewController")));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Cannot derive nib name from class [%@]"), objc_opt_class());

  return (NSString *)v5;
}

- (id)actualNibNameForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    v7 = CFSTR("_iPad");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9)
    {
      v10 = 0;
      v11 = 0;
      v12 = v3;
      goto LABEL_11;
    }
    v7 = CFSTR("_iPhone");
  }
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathForResource:ofType:inDirectory:", v13, CFSTR("nib"), 0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v10 = (void *)v14;
    v15 = 0;
LABEL_10:
    v12 = v13;

    v11 = v12;
    goto LABEL_11;
  }
  v12 = v3;

  objc_msgSend(v4, "pathForResource:ofType:inDirectory:", v12, CFSTR("nib"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if (v11)
  {
    v13 = v3;
    v15 = v13;
    goto LABEL_10;
  }
LABEL_11:
  v16 = v11;

  return v16;
}

- (NSMutableDictionary)kvoObservationTokens
{
  return self->_kvoObservationTokens;
}

- (void)setKvoObservationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_kvoObservationTokens, a3);
}

- (NSMutableSet)notificationTokens
{
  return self->_notificationTokens;
}

- (void)setNotificationTokens:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_kvoObservationTokens, 0);
}

@end
