@implementation AXCACCustomCommandEditorServiceViewController

- (AXCACCustomCommandEditorServiceViewController)init
{
  AXCACCustomCommandEditorServiceViewController *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  CACCustomCommandEditorViewController *editor;
  id v20;
  UINavigationController *v21;
  UINavigationController *editorNavigationController;
  objc_super v24;
  void **v25;
  uint64_t v26;
  Class (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v24.receiver = self;
  v24.super_class = (Class)AXCACCustomCommandEditorServiceViewController;
  v2 = -[AXCACCustomCommandEditorServiceViewController init](&v24, "init");
  if (v2)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v3 = (void *)qword_10002E720;
    v33 = qword_10002E720;
    if (!qword_10002E720)
    {
      v25 = _NSConcreteStackBlock;
      v26 = 3221225472;
      v27 = sub_1000046BC;
      v28 = &unk_100024770;
      v29 = &v30;
      sub_1000046BC((uint64_t)&v25);
      v3 = (void *)v31[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v30, 8);
    v5 = objc_alloc_init(v4);
    objc_msgSend(v5, "setDelegate:", v2);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v6 = (void *)qword_10002E730;
    v33 = qword_10002E730;
    if (!qword_10002E730)
    {
      v25 = _NSConcreteStackBlock;
      v26 = 3221225472;
      v27 = sub_1000047C0;
      v28 = &unk_100024770;
      v29 = &v30;
      sub_1000047C0((uint64_t)&v25);
      v6 = (void *)v31[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v30, 8);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v8 = (void *)qword_10002E738;
    v33 = qword_10002E738;
    if (!qword_10002E738)
    {
      v25 = _NSConcreteStackBlock;
      v26 = 3221225472;
      v27 = sub_100004814;
      v28 = &unk_100024770;
      v29 = &v30;
      sub_100004814((uint64_t)&v25);
      v8 = (void *)v31[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v30, 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharedPreferences"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bestLocaleIdentifier"));
    v12 = objc_msgSend(v7, "newCommandItemWithLocale:scope:", v11, CFSTR("com.apple.speech.SystemWideScope"));
    objc_msgSend(v5, "setCommandItem:", v12);

    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v2, v13, v14, v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CommandAndControlCustomCommandEditor.new.command"), &stru_100024F18, CFSTR("AXUIViewService")));
    objc_msgSend(v5, "setTitle:", v18);

    editor = v2->_editor;
    v2->_editor = (CACCustomCommandEditorViewController *)v5;
    v20 = v5;

    v21 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v2->_editor);
    editorNavigationController = v2->_editorNavigationController;
    v2->_editorNavigationController = v21;

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXCACCustomCommandEditorServiceViewController;
  -[AXCACCustomCommandEditorServiceViewController viewDidAppear:](&v10, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCustomCommandEditorServiceViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));
  objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCustomCommandEditorServiceViewController editorNavigationController](self, "editorNavigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentationController"));
  objc_msgSend(v8, "setDelegate:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCustomCommandEditorServiceViewController editorNavigationController](self, "editorNavigationController"));
  -[AXCACCustomCommandEditorServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)_saveCommandItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCustomCommandEditorServiceViewController editor](self, "editor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandItem"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryForSavingToPreferences"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

    if (v6)
    {
      v17[0] = kAXCACCustomCommandIdentifierKey;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v17[1] = kAXCACCustomCommandDictionaryKey;
      v18[0] = v7;
      v18[1] = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
      UIAccessibilityPostNotification(0x7ECu, v8);

    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v9 = off_10002E740;
      v16 = off_10002E740;
      if (!off_10002E740)
      {
        v10 = (void *)sub_100004710();
        v9 = dlsym(v10, "CACLogPreferences");
        v14[3] = (uint64_t)v9;
        off_10002E740 = v9;
      }
      _Block_object_dispose(&v13, 8);
      if (!v9)
      {
        sub_10001343C();
        __break(1u);
      }
      v11 = ((uint64_t (*)(void))v9)();
      v7 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10001345C((uint64_t)v5, v7, v12);
    }

  }
  -[AXCACCustomCommandEditorServiceViewController _dismiss](self, "_dismiss");

}

- (void)_dismiss
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000040A0;
  v2[3] = &unk_100024748;
  v2[4] = self;
  -[AXCACCustomCommandEditorServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", AXCACCommandEditorTextToInsertKey));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", AXCACCommandEditorGestureKey));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", AXCACCommandEditorUserActionFlowKey));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", AXCACCommandEditorShortcutWorkflowKey));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", AXCACCommandEditorPasteboardKey));

  if (!v9 && !v11 && !v13)
  {
    v18 = sub_1000045A8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10001362C(v6, v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCustomCommandEditorServiceViewController editor](self, "editor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "commandItem"));

  v45 = (void *)v13;
  if (v9)
  {
    if (!objc_msgSend(v9, "length"))
    {
      v25 = sub_1000045A8();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1000135EC(v26);

    }
    v27 = (void *)v17;
    objc_msgSend(v21, "setCustomType:", CFSTR("PasteText"));
    objc_msgSend(v21, "setCustomTextToInsert:", v9);
    goto LABEL_30;
  }
  if (v11)
  {
    v27 = (void *)v17;
    v44 = v15;
    v47 = 0;
    v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(AXReplayableGesture, v22, v23, v24), v11, &v47);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = v47;
    if (v29)
    {
      objc_msgSend(v21, "setCustomType:", CFSTR("RunGesture"));
      objc_msgSend(v21, "setCustomGesture:", v29);
LABEL_29:

      v15 = v44;
      goto LABEL_30;
    }
    v33 = sub_1000045A8();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10001358C();
    goto LABEL_28;
  }
  if (v13)
  {
    v44 = v15;
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v31 = (void *)qword_10002E750;
    v52 = qword_10002E750;
    if (!qword_10002E750)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100004868;
      v48[3] = &unk_100024770;
      v48[4] = &v49;
      sub_100004868((uint64_t)v48);
      v31 = (void *)v50[3];
    }
    v27 = (void *)v17;
    v32 = objc_retainAutorelease(v31);
    _Block_object_dispose(&v49, 8);
    v46 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v32, v45, &v46));
    v30 = v46;
    if (v29)
    {
      objc_msgSend(v21, "setCustomType:", CFSTR("RunUserActionFlow"));
      objc_msgSend(v21, "setCustomUserActionFlow:", v29);
      goto LABEL_29;
    }
    v37 = sub_1000045A8();
    v34 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_10001352C();
LABEL_28:

    goto LABEL_29;
  }
  v27 = (void *)v17;
  if (v15)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSiriShortcutsManager sharedManager](AXSiriShortcutsManager, "sharedManager"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "shortcutForIdentifier:", v15));

    if (v36)
    {
      objc_msgSend(v21, "setCustomType:", CFSTR("RunShortcutsWorkflow"));
      objc_msgSend(v21, "setCustomShortcutsWorkflowIdentifier:", v15);
    }
    else
    {
      v41 = sub_1000045A8();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        sub_1000134C4((uint64_t)v15, v42, v43);

    }
  }
LABEL_30:
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", AXCACCommandEditorApplicationIdentifiersToNamesKey));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[AXCACCustomCommandEditorServiceViewController editor](self, "editor"));
  objc_msgSend(v40, "setApplicationIdentifiersToNames:", v39);

  if (v7)
    v7[2](v7);

}

- (void)didFinishEditingCustomCommandForEditor:(id)a3
{
  -[AXCACCustomCommandEditorServiceViewController _saveCommandItem](self, "_saveCommandItem", a3);
}

- (void)didCancelEditingCustomCommandForEditor:(id)a3
{
  -[AXCACCustomCommandEditorServiceViewController _cancelButtonTapped](self, "_cancelButtonTapped", a3);
}

- (UINavigationController)editorNavigationController
{
  return self->_editorNavigationController;
}

- (CACCustomCommandEditorViewController)editor
{
  return self->_editor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_editorNavigationController, 0);
}

@end
