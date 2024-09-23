void sub_100004044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000041E0(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "deactivate");

  v5 = objc_loadWeakRetained(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "invalidate");

}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(PhotosUIServiceAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100004550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004600(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "action"));
  if (objc_msgSend(v4, "canSendResponse"))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse response](BSActionResponse, "response"));
      objc_msgSend(v4, "sendResponse:", v2);
    }
    else
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3072, 0));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseForError:](BSActionResponse, "responseForError:", v2));
      objc_msgSend(v4, "sendResponse:", v3);

    }
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_remoteViewControllerProxy"));
    objc_msgSend(v2, "deactivate");
  }

}

void sub_1000046D8(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finish:", a2);

}

void sub_1000048BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004A58(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_remoteViewControllerProxy"));
  objc_msgSend(v3, "deactivate");

  v5 = objc_loadWeakRetained(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "invalidate");

}

void sub_100004D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004FC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100004FF8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownRemoteViewController");

}

uint64_t sub_100005024(uint64_t a1)
{
  return PXFileRadarWithConfiguration(*(_QWORD *)(a1 + 32));
}

void sub_10000502C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownRemoteViewController");

}

void sub_100005058(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://developer.apple.com/documentation/photokit")));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005168;
  v6[3] = &unk_1000081E8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_msgSend(v4, "openURL:withCompletionHandler:", v5, v6);

  objc_destroyWeak(&v7);
}

void sub_100005128(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000513C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownRemoteViewController");

}

void sub_100005168(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tearDownRemoteViewController");

}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootSheetPresentationController");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__tearDownRemoteViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tearDownRemoteViewController");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addButton:");
}

id objc_msgSend_addKeyCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addKeyCommand:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldButton");
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonTray");
}

id objc_msgSend_canSendResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canSendResponse");
}

id objc_msgSend_createAlertViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAlertViewController");
}

id objc_msgSend_createEducationViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEducationViewController");
}

id objc_msgSend_createInternalAlertViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createInternalAlertViewController");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_finish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finish:");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerView");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithTitle_detailText_icon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTitle:detailText:icon:");
}

id objc_msgSend_interventionViewControllerWithAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interventionViewControllerWithAction:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_keyCommandWithInput_modifierFlags_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyCommandWithInput:modifierFlags:action:");
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:withCompletionHandler:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_px_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "px_imageNamed:");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_responseForError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseForError:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setAllowFullWidthIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowFullWidthIcon:");
}

id objc_msgSend_setAttachmentsIncludeAnyUserAsset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachmentsIncludeAnyUserAsset:");
}

id objc_msgSend_setClassification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassification:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponent:");
}

id objc_msgSend_setDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDescription:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setWantsPhotosDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsPhotosDiagnostics:");
}

id objc_msgSend_setWantsSystemDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsSystemDiagnostics:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
