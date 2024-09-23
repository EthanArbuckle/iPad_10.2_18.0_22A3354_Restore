void sub_100005878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_100006F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000072E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000081E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000887C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id _TVRIntentExtensionLog()
{
  if (_TVRIntentExtensionLog_onceToken != -1)
    dispatch_once(&_TVRIntentExtensionLog_onceToken, &__block_literal_global_2);
  return (id)_TVRIntentExtensionLog_log;
}

id objc_msgSend__cachedDeviceForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cachedDeviceForIdentifier:");
}

id objc_msgSend__initWithButtonType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithButtonType:");
}

id objc_msgSend__initWithButtonType_hasTapAction_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithButtonType:hasTapAction:properties:");
}

id objc_msgSend__resolveApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveApplication:");
}

id objc_msgSend__resolveCaptionsToggle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveCaptionsToggle:");
}

id objc_msgSend__resolveDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveDevice:");
}

id objc_msgSend__resolveMediaCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveMediaCommand:");
}

id objc_msgSend__resolveReduceLoudSoundsToggle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveReduceLoudSoundsToggle:");
}

id objc_msgSend__resolveSkipCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveSkipCommand:");
}

id objc_msgSend__resolveSkipDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveSkipDuration:");
}

id objc_msgSend__resolveSystemAppearanceToggle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveSystemAppearanceToggle:");
}

id objc_msgSend__resolveUserAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveUserAccount:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "account");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appearanceToggle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearanceToggle");
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "application");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_buttonEventForButton_eventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonEventForButton:eventType:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_confirmationRequiredWithApplicationToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithApplicationToConfirm:");
}

id objc_msgSend_confirmationRequiredWithDeviceToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithDeviceToConfirm:");
}

id objc_msgSend_confirmationRequiredWithMediaCommandToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithMediaCommandToConfirm:");
}

id objc_msgSend_confirmationRequiredWithSkipCommandToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithSkipCommandToConfirm:");
}

id objc_msgSend_confirmationRequiredWithSystemAppearanceToggleToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithSystemAppearanceToggleToConfirm:");
}

id objc_msgSend_confirmationRequiredWithUserAccountToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithUserAccountToConfirm:");
}

id objc_msgSend_confirmationRequiredWithValueToConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmationRequiredWithValueToConfirm:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionState");
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionType");
}

id objc_msgSend_containsIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsIdentifier:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disconnectWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectWithType:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayString");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_eventManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventManager");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithDevice_responseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:responseHandler:");
}

id objc_msgSend_initWithDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:");
}

id objc_msgSend_initWithDeviceIdentifier_identifierType_deviceType_launchContext_launchMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:");
}

id objc_msgSend_initWithIdentifier_displayString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayString:");
}

id objc_msgSend_initWithIdentifier_displayString_pronunciationHint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:displayString:pronunciationHint:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaired");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logShortcutActionRunWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logShortcutActionRunWithType:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapTableWithKeyOptions:valueOptions:");
}

id objc_msgSend_mediaCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mediaCommand");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notRequired");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_presentWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentWithContext:");
}

id objc_msgSend_provideDeviceOptionsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provideDeviceOptionsWithCompletion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resolveDeviceWithIdentifier_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveDeviceWithIdentifier:handler:");
}

id objc_msgSend_sendButtonEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendButtonEvent:");
}

id objc_msgSend_sendEvent_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:options:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEventManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventManager:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_skipCommand(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipCommand");
}

id objc_msgSend_skipDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipDuration");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_successWithResolvedApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedApplication:");
}

id objc_msgSend_successWithResolvedCaptionsToggle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedCaptionsToggle:");
}

id objc_msgSend_successWithResolvedDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedDevice:");
}

id objc_msgSend_successWithResolvedMediaCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedMediaCommand:");
}

id objc_msgSend_successWithResolvedSkipCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedSkipCommand:");
}

id objc_msgSend_successWithResolvedSystemAppearanceToggle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedSystemAppearanceToggle:");
}

id objc_msgSend_successWithResolvedUserAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedUserAccount:");
}

id objc_msgSend_successWithResolvedValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedValue:");
}

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggle");
}
