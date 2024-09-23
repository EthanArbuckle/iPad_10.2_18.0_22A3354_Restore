@implementation _UIColorPickerUIServiceAppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));
  v9 = _UISceneSessionRoleSceneHosting;
  v10 = objc_msgSend(v8, "isEqualToString:", _UISceneSessionRoleSceneHosting);

  if (v10)
  {
    v11 = objc_msgSend(objc_alloc((Class)UISceneConfiguration), "initWithName:sessionRole:", 0, v9);
    objc_msgSend(v11, "setDelegateClass:", objc_opt_class(_UIColorPickerUIServiceSceneDelegate));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIColorPickerUIServiceAppDelegate.m"), 23, CFSTR("%@ is not a supported scene type. This app was probably launched manually (ie: from the home screen) which is not a supported operation."), v13);

    v11 = 0;
  }

  return v11;
}

@end
