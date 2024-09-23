@implementation SPUISearchViewWindowSceneDelegate

- (void)sceneDidBecomeActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewWindow](self, "searchViewWindow", a3));
  objc_msgSend(v3, "makeKeyWindow");

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6;
  SPUISecureWindow *v7;
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
  SPUISearchViewWindowSceneDelegate *v23;

  v6 = a3;
  objc_msgSend(v6, "_setKeepContextAssociationInBackground:", 1);
  v7 = -[SPUISecureWindow initWithWindowScene:]([SPUISecureWindow alloc], "initWithWindowScene:", v6);
  -[SPUISecureWindow setHidden:](v7, "setHidden:", 0);
  -[SPUISecureWindow setBackgroundColor:](v7, "setBackgroundColor:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  -[SPUISecureWindow setRootViewController:](v7, "setRootViewController:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISecureWindow _rootSheetPresentationController](v7, "_rootSheetPresentationController"));
  objc_msgSend(v10, "_setShouldScaleDownBehindDescendantSheets:", 0);

  -[SPUISearchViewWindowSceneDelegate setSearchViewWindow:](self, "setSearchViewWindow:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchViewController"));
  -[SPUISearchViewWindowSceneDelegate setSearchViewController:](self, "setSearchViewController:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "unifiedFieldController"));
  -[SPUISearchViewWindowSceneDelegate setUnifiedFieldViewController:](self, "setUnifiedFieldViewController:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationController"));
  -[SPUISearchViewWindowSceneDelegate setNavController:](self, "setNavController:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
  objc_msgSend(v17, "setDelegate:", self);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate unifiedFieldViewController](self, "unifiedFieldViewController"));
  objc_msgSend(v18, "setDelegate:", self);

  v23 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_FBSScene"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
  objc_msgSend(v6, "_registerSettingsDiffActionArray:forKey:", v19, v21);

  -[SPUISearchViewWindowSceneDelegate updateSearchViewClientSceneSettings](self, "updateSearchViewClientSceneSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewWindow](self, "searchViewWindow"));
  objc_msgSend(v22, "makeKeyWindow");

}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  char isKindOfClass;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSData *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *context;
  void *v63;
  id v64;
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "settings"));
  v19 = objc_opt_class(SPUISearchViewSceneSettings);
  isKindOfClass = objc_opt_isKindOfClass(v18, v19);

  if ((isKindOfClass & 1) != 0)
  {
    v64 = v17;
    v65 = v13;
    v21 = v16;
    v66 = v15;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "settings"));
    v23 = objc_msgSend(v22, "interfaceOrientation");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "headerView"));
    objc_msgSend(v25, "setActiveInterfaceOrientation:", v23);

    v26 = objc_msgSend(v22, "presentationSource");
    -[SPUISearchViewWindowSceneDelegate currentRevealProgress](self, "currentRevealProgress");
    v28 = v27;
    objc_msgSend(v22, "revealProgress");
    if (v28 != v29
      && v26 != (id)6
      && (+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") & 1) == 0
      && objc_msgSend(v22, "presentationIntent") == (id)1)
    {
      objc_msgSend(v22, "revealProgress");
      -[SPUISearchViewWindowSceneDelegate setCurrentRevealProgress:](self, "setCurrentRevealProgress:");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
      -[SPUISearchViewWindowSceneDelegate currentRevealProgress](self, "currentRevealProgress");
      objc_msgSend(v30, "searchViewDidUpdatePresentationProgress:");

    }
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "legibilitySettings"));
    if (v31)
    {
      v32 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "legibilitySettings"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "legibilitySettings"));
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if ((v36 & 1) == 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "legibilitySettings"));
        objc_msgSend(v37, "setLegibilitySettings:", v38);

      }
    }
    v39 = -[SPUISearchViewWindowSceneDelegate currentPresentationSource](self, "currentPresentationSource");
    if (v39 != objc_msgSend(v22, "presentationSource"))
      -[SPUISearchViewWindowSceneDelegate setCurrentPresentationSource:](self, "setCurrentPresentationSource:", objc_msgSend(v22, "presentationSource"));
    v40 = -[SPUISearchViewWindowSceneDelegate currentIntent](self, "currentIntent");
    v15 = v66;
    v16 = v21;
    v17 = v64;
    if (v40 != objc_msgSend(v22, "presentationIntent"))
    {
      -[SPUISearchViewWindowSceneDelegate setCurrentIntent:](self, "setCurrentIntent:", objc_msgSend(v22, "presentationIntent"));
      switch(-[SPUISearchViewWindowSceneDelegate currentIntent](self, "currentIntent"))
      {
        case 1uLL:
          v41 = objc_msgSend((id)objc_opt_class(self), "restorationData");
          v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v43, "setRestorationData:", v42);

          v44 = (void *)objc_opt_class(self);
          v45 = objc_opt_new(NSData);
          objc_msgSend(v44, "saveRestorationData:", v45);

          v46 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v46, "searchViewWillPresentFromSource:", -[SPUISearchViewWindowSceneDelegate currentPresentationSource](self, "currentPresentationSource"));

          if (v26 == (id)6)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
            objc_msgSend(v47, "searchViewDidPresentFromSource:", -[SPUISearchViewWindowSceneDelegate currentPresentationSource](self, "currentPresentationSource"));

          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v48, "setRestorationData:", 0);
          goto LABEL_21;
        case 2uLL:
          if (v26 != (id)6)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
            objc_msgSend(v49, "searchViewDidPresentFromSource:", -[SPUISearchViewWindowSceneDelegate currentPresentationSource](self, "currentPresentationSource"));

          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v48, "sendPresentationFeedback");
          goto LABEL_21;
        case 3uLL:
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v48, "searchViewWillDismissWithReason:", 0);
LABEL_21:

          break;
        case 4uLL:
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "searchViewRestorationContext"));

          v52 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v52, "searchViewDidDismissWithReason:", 0);

          context = objc_autoreleasePoolPush();
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
          objc_msgSend(v53, "setRestorationData:", 0);

          v68 = 0;
          v63 = (void *)v51;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v51, 1, &v68));
          v55 = v68;
          v56 = v55;
          if (v55)
          {
            v57 = spuiLogHandles[0];
            if (!spuiLogHandles[0])
            {
              SPUIInitLogging(v55);
              v57 = spuiLogHandles[0];
            }
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
              sub_100006CAC();
          }
          else
          {
            objc_msgSend((id)objc_opt_class(self), "saveRestorationData:", v54);
          }
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate navController](self, "navController"));
          v59 = objc_msgSend(v58, "popToRootViewControllerAnimated:", 0);

          v60 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate navController](self, "navController"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "view"));
          objc_msgSend(v61, "layoutIfNeeded");

          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_100006480;
          v67[3] = &unk_10000C4E0;
          v67[4] = self;
          objc_msgSend((id)objc_opt_class(self), "postMemoryWarningAndPerformBlockIfOverInactiveLimit:", v67);
          +[SUIUtilities releaseVisionCachedResources](SUIUtilities, "releaseVisionCachedResources");

          objc_autoreleasePoolPop(context);
          objc_msgSend((id)objc_opt_class(self), "postMemoryWarningAndPerformBlockIfOverInactiveLimit:", 0);
          -[SPUISearchViewWindowSceneDelegate backgroundSearchScene](self, "backgroundSearchScene");

          v15 = v66;
          break;
        default:
          break;
      }
    }

    v13 = v65;
  }

}

- (void)updateSearchViewClientSceneSettingsIncludingKeyboard:(BOOL)a3 dueToKeyboardLayout:(BOOL)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t Context;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t RenderId;
  id v58;
  _QWORD v59[4];
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  unsigned int v72;
  unsigned int v73;
  BOOL v74;
  BOOL v75;
  char v76;

  if ((+[SPUIDefaults enableFloatingWindow](SPUIDefaults, "enableFloatingWindow") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
    objc_msgSend(v7, "distanceToTopOfAppIcons");
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewController](self, "searchViewController"));
    v58 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headerView"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "searchField"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    RenderId = CALayerGetRenderId();

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "searchField"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
    Context = CALayerGetContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue(Context);
    v56 = objc_msgSend(v16, "contextId");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchProtectorLayer"));
    v54 = CALayerGetRenderId();

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SPUISearchViewControllerHolder sharedInstance](SPUISearchViewControllerHolder, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "searchProtectorLayer"));
    v21 = CALayerGetContext();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_msgSend(v22, "contextId");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "backgroundBlurView"));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "backgroundBlurView"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
      v27 = CALayerGetRenderId();

    }
    else
    {
      v27 = 0;
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "backgroundBlurView"));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "backgroundBlurView"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
      v31 = CALayerGetContext();
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = objc_msgSend(v32, "contextId");

    }
    else
    {
      v33 = 0;
    }

    v34 = 0;
    if ((+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode") & 1) == 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewWindow](self, "searchViewWindow"));
      v36 = objc_msgSend(v35, "interfaceOrientation");
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "searchField"));
      +[UIKeyboard sizeForInterfaceOrientation:inputDelegate:](UIKeyboard, "sizeForInterfaceOrientation:inputDelegate:", v36, v37);
      v34 = v38;

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate unifiedFieldViewController](self, "unifiedFieldViewController", v54));
    v40 = objc_msgSend(v39, "isUnifiedFieldDocked") ^ 1;
    objc_msgSend(v39, "unifiedFieldSize");
    v42 = v41;
    v44 = v43;
    objc_msgSend(v39, "dockedUnifiedFieldSize");
    v46 = v45;
    v48 = v47;
    objc_msgSend(v39, "unifiedFieldCornerRadius");
    v50 = v49;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewWindow](self, "searchViewWindow"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_scene"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10000454C;
    v59[3] = &unk_10000C4B8;
    v71 = v56;
    v72 = v23;
    v63 = v34;
    v64 = v9;
    v61 = RenderId;
    v62 = v55;
    v60 = v39;
    v74 = a4;
    v75 = a3;
    v76 = v40;
    v65 = v42;
    v66 = v44;
    v67 = v46;
    v68 = v48;
    v69 = v50;
    v73 = v33;
    v70 = v27;
    v53 = v39;
    objc_msgSend(v52, "updateClientSettingsWithBlock:", v59);

  }
}

- (UIWindow)searchViewWindow
{
  return (UIWindow *)objc_getProperty(self, a2, 8, 1);
}

- (SPUISearchViewController)searchViewController
{
  return (SPUISearchViewController *)objc_getProperty(self, a2, 16, 1);
}

- (SPUIUnifiedFieldViewController)unifiedFieldViewController
{
  return (SPUIUnifiedFieldViewController *)objc_getProperty(self, a2, 24, 1);
}

- (void)unifiedFieldViewControllerDidLayoutUnifiedField:(id)a3 dueToKeyboardLayout:(BOOL)a4
{
  -[SPUISearchViewWindowSceneDelegate updateSearchViewClientSceneSettingsIncludingKeyboard:dueToKeyboardLayout:](self, "updateSearchViewClientSceneSettingsIncludingKeyboard:dueToKeyboardLayout:", 0, a4);
}

- (void)updateSearchViewClientSceneSettings
{
  -[SPUISearchViewWindowSceneDelegate updateSearchViewClientSceneSettingsIncludingKeyboard:dueToKeyboardLayout:](self, "updateSearchViewClientSceneSettingsIncludingKeyboard:dueToKeyboardLayout:", 1, 0);
}

- (void)setUnifiedFieldViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setSearchViewWindow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setSearchViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setNavController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

+ (id)restorationUrl
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@/%@.%@"), v4, CFSTR("Saved Application State"), CFSTR("com.apple.Spotlight"), CFSTR("savedState")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 0, 0, 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("/spotlightRestorationData.data")));

  v10 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v9, 1);
  return v10;
}

+ (id)restorationDataQueue
{
  if (qword_100012560 != -1)
    dispatch_once(&qword_100012560, &stru_10000C440);
  return (id)qword_100012568;
}

+ (id)restorationData
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000060D0;
  v11 = sub_1000060E0;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "restorationDataQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000060E8;
  v6[3] = &unk_10000C468;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)saveRestorationData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "restorationDataQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000062D0;
  v7[3] = &unk_10000C490;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (void)postMemoryWarningAndPerformBlockIfOverInactiveLimit:(id)a3
{
  void (**v3)(_QWORD);
  pid_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v3 = (void (**)(_QWORD))a3;
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v4 = getpid();
  proc_pid_rusage(v4, 4, (rusage_info_t *)&v7);
  if (*((_QWORD *)&v11 + 1) >> 21 >= 0x19uLL)
  {
    v5 = objc_autoreleasePoolPush();
    if (v3)
      v3[2](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v7, v8, v9, v10, (_QWORD)v11));
    objc_msgSend(v6, "postNotificationName:object:", UIApplicationDidReceiveMemoryWarningNotification, 0);

    objc_autoreleasePoolPop(v5);
  }

}

- (void)unifiedFieldViewControllerDidLayoutForKeyboardFrameChange:(id)a3
{
  -[SPUISearchViewWindowSceneDelegate updateSearchViewClientSceneSettingsIncludingKeyboard:dueToKeyboardLayout:](self, "updateSearchViewClientSceneSettingsIncludingKeyboard:dueToKeyboardLayout:", 1, 1);
}

- (void)backgroundSearchScene
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewWindow](self, "searchViewWindow"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_scene"));
  objc_msgSend(v2, "updateClientSettingsWithTransitionBlock:", &stru_10000C500);

}

- (void)dismissSearchView
{
  -[SPUISearchViewWindowSceneDelegate dismissSearchViewWithReason:](self, "dismissSearchViewWithReason:", 2);
}

- (void)dismissSearchViewWithReason:(unint64_t)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SPUISearchViewWindowSceneDelegate searchViewWindow](self, "searchViewWindow", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_scene"));
  objc_msgSend(v3, "updateClientSettingsWithTransitionBlock:", &stru_10000C520);

}

- (UINavigationController)navController
{
  return (UINavigationController *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)currentPresentationSource
{
  return self->_currentPresentationSource;
}

- (void)setCurrentPresentationSource:(unint64_t)a3
{
  self->_currentPresentationSource = a3;
}

- (unint64_t)currentIntent
{
  return self->_currentIntent;
}

- (void)setCurrentIntent:(unint64_t)a3
{
  self->_currentIntent = a3;
}

- (double)currentRevealProgress
{
  return self->_currentRevealProgress;
}

- (void)setCurrentRevealProgress:(double)a3
{
  self->_currentRevealProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_unifiedFieldViewController, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_searchViewWindow, 0);
}

@end
