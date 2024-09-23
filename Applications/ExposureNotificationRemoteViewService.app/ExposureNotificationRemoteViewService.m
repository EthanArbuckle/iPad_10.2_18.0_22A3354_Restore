uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIView appearance](UIView, "appearance"));
  objc_msgSend(v6, "setTintColor:", v5);

  v7 = UIApplicationMain(a1, a2, 0, 0);
  objc_autoreleasePoolPop(v4);
  return v7;
}

void sub_100002104(uint64_t a1)
{
  NSObject *v1;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activationGroup"));
  dispatch_group_leave(v1);

}

void sub_1000022FC(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentationRequest"));
  v3 = objc_msgSend(v2, "requestType");

  if (v3 == (id)1)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter](_TtC28HealthExposureNotificationUI16ENManagerAdapter, "defaultAdapter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentationRequest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "agencyRegion"));
    objc_msgSend(v6, "onboardingDidStartForRegion:source:", v5, 2);

  }
}

void sub_100002718(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100002758(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000027D0;
    v5[3] = &unk_1000041A0;
    v5[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_handleOnboardingResult:completion:", a2, v5);
  }

}

void sub_1000027D0(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedViewController"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100002848;
  v3[3] = &unk_1000041A0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

id sub_100002848(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

void sub_100002854(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000028CC;
    v5[3] = &unk_1000041A0;
    v5[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_handleKeyReleaseDecision:completion:", a2, v5);
  }

}

void sub_1000028CC(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedViewController"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100002944;
  v3[3] = &unk_1000041A0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

id sub_100002944(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

void sub_100002950(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000029C8;
    v5[3] = &unk_1000041A0;
    v5[4] = WeakRetained;
    objc_msgSend(WeakRetained, "_handlePreApprovalDecision:completion:", a2, v5);
  }

}

void sub_1000029C8(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentedViewController"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100002A40;
  v3[3] = &unk_1000041A0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

id sub_100002A40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

void sub_100002B0C(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentationRequest"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002BB0;
  v4[3] = &unk_100004218;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remotePresentationRequestDidComplete:completion:", v3, v4);

}

uint64_t sub_100002BB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100002C60(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentationRequest"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002D04;
  v4[3] = &unk_100004218;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remotePresentationRequestDidComplete:completion:", v3, v4);

}

uint64_t sub_100002D04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100002DB4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "manager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "presentationRequest"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002E58;
  v4[3] = &unk_100004218;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remotePresentationRequestDidComplete:completion:", v3, v4);

}

uint64_t sub_100002E58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100002F10(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find the matching agency model to start onboarding", v1, 2u);
}

id objc_msgSend__handleKeyReleaseDecision_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleKeyReleaseDecision:completion:");
}

id objc_msgSend__handleOnboardingResult_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleOnboardingResult:completion:");
}

id objc_msgSend__handlePreApprovalDecision_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handlePreApprovalDecision:completion:");
}

id objc_msgSend__hostViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hostViewController");
}

id objc_msgSend__performAfterActivation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performAfterActivation:");
}

id objc_msgSend__viewControllerToShowForPresentationRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_viewControllerToShowForPresentationRequest:");
}

id objc_msgSend_activateWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletionHandler:");
}

id objc_msgSend_activationGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationGroup");
}

id objc_msgSend_agencyRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "agencyRegion");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleIdentifier");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearance");
}

id objc_msgSend_createKeyReleaseDialogueWithBundleIdentifier_region_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createKeyReleaseDialogueWithBundleIdentifier:region:completion:");
}

id objc_msgSend_createOnboardingStackForAgencyModel_exposureManager_fromAvailabilityAlert_fromDeepLink_subsequentFlow_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createOnboardingStackForAgencyModel:exposureManager:fromAvailabilityAlert:fromDeepLink:subsequentFlow:completion:");
}

id objc_msgSend_createPreApprovalDialogueWithBundleIdentifier_region_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPreApprovalDialogueWithBundleIdentifier:region:completion:");
}

id objc_msgSend_defaultAdapter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAdapter");
}

id objc_msgSend_didFinishWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishWithError:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_keyReleaseRequestCompletedWithDecision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyReleaseRequestCompletedWithDecision:");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_onboardingDidStartForRegion_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onboardingDidStartForRegion:source:");
}

id objc_msgSend_onboardingRequestCompletedWithDecision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onboardingRequestCompletedWithDecision:");
}

id objc_msgSend_preApprovalRequestCompletedWithDecision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preApprovalRequestCompletedWithDecision:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationRequest");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regionCode");
}

id objc_msgSend_regionForRegionCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regionForRegionCode:");
}

id objc_msgSend_remotePresentationRequestDidComplete_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remotePresentationRequestDidComplete:completion:");
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestType");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "show");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}
