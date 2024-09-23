void sub_100005220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_1000054F0(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id result;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqualToString:", CFSTR("ExtensionAlertKeyCompletionActionInstall"));
  if ((_DWORD)v2)
  {
    v4 = SUSUILogExtension(v2, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Installing from countdown with install options %@", buf, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 72);
    v9 = *(_QWORD *)(v7 + 88);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005690;
    v14[3] = &unk_100008190;
    v14[4] = v7;
    return objc_msgSend(v8, "installUpdateWithInstallOptions:withResult:", v9, v14);
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqualToString:", CFSTR("ExtensionAlertKeyCompletionActionReboot"));
    if ((_DWORD)result)
    {
      v12 = SUSUILogExtension(result, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Rebooting from countdown", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "reboot");
      return objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
  }
  return result;
}

id sub_100005690(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v2 = a2;
  v4 = SUSUILogExtension(a1, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("failed");
    if (v2)
      v6 = CFSTR("Success");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Installation result = %@", (uint8_t *)&v8, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_100005BC0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServicesUI.framework/Plugins/SoftwareUpdateServicesUIPlugin.servicebundle")));
  v2 = (void *)qword_10000CD80;
  qword_10000CD80 = v1;

}

id objc_msgSend__clearCountdownTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearCountdownTimer");
}

id objc_msgSend__createView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createView");
}

id objc_msgSend__messageTextWithCountdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_messageTextWithCountdown");
}

id objc_msgSend__startCountdownTimerWithInitialTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startCountdownTimerWithInitialTime:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_initWithDelegate_queue_clientType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:clientType:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_installUpdateWithInstallOptions_withResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installUpdateWithInstallOptions:withResult:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reboot");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAutomaticInstallation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticInstallation:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setDarkBoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDarkBoot:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setIgnorableConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnorableConstraints:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setRebootType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRebootType:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_shutdownWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdownWithOptions:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}
