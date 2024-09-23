void sub_100003B18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (objc_msgSend(*(id *)(a1 + 32), "needsLandscapeOverlayUpdate"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isLandscapeMode"))
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100003C00;
      v6[3] = &unk_10000C360;
      v6[4] = *(_QWORD *)(a1 + 32);
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "landscapeTrapOverlay"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "label"));
      objc_msgSend(v3, "setAlpha:", 1.0);

    }
    else
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "landscapeTrapOverlay"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "label"));
      objc_msgSend(v4, "setAlpha:", 0.0);

    }
  }
}

void sub_100003C00(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateLandscapeOverlayImmediately");
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "landscapeTrapOverlay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "label"));
  objc_msgSend(v2, "setAlpha:", 0.0);

}

id sub_100003C58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLandscapeOverlayImmediately");
}

void sub_10000417C(id *a1)
{
  id WeakRetained;
  id v3;
  int v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (objc_msgSend(WeakRetained, "snapshottingEnabledUpdateIdentifier") == a1[6])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[4];
      v4 = 138412290;
      v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[BaseAnimoji] updating snapshottingEnabled applying futureValue: %@", (uint8_t *)&v4, 0xCu);
    }
    objc_msgSend(WeakRetained, "setSnapshottingEnabled:", objc_msgSend(a1[4], "BOOLValue"));
  }

}

void sub_1000051B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000051D8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "layoutMonitorDidUpdateDisplayLayout:withContext:", v7, v6);

}

void sub_10000549C(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "strongPopoverCurrentlyPresented"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setStrongPopoverCurrentlyPresented:", *(unsigned __int8 *)(a1 + 40));
    v6 = CFSTR("BaseMessagesViewControllerStrongPopupPresentedKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
    v7 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("BaseMessagesViewControllerStrongPopupPresentationNotification"), *(_QWORD *)(a1 + 32), v4);

  }
}

id sub_100005AD0(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_100005AF8(uint64_t a1)
{

}

void sub_100005B00(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "waitingOnPresentationStyleChange"))
  {
    objc_msgSend(WeakRetained, "requestPresentationStyle:", 1);
    v2 = dispatch_time(0, 500000000);
    dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, *(dispatch_block_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  }
  else
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void sub_100006850(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *ImageFromCurrentImageContext;
  id v13;
  CGSize v14;
  CGRect v15;

  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = a2;
  v14.width = v3;
  v14.height = v4;
  UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedColorWithTraitCollection:", v8));
  objc_msgSend(v9, "setFill");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v10, "bounds");
  UIRectFill(v15);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v11, "bounds");
  objc_msgSend(v5, "drawViewHierarchyInRect:afterScreenUpdates:", 1);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v13 = (id)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100006B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006B28(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldShowDisclosureWarning:", 0);

}

id objc_msgSend__configure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_configure");
}

id objc_msgSend__setShouldAlignToKeyboard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setShouldAlignToKeyboard:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addStickerViewToHiearchyIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStickerViewToHiearchyIfNeeded");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allowsEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsEditing");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_appBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBackgroundColor");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_automaticallyDisplaysLandscapeRotationOverlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automaticallyDisplaysLandscapeRotationOverlay");
}

id objc_msgSend_avatarStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "avatarStore");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_baseMessagesViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseMessagesViewController");
}

id objc_msgSend_beginWithStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginWithStore:");
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

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_childConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childConstraints");
}

id objc_msgSend_childStickersMessagesViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childStickersMessagesViewController");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configureNewTrapOverlayView_constraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureNewTrapOverlayView:constraints:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:multiplier:constant:");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraints");
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controller");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentControllerPresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentControllerPresentation");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentOrientation");
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSession");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultMessagesChildViewControllerForPresentationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMessagesChildViewControllerForPresentationContext:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didBecomeActiveWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didBecomeActiveWithConversation:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPresentEditorViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPresentEditorViewController");
}

id objc_msgSend_didResignActiveWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResignActiveWithConversation:");
}

id objc_msgSend_didShowExpandedMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didShowExpandedMode");
}

id objc_msgSend_didTransitionToPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didTransitionToPresentationStyle:");
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismiss");
}

id objc_msgSend_displayLayoutMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayLayoutMonitor");
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawViewHierarchyInRect:afterScreenUpdates:");
}

id objc_msgSend_editorViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "editorViewController");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_emptySnapshotImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "emptySnapshotImage");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithShouldBeSheetPresentationControllerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShouldBeSheetPresentationControllerDelegate:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFromKeyboard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFromKeyboard");
}

id objc_msgSend_isLandscapeMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLandscapeMode");
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoaded");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isOverlayShown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOverlayShown");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_landscapeOverlayMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "landscapeOverlayMessage");
}

id objc_msgSend_landscapeTrapOverlay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "landscapeTrapOverlay");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutMonitorDidUpdateDisplayLayout_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMonitorDidUpdateDisplayLayout:withContext:");
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

id objc_msgSend_modalBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modalBackgroundColor");
}

id objc_msgSend_modalMessagesController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modalMessagesController");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_needsLandscapeOverlayUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsLandscapeOverlayUpdate");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_overlayMessageBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayMessageBackgroundColor");
}

id objc_msgSend_overlayMessageTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overlayMessageTextColor");
}

id objc_msgSend_overridenTraitFromTrait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridenTraitFromTrait:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_pendingChildViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingChildViewController");
}

id objc_msgSend_pendingGlobalPresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingGlobalPresentation");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationContext");
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentationStyle");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_requestPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestPresentationStyle:");
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvedColorWithTraitCollection:");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_scheduleSnapshotEnabledUpdateAfter_currentValue_futureValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSnapshotEnabledUpdateAfter:currentValue:futureValue:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_setAllowEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowEditing:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAvatarStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvatarStore:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBaseMessagesViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseMessagesViewController:");
}

id objc_msgSend_setChildConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChildConstraints:");
}

id objc_msgSend_setChildStickersMessagesViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChildStickersMessagesViewController:");
}

id objc_msgSend_setConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstraints:");
}

id objc_msgSend_setCurrentAttributionKey_andApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentAttributionKey:andApp:");
}

id objc_msgSend_setCurrentControllerPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentControllerPresentation:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisclosureValidationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisclosureValidationDelegate:");
}

id objc_msgSend_setDisplayLayoutMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayLayoutMonitor:");
}

id objc_msgSend_setEditorViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditorViewController:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFill");
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

id objc_msgSend_setIsLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLoaded:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setModalMessagesController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalMessagesController:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setOverlayShown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverlayShown:");
}

id objc_msgSend_setPendingChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingChildViewController:");
}

id objc_msgSend_setPendingGlobalPresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPendingGlobalPresentation:");
}

id objc_msgSend_setPresenterDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresenterDelegate:");
}

id objc_msgSend_setShouldShowDisclosureWarning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowDisclosureWarning:");
}

id objc_msgSend_setSnapshottingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSnapshottingEnabled:");
}

id objc_msgSend_setStickerController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStickerController:");
}

id objc_msgSend_setStrongPopoverCurrentlyPresented_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStrongPopoverCurrentlyPresented:");
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

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUsageTrackingSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsageTrackingSession:");
}

id objc_msgSend_setWaitingOnPresentationStyleChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingOnPresentationStyleChange:");
}

id objc_msgSend_setupDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDisplayLayoutMonitor");
}

id objc_msgSend_setupStickerView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupStickerView");
}

id objc_msgSend_shouldPresentEditorFromKeyboardSplashScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPresentEditorFromKeyboardSplashScreen");
}

id objc_msgSend_shouldShowDisclosureWarning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowDisclosureWarning");
}

id objc_msgSend_showEditorViewControllerFromKeyboardSplashScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showEditorViewControllerFromKeyboardSplashScreen");
}

id objc_msgSend_snapshotInBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshotInBlock:");
}

id objc_msgSend_snapshottingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshottingEnabled");
}

id objc_msgSend_snapshottingEnabledUpdateIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshottingEnabledUpdateIdentifier");
}

id objc_msgSend_stickerController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerController");
}

id objc_msgSend_stickerControllerDidEnterBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerControllerDidEnterBackground");
}

id objc_msgSend_stickerControllerWillEnterForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerControllerWillEnterForeground");
}

id objc_msgSend_stickerViewControllerForStore_allowEditing_allowPeel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stickerViewControllerForStore:allowEditing:allowPeel:");
}

id objc_msgSend_strongPopoverCurrentlyPresented(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongPopoverCurrentlyPresented");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBackgroundColor");
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

id objc_msgSend_updateHiddenSubviewsForAnyOverlays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHiddenSubviewsForAnyOverlays");
}

id objc_msgSend_updateLandscapeOverlayIfNecessaryWithCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLandscapeOverlayIfNecessaryWithCoordinator:");
}

id objc_msgSend_updateLandscapeOverlayImmediately(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLandscapeOverlayImmediately");
}

id objc_msgSend_updateSnapshotWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSnapshotWithCompletionBlock:");
}

id objc_msgSend_updateWithPresentationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithPresentationContext:");
}

id objc_msgSend_usageTrackingSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageTrackingSession");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerForCreatingAvatarInStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForCreatingAvatarInStore:");
}

id objc_msgSend_viewWillBeObstructed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWillBeObstructed");
}

id objc_msgSend_waitingOnPresentationStyleChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingOnPresentationStyleChange");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willBecomeActiveWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willBecomeActiveWithConversation:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willResignActiveWithConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willResignActiveWithConversation:");
}

id objc_msgSend_willTransitionToPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willTransitionToPresentationStyle:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
