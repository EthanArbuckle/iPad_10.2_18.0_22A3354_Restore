void sub_100004688(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init((Class)BSMutableSettings);
  objc_msgSend(v7, "setFlag:forSetting:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v7));
  objc_msgSend(v5, "sendResponse:", v6);

  objc_msgSend(*(id *)(a1 + 40), "deactivate");
}

void sub_10000472C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init((Class)BSMutableSettings);
  if (a2 != 2)
    objc_msgSend(v7, "setFlag:forSetting:", a2 == 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "actions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v7));
  objc_msgSend(v5, "sendResponse:", v6);

  objc_msgSend(*(id *)(a1 + 40), "deactivate");
}

id sub_10000487C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "externalDisplayHardwareRequirementsSatisfiedChanged:", *(unsigned __int8 *)(a1 + 40));
}

id sub_100004918(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAnimated:", *(unsigned __int8 *)(a1 + 40));
}

id sub_100005B64(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "layoutIfNeeded");
}

uint64_t sub_100005C44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
}

uint64_t sub_100005CB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
}

uint64_t sub_100005D48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
}

uint64_t sub_100006F04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

uint64_t sub_100006F74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
}

uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  v5 = (objc_class *)objc_opt_class(AppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  objc_autoreleasePoolPop(v4);
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend__clearPendingCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearPendingCompletion");
}

id objc_msgSend__preferredFontForTextStyle_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preferredFontForTextStyle:weight:");
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEndpoint:");
}

id objc_msgSend__setPendingCompletion_fromState_toState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPendingCompletion:fromState:toState:");
}

id objc_msgSend__tutorialVideoURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tutorialVideoURL");
}

id objc_msgSend__updateHardwareRequirementsAppearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateHardwareRequirementsAppearance");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArrangedSubview:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
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

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_buttonFontSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonFontSize");
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithConfiguration:primaryAction:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentLayoutGuide");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
}

id objc_msgSend_externalDisplayHardwareRequirementsSatisfiedChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalDisplayHardwareRequirementsSatisfiedChanged:");
}

id objc_msgSend_filledButtonConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filledButtonConfiguration");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frameLayoutGuide");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLayer:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionRole:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithURL_startingState_endingState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:startingState:endingState:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGeometryFlipped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGeometryFlipped");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_packageWithContentsOfURL_type_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packageWithContentsOfURL:type:options:error:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_publishedObjectNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishedObjectNames");
}

id objc_msgSend_publishedObjectWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishedObjectWithName:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithInfo:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "role");
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootLayer");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendResponse:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAlertStacking:");
}

id objc_msgSend_setAllowsControlCenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsControlCenter:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAxis:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentInsets:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCornerStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerStyle:");
}

id objc_msgSend_setCustomSpacing_afterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomSpacing:afterView:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFlag_forSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlag:forSetting:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setGeometryFlipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeometryFlipped:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalInPresentation:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReachabilityDisabled:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_animated_transitionSpeed_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:animated:transitionSpeed:completion:");
}

id objc_msgSend_setState_ofLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:ofLayer:");
}

id objc_msgSend_setState_ofLayer_transitionSpeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:ofLayer:transitionSpeed:");
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

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_stateOfLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateOfLayer:");
}

id objc_msgSend_stateWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateWithName:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_toState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toState");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transitionWithView_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionWithView:duration:options:animations:completion:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_wakeUpConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wakeUpConnection");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_xpcEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcEndpoint");
}
