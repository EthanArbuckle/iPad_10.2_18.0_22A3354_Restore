void sub_100005854(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "shutterButton"));
  objc_msgSend(v1, "setEnabled:", 1);

}

void sub_100006D8C(id a1, NSNotification *a2)
{
  NSNotification *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000085EC((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

}

void sub_100006DE0(id a1, NSNotification *a2)
{
  NSNotification *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSNotification *v6;

  v2 = a2;
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "************** START: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100006E8C(id a1, NSNotification *a2)
{
  NSNotification *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSNotification *v6;

  v2 = a2;
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "************** STOP: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100006F38(id a1, NSNotification *a2)
{
  NSNotification *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSNotification *v6;

  v2 = a2;
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "************** INTERRUPT: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100006FE4(id a1, NSNotification *a2)
{
  NSNotification *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSNotification *v6;

  v2 = a2;
  v3 = DiagnosticLogHandleForCategory(3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "************** INTERRUPTION ENDED: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10000829C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000082AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000082C4();
  sub_10000829C((void *)&_mh_execute_header, v0, v1, "Failed to fall back to front camera", v2, v3, v4, v5, v6);
  sub_1000082BC();
}

void sub_1000085C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000082C4();
  sub_10000829C((void *)&_mh_execute_header, v0, v1, "Failed to start with rear camera. Falling back to front camera", v2, v3, v4, v5, v6);
  sub_1000082BC();
}

void sub_1000085EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000082AC((void *)&_mh_execute_header, a2, a3, "************** ERROR: %@", a5, a6, a7, a8, 2u);
  sub_1000082D0();
}

void sub_100008650()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000082C4();
  sub_10000829C((void *)&_mh_execute_header, v0, v1, "Unable to initialize preview layer.", v2, v3, v4, v5, v6);
  sub_1000082BC();
}

void sub_10000867C(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set torch state to %d. Error: %@", (uint8_t *)v3, 0x12u);
  sub_1000082D0();
}

void sub_100008700()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000082C4();
  sub_10000829C((void *)&_mh_execute_header, v0, v1, "Failed to switch back to original camera position", v2, v3, v4, v5, v6);
  sub_1000082BC();
}

void sub_10000872C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000082C4();
  sub_10000829C((void *)&_mh_execute_header, v0, v1, "Failed to switch camera positions. Attempting to switch back", v2, v3, v4, v5, v6);
  sub_1000082BC();
}

void sub_100008758(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000082AC((void *)&_mh_execute_header, a2, a3, "Failed to create new capture device for camera position %ld", a5, a6, a7, a8, 0);
  sub_1000082D0();
}

void sub_1000087BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000082AC((void *)&_mh_execute_header, a2, a3, "Failed to create device input for camera position %ld", a5, a6, a7, a8, 0);
  sub_1000082D0();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInput:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOutput:");
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

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginConfiguration");
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPath");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_cameraDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraDevice");
}

id objc_msgSend_cameraInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraInput");
}

id objc_msgSend_cameraPosition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraPosition");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelTapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTapped");
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureSession");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanup");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_codeTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeTypes");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitConfiguration");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultDeviceWithDeviceType_mediaType_position_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDeviceWithDeviceType:mediaType:position:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dk_arrayFromRequiredKey_inSet_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_arrayFromRequiredKey:inSet:maxLength:failed:");
}

id objc_msgSend_dk_numberFromKey_lowerBound_upperBound_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_finishWithStatusCode_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishWithStatusCode:metadata:");
}

id objc_msgSend_flashButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashButton");
}

id objc_msgSend_flashState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashState");
}

id objc_msgSend_flashTapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashTapped");
}

id objc_msgSend_flipButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipButton");
}

id objc_msgSend_flipButtonIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipButtonIntrinsicContentSize");
}

id objc_msgSend_flipButtonOverContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipButtonOverContent");
}

id objc_msgSend_flipTapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flipTapped");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:error:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_instructionText_presentationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:instructionText:presentationOptions:");
}

id objc_msgSend_initWithLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLayoutStyle:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputs");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isTorchActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTorchActive");
}

id objc_msgSend_isTorchModeSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTorchModeSupported:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lockForConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockForConfiguration:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayView");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_previewView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewView");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_removeInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInput:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveCamera_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveCamera:");
}

id objc_msgSend_setAllowsAutomaticFlash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAutomaticFlash:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCameraDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraDevice:");
}

id objc_msgSend_setCameraInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraInput:");
}

id objc_msgSend_setCameraPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCameraPosition:");
}

id objc_msgSend_setCaptureSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCaptureSession:");
}

id objc_msgSend_setCodeTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCodeTypes:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExclusiveTouch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExclusiveTouch:");
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillColor:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFlash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlash:");
}

id objc_msgSend_setFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashMode:");
}

id objc_msgSend_setFlashState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashState:");
}

id objc_msgSend_setFlashUIEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashUIEnabled:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineCap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineCap:");
}

id objc_msgSend_setLineJoin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineJoin:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setMetadataObjectTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadataObjectTypes:");
}

id objc_msgSend_setMetadataObjectsDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadataObjectsDelegate:queue:");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOverlayView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverlayView:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPreviewView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewView:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setShouldShowPressHomeLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowPressHomeLabel:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
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

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTorchMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTorchMode:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setVideoGravity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoGravity:");
}

id objc_msgSend_setVideoRotationAngle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVideoRotationAngle:");
}

id objc_msgSend_setViewfinderInstruction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewfinderInstruction:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupCamera(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCamera");
}

id objc_msgSend_setupCodeRecognition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCodeRecognition");
}

id objc_msgSend_shutterButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButton");
}

id objc_msgSend_shutterButtonIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButtonIntrinsicContentSize");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRunning");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRunning");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_takePictureWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takePictureWithHandler:");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockForConfiguration");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewfinderInstruction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewfinderInstruction");
}

id objc_msgSend_viewfinderOutsideRegionBottom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewfinderOutsideRegionBottom");
}

id objc_msgSend_viewfinderOutsideRegionTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewfinderOutsideRegionTop");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
