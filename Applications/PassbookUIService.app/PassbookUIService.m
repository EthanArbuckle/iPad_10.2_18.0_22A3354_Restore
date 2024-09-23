void sub_10000398C(id a1)
{
  PKLinkNearField(a1);
  +[PKAuthenticator preheatAuthenticator](PKAuthenticator, "preheatAuthenticator");
}

void sub_1000044F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t Object;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    Object = PKLogFacilityTypeGetObject(0);
    v8 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to re-direct url: %@ to Safari with error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void sub_1000046F0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_100004CE0(uint64_t a1, char a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D98;
  block[3] = &unk_100008340;
  v13 = a2;
  v9 = a3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100004D98(uint64_t a1)
{
  uint64_t Object;
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;

  if (*(_BYTE *)(a1 + 64) && !*(_QWORD *)(a1 + 32))
  {
    v6 = objc_msgSend(objc_alloc((Class)PKPaymentSetupNavigationController), "initWithProvisioningController:context:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(v6, "setPaymentSetupMode:", 1);
    objc_msgSend(v6, "setCustomFormSheetPresentationStyleForiPad");
    objc_msgSend(v6, "setAllowsManualEntry:", 0);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 40));
    objc_msgSend(v6, "setSetupDelegate:", WeakRetained);

    objc_msgSend(v6, "setShowsWelcomeViewController:", 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004F60;
    v8[3] = &unk_100008318;
    v9 = v6;
    v10 = *(id *)(a1 + 56);
    v5 = v6;
    objc_msgSend(v5, "preflightWithCompletion:", v8);

  }
  else
  {
    Object = PKLogFacilityTypeGetObject(11);
    v3 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "description"));
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer Payment associateCredential failed for local device with error:%@", buf, 0xCu);

    }
    v5 = (id)objc_claimAutoreleasedReturnValue(+[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:](PKPaymentSetupNavigationController, "viewControllerForPresentingPaymentError:", *(_QWORD *)(a1 + 32)));
    objc_msgSend(v5, "setModalInPresentation:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t sub_100004F60(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setModalInPresentation:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  NSString *v11;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(PassbookUIServiceApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(PassbookUIServiceAppDelegate);
  v10 = NSStringFromClass(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  objc_autoreleasePoolPop(v5);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v8, v11);

  return (int)argv;
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend__componentsForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_componentsForURL:");
}

id objc_msgSend__handleIssuerBindingRequestWithIssuerData_signature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleIssuerBindingRequestWithIssuerData:signature:");
}

id objc_msgSend__handleProvisioningContinuityNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleProvisioningContinuityNotification:");
}

id objc_msgSend__handleURLWithHost_components_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleURLWithHost:components:userActivity:");
}

id objc_msgSend__handleUniversalLinkWithUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleUniversalLinkWithUserActivity:");
}

id objc_msgSend__openURLInSafari_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openURLInSafari:");
}

id objc_msgSend__originatingProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_originatingProcess");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearance");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_associateCredentials_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "associateCredentials:withCompletionHandler:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_decodeTopLevelObjectOfClass_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeTopLevelObjectOfClass:forKey:error:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fragment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fragment");
}

id objc_msgSend_handlePaymentUserActivity_originProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePaymentUserActivity:originProcess:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithPeerPaymentAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeerPaymentAccount:");
}

id objc_msgSend_initWithProvisioningController_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProvisioningController:context:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithWebService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWebService:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_passbookUIServiceDidLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passbookUIServiceDidLaunch");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_preflightWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightWithCompletion:");
}

id objc_msgSend_presentIssuerBindingFlowForIssuerData_signature_orientation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentIssuerBindingFlowForIssuerData:signature:orientation:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_setAllowsManualEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsManualEntry:");
}

id objc_msgSend_setAmount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAmount:");
}

id objc_msgSend_setCustomFormSheetPresentationStyleForiPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomFormSheetPresentationStyleForiPad");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setFlowState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlowState:");
}

id objc_msgSend_setFrontBoardOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontBoardOptions:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setPaymentSetupMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPaymentSetupMode:");
}

id objc_msgSend_setPendingPaymentSenderAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingPaymentSenderAddress:");
}

id objc_msgSend_setSetupDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupDelegate:");
}

id objc_msgSend_setShowsWelcomeViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsWelcomeViewController:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_userNotificationActionPerformed_notificationIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userNotificationActionPerformed:notificationIdentifier:completion:");
}

id objc_msgSend_viewControllerForPresentingPaymentError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForPresentingPaymentError:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}
