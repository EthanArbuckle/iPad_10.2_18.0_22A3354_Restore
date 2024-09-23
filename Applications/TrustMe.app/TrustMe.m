_BYTE *sub_100003F60(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t sub_100004AF4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t sub_100004CF0(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t start(int a1, char **a2)
{
  void *context;
  unsigned int v6;

  context = objc_autoreleasePoolPush();
  CertUILoggingInitialize();
  v6 = UIApplicationMain(a1, a2, 0, CFSTR("TrustMeAppDelegate"));
  objc_autoreleasePoolPop(context);
  return v6;
}

UIUserInterfaceIdiom sub_100005280()
{
  UIUserInterfaceIdiom v1;
  UIDevice *v2;
  char v3;
  UIDevice *v4;

  v2 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = 1;
    v1 = -[UIDevice userInterfaceIdiom](v4, "userInterfaceIdiom");
  }
  else
  {
    v1 = UIUserInterfaceIdiomPhone;
  }
  if ((v3 & 1) != 0)

  return v1;
}

void sub_100005528(id *a1)
{
  id v1[3];

  v1[2] = a1;
  v1[1] = a1;
  v1[0] = objc_msgSend(a1[4], "_remoteViewControllerProxy");
  objc_msgSend(v1[0], "dismiss");
  objc_storeStrong(v1, 0);
}

id objc_msgSend__clearTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearTimer");
}

id objc_msgSend__dismissRemoteAlertController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissRemoteAlertController");
}

id objc_msgSend__getSpringBoardOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSpringBoardOrientation");
}

id objc_msgSend__presentNextQueuedMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentNextQueuedMessage");
}

id objc_msgSend__presentRemoteAlertWithInfo_replyContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentRemoteAlertWithInfo:replyContext:");
}

id objc_msgSend__queueMessage_withReplyContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueMessage:withReplyContext:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__scheduleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleTimer");
}

id objc_msgSend__sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendResponse:");
}

id objc_msgSend__startCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startCenter");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_centerNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerNamed:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentRemoteAlertController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRemoteAlertController");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delayReply(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delayReply");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissSheetAndDismissAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissSheetAndDismissAlert");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_homeButtonWasPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeButtonWasPressed");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithTrustCertificateDelegate_allowTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTrustCertificateDelegate:allowTrust:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_registerForMessageName_target_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForMessageName:target:selector:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_runServerOnCurrentThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runServerOnCurrentThread");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_sendDelayedReply_dictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDelayedReply:dictionary:");
}

id objc_msgSend_setCertificateInfo_issuer_purpose_expiration_isRoot_properties_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCertificateInfo:issuer:purpose:expiration:isRoot:properties:action:");
}

id objc_msgSend_setCurrentRemoteAlertController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentRemoteAlertController:");
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredHardwareButtonEvents:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setShouldDisableFadeInAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisableFadeInAnimation:");
}

id objc_msgSend_setSupportedInterfaceOrientationOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedInterfaceOrientationOverride:");
}

id objc_msgSend_setSwipeDismissalStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwipeDismissalStyle:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_trustCertificateViewController_finishedWithReturnCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustCertificateViewController:finishedWithReturnCode:");
}

id objc_msgSend_trustControllerToBePresentedByRemoteAlertViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trustControllerToBePresentedByRemoteAlertViewController");
}

id objc_msgSend_unregisterForMessageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterForMessageName:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}
