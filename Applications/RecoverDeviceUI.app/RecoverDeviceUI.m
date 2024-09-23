void sub_100006104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
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

int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(AppDelegate);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  objc_autoreleasePoolPop(v5);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v8);

  return (int)argv;
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__setupKitEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupKitEventHandler:");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend_actionButtons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionButtons");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:forControlEvents:");
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAnimation:forKey:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_animatedStrokeLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animatedStrokeLayer");
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationWithKeyPath:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationAttempt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationAttempt");
}

id objc_msgSend_backToMenuButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backToMenuButton");
}

id objc_msgSend_backgroundPercentageLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundPercentageLayer");
}

id objc_msgSend_backgroundStrokeLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundStrokeLayer");
}

id objc_msgSend_basicConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "basicConfig");
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blueColor");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonWithProximityType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithProximityType:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_cleanupOldRecoveredDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupOldRecoveredDevices");
}

id objc_msgSend_clearConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearConfiguration");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentView");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMetrics");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_deregisterEventID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterEventID:completionHandler:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_deviceKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceKey");
}

id objc_msgSend_deviceObj(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceObj");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doneWaitingForServerResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doneWaitingForServerResponse");
}

id objc_msgSend_eacsApprovalCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eacsApprovalCard");
}

id objc_msgSend_eacsCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eacsCard");
}

id objc_msgSend_enterCodeCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterCodeCard");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_extendedMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedMode");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_getOverallResultActionForError_resultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOverallResultActionForError:resultType:");
}

id objc_msgSend_getOverallResultSubTitleStringForError_resultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOverallResultSubTitleStringForError:resultType:");
}

id objc_msgSend_getOverallResultTitleStringForError_resultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOverallResultTitleStringForError:resultType:");
}

id objc_msgSend_getOverallResultUIImageForError_resultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOverallResultUIImageForError:resultType:");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "grayColor");
}

id objc_msgSend_handleOSRMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleOSRMessage:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_ignoreAdditionalCodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreAdditionalCodes");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForSelectedRow");
}

id objc_msgSend_indexPathsForSelectedRows(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathsForSelectedRows");
}

id objc_msgSend_initOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initOptions:");
}

id objc_msgSend_initWithArrangedSubviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArrangedSubviews:");
}

id objc_msgSend_initWithCardStyle_scrollView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCardStyle:scrollView:");
}

id objc_msgSend_initWithCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCategory:");
}

id objc_msgSend_initWithContentView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentView:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithOptions_forDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:forDevice:");
}

id objc_msgSend_initWithProgressViewStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProgressViewStyle:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initialCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialCard");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isCompanionSameDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCompanionSameDevice");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_kLocalizedDeviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kLocalizedDeviceType");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_learnMoreButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "learnMoreButtonAction");
}

id objc_msgSend_learnMoreCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "learnMoreCard");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logger");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainContentGuide");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_matchesRecentlyRecoveredDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesRecentlyRecoveredDevice");
}

id objc_msgSend_menuCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "menuCard");
}

id objc_msgSend_menuOptionChosen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "menuOptionChosen:");
}

id objc_msgSend_menuViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "menuViewController");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_nearbyActionDeviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionDeviceClass");
}

id objc_msgSend_nearbyActionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionFlags");
}

id objc_msgSend_nearbyActionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyActionType");
}

id objc_msgSend_nearbyAuthTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearbyAuthTag");
}

id objc_msgSend_notNowButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notNowButtonAction");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oslog");
}

id objc_msgSend_overallResultCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overallResultCard");
}

id objc_msgSend_overallResultOKButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overallResultOKButtonAction");
}

id objc_msgSend_overallResultSUButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overallResultSUButtonAction");
}

id objc_msgSend_pairingFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingFlags");
}

id objc_msgSend_passcodeEntryView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passcodeEntryView");
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passwordType");
}

id objc_msgSend_performingEACS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performingEACS");
}

id objc_msgSend_persistRecoveringDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistRecoveringDevice");
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plainButtonConfiguration");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointSize");
}

id objc_msgSend_presentProxCardFlowWithDelegate_initialViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentProxCardFlowWithDelegate:initialViewController:");
}

id objc_msgSend_progressCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressCard");
}

id objc_msgSend_progressDismissButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressDismissButtonAction");
}

id objc_msgSend_progressText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressText");
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressView");
}

id objc_msgSend_proxCardNavController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxCardNavController");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_recoverButtonAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoverButtonAction");
}

id objc_msgSend_recoverButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoverButtonPressed");
}

id objc_msgSend_recoverDeviceOperationsQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoverDeviceOperationsQueue");
}

id objc_msgSend_recoveryCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recoveryCard");
}

id objc_msgSend_registerEventID_options_eventHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEventID:options:eventHandler:completionHandler:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rssi");
}

id objc_msgSend_runningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningInStoreDemoMode");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scaledFontForFont_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scaledFontForFont:compatibleWithTraitCollection:");
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondarySystemBackgroundColor");
}

id objc_msgSend_secondaryTextProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryTextProperties");
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectedOption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedOption");
}

id objc_msgSend_sendEventID_eventMessage_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventID:eventMessage:options:completionHandler:");
}

id objc_msgSend_sendMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:completionHandler:");
}

id objc_msgSend_serverConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverConfig");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setActionButtons_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionButtons:");
}

id objc_msgSend_setAlignmentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlignmentMode:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAuthenticationAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthenticationAttempt:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundConfiguration:");
}

id objc_msgSend_setBaseForegroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseForegroundColor:");
}

id objc_msgSend_setBlePSM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlePSM:");
}

id objc_msgSend_setClientConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientConfig:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setConditionalPersistent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConditionalPersistent:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDeviceObj_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceObj:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDismissalType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDismissalType:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEacsApprovalCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEacsApprovalCard:");
}

id objc_msgSend_setEacsCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEacsCard:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnterCodeCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnterCodeCard:");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setExtendedMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtendedMode:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFontSize:");
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForegroundColor:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromValue:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreAdditionalCodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreAdditionalCodes:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImagePadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePadding:");
}

id objc_msgSend_setImagePlacement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImagePlacement:");
}

id objc_msgSend_setInitialCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialCard:");
}

id objc_msgSend_setInitialCardForResume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialCardForResume");
}

id objc_msgSend_setInitialCardForSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialCardForSetup");
}

id objc_msgSend_setKLocalizedDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKLocalizedDeviceType:");
}

id objc_msgSend_setLearnMoreCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLearnMoreCard:");
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineCap:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setLogger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogger:");
}

id objc_msgSend_setMenuCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMenuCard:");
}

id objc_msgSend_setMenuViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMenuViewController:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNumberOfDigits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfDigits:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOverallResultCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverallResultCard:");
}

id objc_msgSend_setPasswordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasswordType:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPeerDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerDevice:");
}

id objc_msgSend_setPerformingEACS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerformingEACS:");
}

id objc_msgSend_setPreferredSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredSymbolConfiguration:");
}

id objc_msgSend_setProgress_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgress:animated:");
}

id objc_msgSend_setProgressCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressCard:");
}

id objc_msgSend_setProgressText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressText:");
}

id objc_msgSend_setProgressView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProgressView:");
}

id objc_msgSend_setProxCardNavController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxCardNavController:");
}

id objc_msgSend_setRecoveryCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecoveryCard:");
}

id objc_msgSend_setSecondaryText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecondaryText:");
}

id objc_msgSend_setSectionFooterHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionFooterHeight:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setServerConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServerConfig:");
}

id objc_msgSend_setSettingUpDeviceCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSettingUpDeviceCard:");
}

id objc_msgSend_setSetupCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupCompleted:");
}

id objc_msgSend_setSetupTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupTimer:");
}

id objc_msgSend_setSetupType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupType:");
}

id objc_msgSend_setSetupkitClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupkitClient:");
}

id objc_msgSend_setSetupkitDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSetupkitDevice:");
}

id objc_msgSend_setShowingProgress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowingProgress:");
}

id objc_msgSend_setSkipWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSkipWifi:");
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpacing:");
}

id objc_msgSend_setStatusBarHidden_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBarHidden:withDuration:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setStrokeEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeEnd:");
}

id objc_msgSend_setStrokeStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeStart:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTableFooterView:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextEntryCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextEntryCompletionHandler:");
}

id objc_msgSend_setTextToSecondaryTextVerticalPadding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextToSecondaryTextVerticalPadding:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleAlignment:");
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToValue:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setupCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCompleted");
}

id objc_msgSend_setupStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupStop");
}

id objc_msgSend_setupTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupTimer");
}

id objc_msgSend_setupkitClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupkitClient");
}

id objc_msgSend_setupkitDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupkitDevice");
}

id objc_msgSend_showActivityIndicatorWithStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showActivityIndicatorWithStatus:");
}

id objc_msgSend_showCollectCodeCard_inFlags_inThrottleSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCollectCodeCard:inFlags:inThrottleSeconds:");
}

id objc_msgSend_showEACSApprovalCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showEACSApprovalCard");
}

id objc_msgSend_showEACSCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showEACSCard");
}

id objc_msgSend_showLearnMoreCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showLearnMoreCard");
}

id objc_msgSend_showMenuCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showMenuCard");
}

id objc_msgSend_showOverallResultCard_resultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showOverallResultCard:resultType:");
}

id objc_msgSend_showProgressCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showProgressCard:");
}

id objc_msgSend_showRecoveryCard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showRecoveryCard");
}

id objc_msgSend_showingProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showingProgress");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_skipWifi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipWifi");
}

id objc_msgSend_smallSystemFontSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smallSystemFontSize");
}

id objc_msgSend_stableIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stableIdentifier");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strokeEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strokeEnd");
}

id objc_msgSend_subtitleCellConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleCellConfiguration");
}

id objc_msgSend_subtitleForOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleForOption:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGray3Color");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProperties");
}

id objc_msgSend_throttleSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "throttleSeconds");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_titleForOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForOption:");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_tryPassword_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tryPassword:");
}

id objc_msgSend_uiImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uiImage");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateCodeCardToSettingUpState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCodeCardToSettingUpState");
}

id objc_msgSend_updateProgressCardOnMainQueueWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProgressCardOnMainQueueWithInfo:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_useAlternateStringForWiFI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useAlternateStringForWiFI");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleViewController");
}

id objc_msgSend_waitForServerResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForServerResponse");
}
