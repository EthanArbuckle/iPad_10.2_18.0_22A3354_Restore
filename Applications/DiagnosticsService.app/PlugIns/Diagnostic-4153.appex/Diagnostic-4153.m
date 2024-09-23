id sub_100002F94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cleanUp");
}

void sub_100003470(id a1, NSNotification *a2)
{
  int v3;
  NSNotification *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** ERROR: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_10000350C(id a1, NSNotification *a2)
{
  NSNotification *v2;
  void *v3;
  unsigned int v4;
  int v5;
  NSNotification *v6;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DSTestAutomation sharedInstance](DSTestAutomation, "sharedInstance"));
  v4 = objc_msgSend(v3, "testAutomationEnabled");

  if (v4)
    UIAccessibilityPostNotification(0xFA2u, &off_100010AF0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** START: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1000035EC(id a1, NSNotification *a2)
{
  int v3;
  NSNotification *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** STOP: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100003688(id a1, NSNotification *a2)
{
  int v3;
  NSNotification *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** INTERRUPT: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100003724(id a1, NSNotification *a2)
{
  int v3;
  NSNotification *v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "************** INTERRUPTION ENDED: %@", (uint8_t *)&v3, 0xCu);
  }
}

id sub_1000047F4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeResultWithTag:", objc_msgSend(*(id *)(a1 + 32), "tag"));
}

void sub_100004828(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v1, "setBackgroundColor:", v2);

}

id sub_100004F60(uint64_t a1)
{
  void *v2;
  id v3;
  _UNKNOWN **v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allResults"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
    v4 = &off_100010B90;
  else
    v4 = &off_100010BA8;
  return objc_msgSend(*(id *)(a1 + 32), "endTestWithStatusCode:", v4);
}

id sub_1000068C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTestWithStatusCode:", &off_100010BF0);
}

id sub_1000068D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retakeButtonPressed:", 0);
}

void sub_1000076E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000076F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100008138(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "shutterButton"));
  objc_msgSend(v1, "setEnabled:", 1);

}

void sub_100009488(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076E8((void *)&_mh_execute_header, a2, a3, "Unable to find requested device: %@", a5, a6, a7, a8, 2u);
  sub_100007710();
}

void sub_1000094EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076E8((void *)&_mh_execute_header, a2, a3, "Unable to initialize input device, error: %@", a5, a6, a7, a8, 2u);
  sub_100007710();
}

void sub_100009550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076F8((void *)&_mh_execute_header, a1, a3, "Unable to add input/output devices to session.", a5, a6, a7, a8, 0);
  sub_100007708();
}

void sub_100009580(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076F8((void *)&_mh_execute_header, a1, a3, "Unable to initialize preview layer.", a5, a6, a7, a8, 0);
  sub_100007708();
}

void sub_1000095B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076F8((void *)&_mh_execute_header, a1, a3, "[ERROR] - Camera Sensor Anomaly Tool: Parameter not found.", a5, a6, a7, a8, 0);
  sub_100007708();
}

void sub_1000095E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000076E8((void *)&_mh_execute_header, a2, a3, "Error occurred while capturing image: %@", a5, a6, a7, a8, 2u);
  sub_100007710();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGPath");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_adaptationClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adaptationClient");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
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

id objc_msgSend_addPanGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPanGesture");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTapGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTapGesture");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addedRectangleView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addedRectangleView");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allResults");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bezierPath");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blueLightClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blueLightClient");
}

id objc_msgSend_blueLightStatusActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blueLightStatusActive");
}

id objc_msgSend_bottomBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomBar");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_canAddInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddInput:");
}

id objc_msgSend_canAddOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddOutput:");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelTapped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTapped");
}

id objc_msgSend_capturePhotoWithSettings_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capturePhotoWithSettings:delegate:");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "center");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearColor");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client");
}

id objc_msgSend_colorAdaptationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorAdaptationStatus");
}

id objc_msgSend_colorWithHexValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithHexValue:error:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
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

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueButton");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertPoint:toView:");
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

id objc_msgSend_currentImageView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentImageView");
}

id objc_msgSend_currentTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTag");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deviceInputWithDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInputWithDevice:error:");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableAdaptationAndBlueLightReduction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAdaptationAndBlueLightReduction");
}

id objc_msgSend_disableAmbientLightAdaptation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAmbientLightAdaptation");
}

id objc_msgSend_discoverySessionWithDeviceTypes_mediaType_position_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverySessionWithDeviceTypes:mediaType:position:");
}

id objc_msgSend_dk_BOOLFromKey_defaultValue_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:");
}

id objc_msgSend_dk_BOOLFromRequiredKey_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_BOOLFromRequiredKey:failed:");
}

id objc_msgSend_dk_numberFromRequiredKey_lowerBound_upperBound_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_inSet_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:inSet:failed:");
}

id objc_msgSend_dk_stringFromRequiredKey_maxLength_failed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dk_stringFromRequiredKey:maxLength:failed:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawColor");
}

id objc_msgSend_drawableView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawableView");
}

id objc_msgSend_drawingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawingMode");
}

id objc_msgSend_enableMaxBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMaxBrightness");
}

id objc_msgSend_endDrawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDrawing");
}

id objc_msgSend_endTestWithStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTestWithStatusCode:");
}

id objc_msgSend_fileDataRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDataRepresentation");
}

id objc_msgSend_findDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findDevice:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flashButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashButton");
}

id objc_msgSend_flashModeOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flashModeOn");
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

id objc_msgSend_getBlueLightStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBlueLightStatus:");
}

id objc_msgSend_getEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnabled");
}

id objc_msgSend_hideCameraView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideCameraView");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageScrollView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageScrollView");
}

id objc_msgSend_imageWithData_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:scale:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_color_thickness_instructionText_presentationOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:color:thickness:instructionText:presentationOptions:");
}

id objc_msgSend_initWithFrame_rectangleFillColor_rectangleEdgeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:rectangleFillColor:rectangleEdgeColor:");
}

id objc_msgSend_initWithLayoutStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLayoutStyle:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
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

id objc_msgSend_isDrawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDrawing");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layerWithSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layerWithSession:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_minimumSquareLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumSquareLength");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orangeColor");
}

id objc_msgSend_originPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originPoint");
}

id objc_msgSend_originalScreenBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "originalScreenBrightness");
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "output");
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayView");
}

id objc_msgSend_panGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panGesture");
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panGestureRecognizer");
}

id objc_msgSend_parseResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseResults");
}

id objc_msgSend_photoCaptureCompletionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoCaptureCompletionHandler");
}

id objc_msgSend_photoSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoSettings");
}

id objc_msgSend_postConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postConfiguration:");
}

id objc_msgSend_postInteractiveTestEvent_info_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postInteractiveTestEvent:info:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_previewView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previewView");
}

id objc_msgSend_rectangle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangle");
}

id objc_msgSend_rectangleEdgeColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleEdgeColor");
}

id objc_msgSend_rectangleFillColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleFillColor");
}

id objc_msgSend_rectangleWithFrame_borderColor_fillColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rectangleWithFrame:borderColor:fillColor:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_removeDrawingModeViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDrawingModeViews");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resetBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetBrightness");
}

id objc_msgSend_resetColorAdjustmentStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetColorAdjustmentStates");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_retakeButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retakeButton");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_saveAndMaximizeBrightness(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveAndMaximizeBrightness");
}

id objc_msgSend_saveColorAdjustmentStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveColorAdjustmentStates");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAdaptationClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdaptationClient:");
}

id objc_msgSend_setAllResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllResults:");
}

id objc_msgSend_setAllowsAutomaticFlash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsAutomaticFlash:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBlueLightClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlueLightClient:");
}

id objc_msgSend_setBlueLightStatusActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlueLightStatusActive:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBottomBar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBottomBar:");
}

id objc_msgSend_setBouncesZoom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBouncesZoom:");
}

id objc_msgSend_setBrightness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrightness:");
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClient:");
}

id objc_msgSend_setColorAdaptationStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorAdaptationStatus:");
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

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContinueButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContinueButton:");
}

id objc_msgSend_setCurrentImageView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentImageView:");
}

id objc_msgSend_setCurrentTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTag:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDecelerationRate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDecelerationRate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableAmbientLightAdaptation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableAmbientLightAdaptation:");
}

id objc_msgSend_setDrawColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawColor:");
}

id objc_msgSend_setDrawableView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawableView:");
}

id objc_msgSend_setDrawingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawingMode:");
}

id objc_msgSend_setEnableMaxBrightness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableMaxBrightness:");
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

id objc_msgSend_setFlashMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashMode:");
}

id objc_msgSend_setFlashModeOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashModeOn:");
}

id objc_msgSend_setFlashState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlashState:");
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

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageScrollView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageScrollView:");
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputs:");
}

id objc_msgSend_setIsDrawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDrawing:");
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

id objc_msgSend_setLivePhotoCaptureEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLivePhotoCaptureEnabled:");
}

id objc_msgSend_setMaximumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumNumberOfTouches:");
}

id objc_msgSend_setMaximumZoomScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumZoomScale:");
}

id objc_msgSend_setMinimumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumNumberOfTouches:");
}

id objc_msgSend_setMinimumSquareLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumSquareLength:");
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

id objc_msgSend_setOriginPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginPoint:");
}

id objc_msgSend_setOriginalScreenBrightness_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOriginalScreenBrightness:");
}

id objc_msgSend_setOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutput:");
}

id objc_msgSend_setOverlayView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverlayView:");
}

id objc_msgSend_setPanGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanGesture:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPhotoCaptureCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPhotoCaptureCompletionHandler:");
}

id objc_msgSend_setPreviewView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviewView:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setRectangle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRectangle:");
}

id objc_msgSend_setRetakeButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRetakeButton:");
}

id objc_msgSend_setScrollsToTop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollsToTop:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionPreset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionPreset:");
}

id objc_msgSend_setShapeView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShapeView:");
}

id objc_msgSend_setShouldShowPressHomeLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowPressHomeLabel:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrokeColor:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTapGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTapGesture:");
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

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUsePhotoButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsePhotoButton:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInteractionEnabled:");
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

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupCameraPreview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCameraPreview");
}

id objc_msgSend_setupSessionForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSessionForDevice:");
}

id objc_msgSend_shapeView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shapeView");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_showCameraView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCameraView");
}

id objc_msgSend_shutterButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButton");
}

id objc_msgSend_shutterButtonIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutterButtonIntrinsicContentSize");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRunning");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRunning");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag");
}

id objc_msgSend_takePictureWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takePictureWithHandler:");
}

id objc_msgSend_tapGesture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tapGesture");
}

id objc_msgSend_testAutomationEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testAutomationEnabled");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_updateDrawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDrawing:");
}

id objc_msgSend_usePhotoButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usePhotoButton");
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

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomScale");
}
