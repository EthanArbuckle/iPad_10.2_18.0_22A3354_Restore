@implementation CAMOverlayDebugViewController

- (CAMOverlayDebugViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CAMOverlayDebugViewController *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;

  v16.receiver = self;
  v16.super_class = (Class)CAMOverlayDebugViewController;
  v4 = -[CAMOverlayDebugViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class(v4);
      v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServer sharedInstance](CAMOverlayServer, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionsByProcessID"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keysOfEntriesPassingTest:", &stru_100018810));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v12));
    -[CAMOverlayDebugViewController adoptConnection:](v4, "adoptConnection:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServer sharedInstance](CAMOverlayServer, "sharedInstance"));
    objc_msgSend(v14, "addObserver:", v4);

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;

  v3 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class(self);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocating %{public}@", buf, 0xCu);

  }
  v7.receiver = self;
  v7.super_class = (Class)CAMOverlayDebugViewController;
  -[CAMOverlayDebugViewController dealloc](&v7, "dealloc");
}

- (void)serverLostConnectionFromProcessID:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "auditToken"));
  v7 = objc_msgSend(v6, "versionedPID");

  if (v7 == (id)a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection"));
    objc_msgSend(v8, "removeObserver:", self);

    -[CAMOverlayDebugViewController setConnection:](self, "setConnection:", 0);
  }
}

- (void)adoptConnection:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection"));
  objc_msgSend(v5, "removeObserver:", self);

  -[CAMOverlayDebugViewController setConnection:](self, "setConnection:", v4);
  objc_msgSend(v4, "addObserver:", self);

  -[CAMOverlayDebugViewController updateLabel](self, "updateLabel");
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CAMOverlayDebugViewController;
  -[CAMOverlayDebugViewController viewDidLoad](&v42, "viewDidLoad");
  v3 = objc_alloc_init((Class)UILabel);
  -[CAMOverlayDebugViewController setLabel:](self, "setLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v5, "setTextAlignment:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v6, "setNumberOfLines:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  objc_msgSend(v23, "setActive:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:multiplier:", v27, 0.8));
  objc_msgSend(v28, "setActive:", 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "widthAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  objc_msgSend(v33, "setActive:", 1);

  v34 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "toggleVisible:");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v35, "addGestureRecognizer:", v34);

  v36 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "invalidateConnection:");
  objc_msgSend(v36, "setNumberOfTouchesRequired:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v37, "addGestureRecognizer:", v36);

  v38 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tearDownScene:");
  objc_msgSend(v38, "setNumberOfTouchesRequired:", 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v39, "addGestureRecognizer:", v38);

  v40 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "handlePan:");
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v41, "addGestureRecognizer:", v40);

  -[CAMOverlayDebugViewController updateLabel](self, "updateLabel");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)toggleVisible:(id)a3
{
  -[CAMOverlayDebugViewController setVisible:](self, "setVisible:", -[CAMOverlayDebugViewController visible](self, "visible", a3) ^ 1);
  -[CAMOverlayDebugViewController updateLabel](self, "updateLabel");
}

- (void)invalidateConnection:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection", a3));
  objc_msgSend(v4, "invalidate");

  -[CAMOverlayDebugViewController setConnection:](self, "setConnection:", 0);
  -[CAMOverlayDebugViewController updateLabel](self, "updateLabel");
}

- (void)tearDownScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedScenes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  objc_msgSend(v6, "requestSceneSessionDestruction:options:errorHandler:", v5, 0, &stru_100018850);

}

- (void)handlePan:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == (id)3)
  {
    -[CAMOverlayDebugViewController setPanning:](self, "setPanning:", 0);
  }
  else if (objc_msgSend(v5, "state") == (id)2)
  {
    if (!-[CAMOverlayDebugViewController panning](self, "panning"))
      -[CAMOverlayDebugViewController setPanning:](self, "setPanning:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
    objc_msgSend(v5, "setTranslation:inView:", v4, CGPointZero.x, CGPointZero.y);

  }
}

- (void)updateLabel
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  __CFString *v31;
  void *v32;
  unsigned int v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAMOverlayServer sharedInstance](CAMOverlayServer, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectionsByProcessID"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        v12 = CAMStringForOverlayClientConnectionStatus((unint64_t)objc_msgSend(v11, "status"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v10, v13));
        objc_msgSend(v4, "addObject:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v7);
  }

  v40 = v4;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n    ")));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "allKeys"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(0, "count")));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "objectForKeyedSubscript:", v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v22, v23));

        objc_msgSend(v16, "addObject:", v24);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v19);
  }
  v37 = v17;

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n        ")));
  v26 = objc_msgSend(v5, "count");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "auditToken"));
  v29 = objc_msgSend(v28, "versionedPID");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController connection](self, "connection"));
  v31 = CAMStringForOverlayClientConnectionStatus((unint64_t)objc_msgSend(v30, "status"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = -[CAMOverlayDebugViewController visible](self, "visible");
  v34 = CFSTR("hidden");
  if (v33)
    v34 = CFSTR("visible");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    Server: %lu connection(s) \n        %@ \n    Active VPID: %lld \n        status: %@\n    Controls: \n        %@ \n    \n    Overlay: %@\n        "), v26, v39, v29, v32, v25, v34));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CAMOverlayDebugViewController label](self, "label"));
  objc_msgSend(v36, "setText:", v35);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)panning
{
  return self->_panning;
}

- (void)setPanning:(BOOL)a3
{
  self->_panning = a3;
}

- (CAMOverlayClientConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  self->_connection = (CAMOverlayClientConnection *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
