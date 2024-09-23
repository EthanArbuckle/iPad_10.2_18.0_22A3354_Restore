@implementation WKContentView(WKInteraction)

- (uint64_t)_elementDidFocus:()WKInteraction userIsInteracting:blurPreviousNode:activityStateChanges:userObject:
{
  uint64_t v2;
  uint64_t v3;

  if (*((_BYTE *)a1 + 8))
  {
    v2 = **a1;
    v3 = *(_QWORD *)(v2 + 3072);
    *(_QWORD *)(v2 + 3072) = 0;
    if (v3)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    }
  }
  return a1;
}

- (uint64_t)_prepareToDragPromisedAttachment:()WKInteraction
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  int v9;
  uint64_t v10;
  WTF *v12;
  _BYTE buf[12];
  __int16 v14;
  char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = qword_1ECE71078;
  if (os_log_type_enabled((os_log_t)qword_1ECE71078, OS_LOG_TYPE_DEFAULT))
  {
    v5 = **(_QWORD **)(a1 + 8);
    WTF::String::utf8();
    v6 = objc_msgSend(**(id **)(a1 + 24), "path");
    v7 = (char *)v12 + 16;
    *(_DWORD *)buf = 134218498;
    if (!v12)
      v7 = 0;
    *(_QWORD *)&buf[4] = v5;
    v14 = 2080;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_196BCC000, v4, OS_LOG_TYPE_DEFAULT, "Drag session: %p delivering promised attachment: %s at path: %@", buf, 0x20u);
    if (v12)
    {
      if (*(_DWORD *)v12 == 1)
        WTF::fastFree(v12, v8);
      else
        --*(_DWORD *)v12;
    }
  }
  *(_QWORD *)buf = 0;
  v9 = objc_msgSend(a2, "writeToURL:options:originalContentsURL:error:", **(_QWORD **)(a1 + 24), 0, 0, buf);
  v10 = **(_QWORD **)(a1 + 32);
  if (v9)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, **(_QWORD **)(a1 + 24), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, 0, *(_QWORD *)buf);
}

- (_QWORD)dragInteraction:()WKInteraction item:willAnimateCancelWithAnimator:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3507120;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)dragInteraction:()WKInteraction item:willAnimateCancelWithAnimator:
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 8), "removeFromSuperview");
  *(_BYTE *)(*(_QWORD *)(a1 + 16) + 3552) = 0;
  return result;
}

- (uint64_t)menuWithInlineAction:image:identifier:handler:
{
  uint64_t result;

  objc_destroyWeak((id *)(a1 + 40));
  result = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

- (void)menuWithInlineAction:image:identifier:handler:
{
  id WeakRetained;
  const void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(_QWORD, id))(**(_QWORD **)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), WeakRetained);
    CFRelease(v3);
  }
}

- (uint64_t)requestTextRecognition:imageData:sourceLanguageIdentifier:targetLanguageIdentifier:completionHandler:
{
  uint64_t v3;
  void *v4;
  CFTypeRef v5;
  void *v6;
  void *v7;
  _BYTE v9[16];
  uint64_t v10;
  uint64_t v11;
  CFTypeRef cf;

  WebKit::makeTextRecognitionResult(a2, (uint64_t)v9);
  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v3 + 16))(v3, v9);
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  WTF::Vector<WebCore::TextRecognitionBlockData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v4);
  WTF::Vector<WebCore::TextRecognitionDataDetector,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v10, v6);
  return WTF::Vector<WebCore::TextRecognitionLineData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v7);
}

- (uint64_t)imageAnalysisGestureDidBegin:()WKInteraction
{
  uint64_t v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E3507270;
  v2 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
    WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v2);
  v3 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v3)
    CFRelease(v3);
  objc_destroyWeak((id *)(a1 + 16));
  return a1;
}

{
  uint64_t v2;
  const void *v3;
  void *v4;

  *(_QWORD *)a1 = off_1E3507270;
  v2 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0;
  if (v2)
    WTF::RefCounted<WebKit::ImageAnalysisGestureDeferralToken>::deref(v2);
  v3 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v3)
    CFRelease(v3);
  objc_destroyWeak((id *)(a1 + 16));
  return WTF::fastFree((WTF *)a1, v4);
}

- (void)imageAnalysisGestureDidBegin:()WKInteraction
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if ((objc_msgSend(WeakRetained, "validateImageAnalysisRequestIdentifier:", *(_QWORD *)(a1 + 8)) & 1) == 0)
  {
LABEL_7:
    if (!WeakRetained)
      return;
    goto LABEL_8;
  }
  if (a2 != 1)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = 1;
    if (a2 == 2)
      objc_msgSend(WeakRetained, "_invokeAllActionsToPerformAfterPendingImageAnalysis:", 0);
    else
      objc_msgSend(WeakRetained, "_completeImageAnalysisRequestForContextMenu:requestIdentifier:hasTextResults:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 24));
    goto LABEL_7;
  }
  WeakRetained[3744] = 1;
  objc_msgSend(WeakRetained, "_invokeAllActionsToPerformAfterPendingImageAnalysis:", 1);
LABEL_8:
  CFRelease(WeakRetained);
}

- (uint64_t)_insertDynamicImageAnalysisContextMenuItemsIfPossible
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _WKActivatedElementInfo *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  **(_BYTE **)(a1 + 32) = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v4 = elementActionTypeToUIActionIdentifier(13);
  v5 = elementActionTypeToUIActionIdentifier(12);
  v6 = (void *)objc_msgSend(a2, "children");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = ___ZZ85__WKContentView_WKInteraction___insertDynamicImageAnalysisContextMenuItemsIfPossible_ENK3__4clEP6UIMenu_block_invoke;
  v24[3] = &unk_1E35072F0;
  v24[4] = v4;
  v24[5] = v5;
  v24[6] = &v29;
  v24[7] = &v25;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v24);
  v19 = a2;
  v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "children"), "mutableCopy");
  v8 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v12 != 0)) != 0)
        {
          if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqual:", elementActionTypeToUIActionIdentifier(14)))
          {
            if (objc_msgSend(**(id **)(a1 + 40), "copySubjectResultForImageContextMenu"))
              goto LABEL_12;
          }
          else if (objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqual:", v4)
                 && objc_msgSend(**(id **)(a1 + 40), "hasVisualSearchResultsForImageContextMenu"))
          {
LABEL_12:
            objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") & 0xFFFFFFFFFFFFFFFELL);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v35, 16);
    }
    while (v9);
  }
  if (!*((_BYTE *)v26 + 24) && objc_msgSend(**(id **)(a1 + 40), "hasSelectableTextForImageContextMenu"))
  {
    v13 = +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:userInfo:](_WKActivatedElementInfo, "activatedElementInfoWithInteractionInformationAtPosition:userInfo:", **(_QWORD **)(a1 + 40) + 1520, 0);
    objc_msgSend(v8, "addObject:", objc_msgSend(+[_WKElementAction _elementActionWithType:info:assistant:](_WKElementAction, "_elementActionWithType:info:assistant:", 12, v13, *(_QWORD *)(**(_QWORD **)(a1 + 40) + 832)), "uiActionForElementInfo:", v13));
  }
  if (*((_BYTE *)v30 + 24))
  {
    v14 = objc_msgSend(**(id **)(a1 + 40), "machineReadableCodeSubMenuForImageContextMenu");
    if (v14)
      objc_msgSend(v8, "addObject:", v14);
  }
  v15 = qword_1ECE71C18;
  if (os_log_type_enabled((os_log_t)qword_1ECE71C18, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134217984;
    v34 = v16;
    _os_log_impl(&dword_196BCC000, v15, OS_LOG_TYPE_DEFAULT, "Dynamically inserting %zu context menu action(s)", buf, 0xCu);
  }
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  v17 = objc_msgSend(v19, "menuByReplacingChildren:", v7);
  if (v8)
    CFRelease(v8);
  if (v7)
    CFRelease(v7);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v17;
}

- (void)beginTextRecognitionForFullscreenVideo:playerViewController:
{
  id WeakRetained;
  const void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    *((_DWORD *)WeakRetained + 976) = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "setImageAnalysis:", a2);
    CFRelease(v5);
  }
}

- (uint64_t)becomeFirstResponderForWebView
{
  void *v2;

  *a1 = off_1E35074B8;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)becomeFirstResponderForWebView
{
  id *v1;
  id WeakRetained;

  v1 = (id *)(a1 + 8);
  if (objc_loadWeak((id *)(a1 + 8)))
  {
    WeakRetained = objc_loadWeakRetained(v1);
    objc_msgSend(WeakRetained, "stopDeferringInputViewUpdates:", 1);
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
}

- (uint64_t)resignFirstResponderForWebView
{
  void *v2;

  *a1 = off_1E35074E0;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)resignFirstResponderForWebView
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    if ((objc_msgSend(WeakRetained, "isFirstResponder") & 1) == 0)
      objc_msgSend(v2, "_cancelPendingKeyEventHandlers:", 1);
    CFRelease(v2);
  }
}

- (uint64_t)_keyboardDidShow
{
  void *v2;

  *a1 = off_1E3507508;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_keyboardDidShow
{
  uint64_t *WeakRetained;
  uint64_t *v2;
  uint64_t v3;

  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = WeakRetained[368];
    if (v3)
      WebKit::RevealFocusedElementDeferrer::fulfill(v3, 4);
    CFRelease(v2);
  }
}

- (uint64_t)_isPanningScrollViewOrAncestor:()WKInteraction
{
  if ((objc_msgSend(a2, "isDragging") & 1) != 0 || (objc_msgSend(a2, "isDecelerating") & 1) != 0)
    return 1;
  else
    return objc_msgSend((id)objc_msgSend(a2, "panGestureRecognizer"), "_wk_hasRecognizedOrEnded");
}

- (uint64_t)_isInterruptingDecelerationForScrollViewOrAncestor:()WKInteraction
{
  return objc_msgSend(a2, "_wk_isInterruptingDeceleration");
}

- (uint64_t)pasteWithCompletionHandler:()WKInteraction
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (_QWORD)lookupForWebView:()WKInteraction
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E35075B8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)lookupForWebView:()WKInteraction
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E35075B8;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (WebKit::WebPageProxy)lookupForWebView:()WKInteraction
{
  WebKit::WebPageProxy *v4;
  uint64_t v5;
  BOOL v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WebKit::WebPageProxy *v36;
  int v37;
  int v38;

  if (*a2)
  {
    v4 = result;
    result = *(WebKit::WebPageProxy **)(*((_QWORD *)result + 1) + 440);
    v5 = *((_QWORD *)result + 4);
    if (*(_BYTE *)(v5 + 560))
    {
      if (*(_BYTE *)(v5 + 688))
      {
        if (*(_BYTE *)(v5 + 234))
          v9 = *(_DWORD *)(v5 + 636) == 0;
        else
          v9 = 1;
        if (v9)
        {
          WebCore::IntRect::operator CGRect();
        }
        else
        {
          LODWORD(v36) = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates(result);
          HIDWORD(v36) = v10;
          v37 = v11;
          v38 = v12;
          WebCore::FloatRect::operator CGRect();
        }
        v17 = *a3;
        if (*a3)
          *(_DWORD *)v17 += 2;
        v35 = v17;
        v18 = *a2;
        if (*a2)
          *(_DWORD *)v18 += 2;
        v31 = v15;
        v32 = v16;
        v29 = v13;
        v30 = v14;
        v34 = v18;
        v19 = *a4;
        if (*a4)
          *(_DWORD *)v19 += 2;
        v33 = v19;
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v35, (uint64_t *)&v34, (uint64_t *)&v33, &v36);
        v21 = v33;
        v33 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2)
            WTF::StringImpl::destroy(v21, v20);
          else
            *(_DWORD *)v21 -= 2;
        }
        v22 = v34;
        v34 = 0;
        if (v22)
        {
          if (*(_DWORD *)v22 == 2)
            WTF::StringImpl::destroy(v22, v20);
          else
            *(_DWORD *)v22 -= 2;
        }
        v23 = v35;
        v35 = 0;
        if (v23)
        {
          if (*(_DWORD *)v23 == 2)
            WTF::StringImpl::destroy(v23, v20);
          else
            *(_DWORD *)v23 -= 2;
        }
        if (*a3)
          v24 = *((unsigned int *)*a3 + 1);
        else
          v24 = 0;
        if (*a2)
          v25 = *((unsigned int *)*a2 + 1);
        else
          v25 = 0;
        v26 = *((_QWORD *)v4 + 1);
        v27 = *(void **)(v26 + 720);
        if (v27)
        {
          CFRetain(*(CFTypeRef *)(v26 + 720));
          if (v36)
            v28 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v28 = &stru_1E351F1B8;
          objc_msgSend(v27, "lookup:withRange:fromRect:", v28, v24, v25, v29, v30, v31, v32);
          CFRelease(v27);
        }
        result = v36;
        v36 = 0;
        if (result)
        {
          if (*(_DWORD *)result == 2)
            return (WebKit::WebPageProxy *)WTF::StringImpl::destroy(result, v20);
          else
            *(_DWORD *)result -= 2;
        }
      }
    }
  }
  return result;
}

- (_QWORD)shareForWebView:()WKInteraction
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E35075E0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)shareForWebView:()WKInteraction
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(void **)(v2 + 720);
  result = *a2;
  if (v3)
    v5 = result == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v2 + 440) + 32);
    if (*(_BYTE *)(v6 + 688))
    {
      if (*(_DWORD *)(v6 + 636))
      {
        result = WTF::StringImpl::operator NSString *();
        if (*(_DWORD *)(v6 + 636))
        {
          v7 = result;
          v9 = WebCore::SelectionGeometry::rect(*(WebCore::SelectionGeometry **)(v6 + 624));
          v10 = v8;
          WebCore::IntRect::operator CGRect();
          return objc_msgSend(v3, "showShareSheetFor:fromRect:", v7, v9, v10);
        }
        else
        {
          __break(0xC471u);
        }
      }
    }
  }
  return result;
}

- (uint64_t)translateForWebView:()WKInteraction
{
  void *v2;

  *a1 = off_1E3507608;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)translateForWebView:()WKInteraction
{
  id *v3;
  _QWORD *WeakRetained;
  WebKit::WebPageProxy *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;

  v3 = (id *)(a1 + 8);
  if (objc_loadWeak((id *)(a1 + 8)) && *(_QWORD *)a2 && *(_DWORD *)(*(_QWORD *)a2 + 4))
  {
    WeakRetained = objc_loadWeakRetained(v3);
    v5 = (WebKit::WebPageProxy *)WeakRetained[55];
    v6 = *((_QWORD *)v5 + 4);
    if (*(_BYTE *)(v6 + 688) && *(_DWORD *)(v6 + 636))
    {
      v7 = (void *)WeakRetained[90];
      if (*(_QWORD *)a2)
      {
        v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
        v5 = (WebKit::WebPageProxy *)WeakRetained[55];
      }
      else
      {
        v8 = &stru_1E351F1B8;
      }
      LODWORD(v12) = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates(v5);
      HIDWORD(v12) = v9;
      v13 = __PAIR64__(v11, v10);
      WebCore::FloatRect::operator CGRect();
      objc_msgSend(v7, "translate:fromRect:", v8, v12, v13);
    }
    CFRelease(WeakRetained);
  }
}

- (_QWORD)accessibilityRetrieveSpeakSelectionContent
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3507658;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)accessibilityRetrieveSpeakSelectionContent
{
  void *v4;
  const __CFString *v5;
  uint64_t result;
  void *v7;
  const __CFString *v8;

  v4 = *(void **)(a1 + 16);
  if (*a2)
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  objc_msgSend(v4, "_accessibilityDidGetSpeakSelectionContent:", v5);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    v7 = *(void **)(a1 + 8);
    if (*a2)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_1E351F1B8;
    return objc_msgSend(v7, "accessibilitySpeakSelectionSetContent:", v8);
  }
  return result;
}

- (_QWORD)_accessibilityRetrieveRectsEnclosingSelectionOffset:()WKInteraction withGranularity:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3507680;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_accessibilityRetrieveRectsEnclosingSelectionOffset:()WKInteraction withGranularity:
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 8), "_accessibilityDidGetSelectionRects:withGranularity:atOffset:", objc_msgSend(*(id *)(a1 + 8), "webSelectionRectsForSelectionGeometries:", a2), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 16));
  return result;
}

- (uint64_t)_accessibilityRetrieveRectsAtSelectionOffset:()WKInteraction withText:completionHandler:
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 24);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 8), "_accessibilityDidGetSelectionRects:withGranularity:atOffset:", objc_msgSend(*(id *)(a1 + 8), "webSelectionRectsForSelectionGeometries:", a2), 1, *(_QWORD *)(a1 + 16));
  return result;
}

- (_QWORD)changeSelectionWithGestureAt:()WKInteraction withGesture:withState:withFlags:
{
  const void *v2;

  *a1 = &off_1E35076D0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)changeSelectionWithGestureAt:()WKInteraction withGesture:withState:withFlags:
{
  uint64_t result;

  result = selectionChangedWithGesture(*(void **)(*(_QWORD *)(a1 + 8) + 720), a2, a3, a4, *(_BYTE *)(a1 + 32) & 7u | a5);
  if ((unint64_t)(*(_QWORD *)(a1 + 24) - 3) <= 1)
    *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2962) = 0;
  return result;
}

- (_QWORD)changeSelectionWithTouchAt:()WKInteraction withSelectionTouch:baseIsStart:withFlags:
{
  const void *v2;

  *a1 = &off_1E35076F8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)changeSelectionWithTouchAt:()WKInteraction withSelectionTouch:baseIsStart:withFlags:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t result;

  v6 = *(void **)(*(_QWORD *)(a1 + 8) + 720);
  v7 = *(_QWORD *)(a1 + 24) & 7 | a4;
  WebCore::IntPoint::operator CGPoint();
  v8 = a3;
  switch(a3)
  {
    case 1u:
      v9 = v7 & 7;
      v10 = v6;
      v11 = 1;
      goto LABEL_4;
    case 2u:
      goto LABEL_8;
    case 3u:
      v8 = 3;
      goto LABEL_8;
    case 4u:
      v8 = 4;
      goto LABEL_8;
    case 5u:
      v8 = 5;
LABEL_8:
      result = objc_msgSend(v6, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", v8, v7 & 7);
      *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2962) = 0;
      break;
    default:
      v9 = v7 & 7;
      v10 = v6;
      v11 = 0;
LABEL_4:
      result = objc_msgSend(v10, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", v11, v9);
      break;
  }
  return result;
}

- (_QWORD)changeSelectionWithTouchesFrom:()WKInteraction to:withGesture:withState:
{
  const void *v2;

  *a1 = &off_1E3507720;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)changeSelectionWithTouchesFrom:()WKInteraction to:withGesture:withState:
{
  char v5;
  uint64_t result;

  v5 = a4;
  result = selectionChangedWithGesture(*(void **)(*(_QWORD *)(a1 + 8) + 720), a2, a3, a4, a5);
  if ((v5 - 3) <= 1u)
    *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2962) = 0;
  return result;
}

- (_QWORD)moveByOffset:()WKInteraction
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3507748;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)moveByOffset:()WKInteraction
{
  return objc_msgSend(*(id *)(a1 + 8), "_internalEndSelectionChange");
}

- (uint64_t)requestAutocorrectionRectsForString:()WKInteraction withCompletionHandler:
{
  uint64_t result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!*(_DWORD *)(a2 + 12))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  result = WebCore::FloatRect::operator CGRect();
  if (*(_DWORD *)(a2 + 12))
  {
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    WebCore::FloatRect::operator CGRect();
    +[WKAutocorrectionRects autocorrectionRectsWithFirstCGRect:lastCGRect:](WKAutocorrectionRects, "autocorrectionRectsWithFirstCGRect:lastCGRect:", v9, v10, v11, v12, v13, v14, v15, v16);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  }
  __break(0xC471u);
  return result;
}

- (_QWORD)_internalRequestTextRectsForString:()WKInteraction completion:
{
  uint64_t v2;
  const void *v3;

  *a1 = &off_1E3507798;
  v2 = a1[2];
  a1[2] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)_internalRequestTextRectsForString:()WKInteraction completion:
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  _QWORD *v25;

  if (*(_DWORD *)(a2 + 12))
  {
    result = WebCore::FloatRect::operator CGRect();
    if (!*(_DWORD *)(a2 + 12))
    {
      __break(0xC471u);
      return result;
    }
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    WebCore::FloatRect::operator CGRect();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D648];
    v16 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
    v20 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = v16;
    v11 = v18;
    v12 = v20;
  }
  v21 = *(_QWORD *)(a1 + 8);
  v22 = *(_QWORD *)(a2 + 16);
  if (v22)
    CFRetain(*(CFTypeRef *)(a2 + 16));
  v23 = *(const void **)(v21 + 1448);
  *(_QWORD *)(v21 + 1448) = v22;
  if (v23)
    CFRelease(v23);
  v24 = *(_QWORD *)(a1 + 16);
  v25 = (_QWORD *)(*(_QWORD *)(a1 + 8) + 1448);
  v25[1] = v9;
  v25[2] = v10;
  v25[3] = v11;
  v25[4] = v12;
  v25[5] = v14;
  v25[6] = v16;
  v25[7] = v18;
  v25[8] = v20;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v24 + 16))(v24, a2);
}

- (uint64_t)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:()WKInteraction
{
  *(_QWORD *)a1 = off_1E35077E8;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;

  *(_QWORD *)a1 = off_1E35077E8;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)requestPreferredArrowDirectionForEditMenuWithCompletionHandler:()WKInteraction
{
  uint64_t *WeakRetained;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = WeakRetained[55];
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;
      v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v6 = off_1E3507810;
      v6[1] = v5;
      v8 = v6;
      WebKit::WebPageProxy::requestEvasionRectsAboveSelection(v4, (uint64_t *)&v8);
      v7 = (uint64_t)v8;
      v8 = 0;
      if (v7)
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
      _Block_release(0);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    }
    CFRelease(v3);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
}

- (uint64_t)removeBackgroundMenu
{
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WebKit *v11;
  const WTF::String *v12;
  WTF::StringImpl *v13;
  CFTypeRef v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  const void *v18;
  uint64_t v19;
  void *v20;
  WTF::StringImpl *v21;
  CFTypeRef v22;
  CFTypeRef v23;
  WTF::StringImpl *v24;
  CFTypeRef v25;
  uint64_t v27[2];
  CFTypeRef v28;
  CFTypeRef v29;
  WTF::StringImpl *v30[3];
  CFTypeRef cf[2];
  WTF::StringImpl *v32;
  _OWORD v33[5];
  CFTypeRef v34;
  WTF::StringImpl *v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (__int128 *)(a2 + 3952);
  LOBYTE(v33[0]) = 0;
  v36 = 0;
  LOBYTE(v37) = 0;
  v43 = 0;
  if (*(_BYTE *)(a2 + 4048))
  {
    v4 = *(_OWORD *)(a2 + 4000);
    v39 = *(_OWORD *)(a2 + 3984);
    v40 = v4;
    v5 = *(_OWORD *)(a2 + 3968);
    v37 = *v3;
    v38 = v5;
    v6 = *(_OWORD *)(a2 + 4016);
    v7 = *(_OWORD *)(a2 + 4032);
    *(_QWORD *)(a2 + 4032) = 0;
    *(_QWORD *)(a2 + 4040) = 0;
    v41 = v6;
    v42 = v7;
    v43 = 1;
  }
  std::__optional_storage_base<WebKit::RemoveBackgroundData,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WebKit::RemoveBackgroundData,false>>((uint64_t)v3, (uint64_t)v33);
  std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v33, v8);
  if (v43)
  {
    v33[2] = v39;
    v33[3] = v40;
    v33[4] = v41;
    v33[0] = v37;
    v33[1] = v38;
    v34 = (CFTypeRef)v42;
    if ((_QWORD)v42)
      CFRetain((CFTypeRef)v42);
    v10 = (WTF::StringImpl *)*((_QWORD *)&v42 + 1);
    if (*((_QWORD *)&v42 + 1))
      **((_DWORD **)&v42 + 1) += 2;
    v35 = v10;
    v11 = (WebKit *)v34;
    WTF::String::createCFString((WTF::String *)&v35);
    MEMORY[0x19AEABCC8](v30, cf[0]);
    WebKit::imageDataForRemoveBackground(v11, v30, v12, (WebKit *)&v28);
    v13 = v30[0];
    v30[0] = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v9);
      else
        *(_DWORD *)v13 -= 2;
    }
    v14 = cf[0];
    cf[0] = 0;
    if (v14)
      CFRelease(v14);
    if (v28)
    {
      v15 = *(_QWORD *)(a2 + 440);
      MEMORY[0x19AEABCC8](&v32, v29);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector(v27, (_DWORD **)&v32, 1uLL);
      v16 = (void *)v28;
      if (v28)
      {
        v17 = (const void *)objc_msgSend((id)v28, "bytes");
        v18 = (const void *)objc_msgSend(v16, "length");
      }
      else
      {
        v17 = 0;
        v18 = 0;
      }
      cf[0] = v17;
      cf[1] = v18;
      v19 = *(_QWORD *)(v15 + 208);
      v30[0] = (WTF::StringImpl *)v33;
      v30[1] = (WTF::StringImpl *)v27;
      v30[2] = (WTF::StringImpl *)cf;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ReplaceImageForRemoveBackground>(v19, (uint64_t)v30, *(_QWORD *)(*(_QWORD *)(v15 + 32) + 1896), 0);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v27, v20);
      v21 = v32;
      v32 = 0;
      if (v21)
      {
        if (*(_DWORD *)v21 == 2)
          WTF::StringImpl::destroy(v21, v9);
        else
          *(_DWORD *)v21 -= 2;
      }
    }
    v22 = v29;
    v29 = 0;
    if (v22)
      CFRelease(v22);
    v23 = v28;
    v28 = 0;
    if (v23)
      CFRelease(v23);
    v24 = v35;
    v35 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2)
        WTF::StringImpl::destroy(v24, v9);
      else
        *(_DWORD *)v24 -= 2;
    }
    v25 = v34;
    v34 = 0;
    if (v25)
      CFRelease(v25);
  }
  return std::__optional_destruct_base<WebKit::RemoveBackgroundData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v37, v9);
}

- (uint64_t)doAfterComputingImageAnalysisResultsForBackgroundRemoval:()WKInteraction
{
  uint64_t v2;

  *(_QWORD *)a1 = off_1E3507860;
  objc_destroyWeak((id *)(a1 + 104));
  v2 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

{
  void *v2;
  uint64_t v3;

  *(_QWORD *)a1 = off_1E3507860;
  objc_destroyWeak((id *)(a1 + 104));
  v3 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)doAfterComputingImageAnalysisResultsForBackgroundRemoval:()WKInteraction
{
  id *v4;
  uint64_t *WeakRetained;
  uint64_t *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  id v27[3];

  v27[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 104);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 104));
  v6 = WeakRetained;
  if (a2 && WeakRetained)
  {
    v7 = WeakRetained[55];
    v8 = *(_OWORD *)(a1 + 64);
    v23 = *(_OWORD *)(a1 + 48);
    v24 = v8;
    v9 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;
    v10 = *(_QWORD *)(a1 + 80);
    v11 = *(_OWORD *)(a1 + 32);
    v21 = *(_OWORD *)(a1 + 16);
    v22 = v11;
    *(_QWORD *)&v25 = v10;
    v26 = v9;
    v27[0] = 0;
    objc_moveWeak(v27, v4);
    v12 = WTF::fastMalloc((WTF *)0x70);
    *(_QWORD *)v12 = off_1E3507888;
    v14 = v24;
    v13 = v25;
    *(_OWORD *)(v12 + 48) = v23;
    *(_OWORD *)(v12 + 64) = v14;
    *(_OWORD *)(v12 + 80) = v13;
    v15 = v22;
    *(_OWORD *)(v12 + 16) = v21;
    *(_OWORD *)(v12 + 32) = v15;
    v16 = v26;
    v26 = 0;
    *(_QWORD *)(v12 + 96) = v16;
    *(_QWORD *)(v12 + 104) = 0;
    objc_moveWeak((id *)(v12 + 104), v27);
    v20 = v12;
    WebKit::WebPageProxy::requestImageBitmap(v7, a1 + 16, &v20);
    v17 = v20;
    v20 = 0;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    objc_destroyWeak(v27);
    v18 = v26;
    v26 = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
    if (!v6)
      return;
  }
  CFRelease(v6);
}

- (uint64_t)_selectPositionAtPoint:()WKInteraction stayingWithinFocusedElement:completionHandler:
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2962) = 0;
  return result;
}

- (uint64_t)selectPositionAtBoundary:()WKInteraction inDirection:fromPoint:completionHandler:
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2962) = 0;
  return result;
}

- (uint64_t)moveSelectionAtBoundary:()WKInteraction inDirection:completionHandler:
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2962) = 0;
  return result;
}

- (uint64_t)selectTextWithGranularity:()WKInteraction atPoint:completionHandler:
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  v3 = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v3 + 2962) = 0;
  --*(_QWORD *)(v3 + 3040);
  return result;
}

- (uint64_t)beginSelectionInDirection:()WKInteraction completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)updateSelectionWithExtentPoint:()WKInteraction withBoundary:completionHandler:
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  --*(_QWORD *)(*(_QWORD *)(a1 + 16) + 3040);
  return result;
}

- (uint64_t)applyAutocorrection:()WKInteraction toString:isCandidate:withCompletionHandler:
{
  if (a2)
    +[WKAutocorrectionRects autocorrectionRectsWithFirstCGRect:lastCGRect:](WKAutocorrectionRects, "autocorrectionRectsWithFirstCGRect:lastCGRect:", *(double *)(*(_QWORD *)(a1 + 16) + 1456), *(double *)(*(_QWORD *)(a1 + 16) + 1464), *(double *)(*(_QWORD *)(a1 + 16) + 1472), *(double *)(*(_QWORD *)(a1 + 16) + 1480), *(double *)(*(_QWORD *)(a1 + 16) + 1488), *(double *)(*(_QWORD *)(a1 + 16) + 1496), *(double *)(*(_QWORD *)(a1 + 16) + 1504), *(double *)(*(_QWORD *)(a1 + 16) + 1512));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)requestAutocorrectionContextWithCompletionHandler:()WKInteraction
{
  if ((a2 & 1) != 0)
    +[WKAutocorrectionContext autocorrectionContextWithWebContext:](WKAutocorrectionContext, "autocorrectionContextWithWebContext:", *(_QWORD *)(a1 + 16) + 1400);
  else
    +[WKAutocorrectionContext emptyAutocorrectionContext](WKAutocorrectionContext, "emptyAutocorrectionContext");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_becomeFirstResponderWithSelectionMovingForward:()WKInteraction completionHandler:
{
  uint64_t v1;

  if (*(_QWORD *)(result + 16))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 8), "becomeFirstResponder");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 16) + 16))();
  }
  return result;
}

- (_QWORD)accessoryView:()WKInteraction tabInDirection:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3507A68;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)accessoryView:()WKInteraction tabInDirection:
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 8), "_internalEndSelectionChange");
  result = objc_msgSend(*(id *)(a1 + 8), "reloadInputViews");
  *(_BYTE *)(*(_QWORD *)(a1 + 8) + 2965) = 0;
  return result;
}

- (uint64_t)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
  void *v2;

  *a1 = off_1E3507A90;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    --WeakRetained[378];
    CFRelease(WeakRetained);
  }
}

- (uint64_t)removeEmojiAlternatives
{
  void *v2;

  *a1 = off_1E3507AB8;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)removeEmojiAlternatives
{
  _QWORD *WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t *v19;
  WTF *v20;
  uint64_t v21;
  const void *v22;
  void *v23;
  WTF *v24;
  _QWORD *cf;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  WTF *v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained[55];
    if (v4)
    {
      cf = WeakRetained;
      CFRetain(*(CFTypeRef *)(v4 + 8));
      v31 = 0;
      v32 = 0;
      v5 = *(unsigned int *)(a2 + 12);
      if ((_DWORD)v5)
      {
        v6 = *(uint64_t **)a2;
        v7 = *(_QWORD *)a2 + 8 * v5;
        do
        {
          v30 = *v6;
          v8 = (void *)WebKit::WebPageProxy::platformDictationAlternatives(v4, v30);
          v9 = v8;
          if (v8)
          {
            v10 = (void *)objc_msgSend(v8, "alternativeStrings");
            v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v27;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v27 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                  if ((objc_msgSend(v15, "_containsEmojiOnly") & 1) == 0)
                    objc_msgSend(v11, "addObject:", v15);
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
              }
              while (v12);
            }
            v16 = objc_msgSend(v11, "count");
            if (v16 != objc_msgSend(v10, "count"))
            {
              if (objc_msgSend(v11, "count"))
              {
                v17 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA250]), "initWithPrimaryString:alternativeStrings:isLowConfidence:", objc_msgSend(v9, "primaryString"), v11, objc_msgSend(v9, "isLowConfidence"));
              }
              else
              {
                v18 = HIDWORD(v32);
                if (HIDWORD(v32) == (_DWORD)v32)
                {
                  v19 = (uint64_t *)WTF::Vector<WTF::ObjectIdentifierGeneric<WebCore::DictationContextType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v31, HIDWORD(v32) + 1, (unint64_t)&v30);
                  v18 = HIDWORD(v32);
                  v20 = v31;
                  v21 = *v19;
                }
                else
                {
                  v21 = v30;
                  v20 = v31;
                }
                *((_QWORD *)v20 + v18) = v21;
                v17 = 0;
                ++HIDWORD(v32);
              }
              v22 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92708]), "_initWithNSTextAlternatives:", v17);
              (*(void (**)(_QWORD, const void *, uint64_t))(**(_QWORD **)(*(_QWORD *)(v4 + 40) + 8) + 792))(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8), v22, v30);
              if (v22)
                CFRelease(v22);
              if (v17)
                CFRelease(v17);
            }
          }
          ++v6;
        }
        while (v6 != (uint64_t *)v7);
      }
      WebKit::WebPageProxy::clearDictationAlternatives(v4, (uint64_t)&v31);
      v24 = v31;
      if (v31)
      {
        v31 = 0;
        LODWORD(v32) = 0;
        WTF::fastFree(v24, v23);
      }
      CFRelease(*(CFTypeRef *)(v4 + 8));
      WeakRetained = cf;
    }
    CFRelease(WeakRetained);
  }
}

- (uint64_t)_focusTextInputContext:()WKInteraction placeCaretAt:completionHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E3507AE0;
  _Block_release(*(const void **)(a1 + 24));
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;

  *(_QWORD *)a1 = off_1E3507AE0;
  _Block_release(*(const void **)(a1 + 24));
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  objc_destroyWeak((id *)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_focusTextInputContext:()WKInteraction placeCaretAt:completionHandler:
{
  _BYTE *WeakRetained;
  _BYTE *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (a2)
      v6 = objc_msgSend(WeakRetained, "_isTextInputContextFocused:", *(_QWORD *)(a1 + 16));
    else
      v6 = 0;
    v5[2969] |= v6;
    v5[2962] = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
    CFRelease(v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
  }
}

- (uint64_t)_requestTextInputContextsInRect:()WKInteraction completionHandler:
{
  id *v2;
  void *v3;

  *a1 = off_1E3507B08;
  v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_requestTextInputContextsInRect:()WKInteraction completionHandler:
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained && *((_DWORD *)a2 + 3))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a2 + 3));
    v6 = *((unsigned int *)a2 + 3);
    if ((_DWORD)v6)
    {
      v7 = *a2;
      v8 = 80 * v6;
      do
      {
        v9 = -[_WKTextInputContext _initWithTextInputContext:]([_WKTextInputContext alloc], "_initWithTextInputContext:", v7);
        if (v9)
        {
          objc_msgSend(v5, "addObject:", v9);
          CFRelease(v9);
        }
        v7 += 80;
        v8 -= 80;
      }
      while (v8);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    if (v5)
      CFRelease(v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  }
  if (WeakRetained)
    CFRelease(WeakRetained);
}

- (_QWORD)_executeEditCommand:()WKInteraction notifyDelegate:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3507B30;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_executeEditCommand:()WKInteraction notifyDelegate:
{
  if (*(_BYTE *)(result + 16))
    return objc_msgSend(*(id *)(result + 8), "_internalEndSelectionChange");
  return result;
}

- (uint64_t)updateCurrentFocusedElementInformation:()WKInteraction
{
  id *v4;
  char *WeakRetained;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t (*v19)(void);

  v4 = (id *)(a1 + 24);
  if (objc_loadWeak((id *)(a1 + 24)) && *((_BYTE *)a2 + 416) && *((_QWORD *)a2 + 47) == *(_QWORD *)(a1 + 16))
  {
    WeakRetained = (char *)objc_loadWeakRetained(v4);
    v6 = a2[3];
    v8 = *a2;
    v7 = a2[1];
    *((_OWORD *)WeakRetained + 145) = a2[2];
    *((_OWORD *)WeakRetained + 146) = v6;
    *((_OWORD *)WeakRetained + 143) = v8;
    *((_OWORD *)WeakRetained + 144) = v7;
    v9 = a2[7];
    v11 = a2[4];
    v10 = a2[5];
    *((_OWORD *)WeakRetained + 149) = a2[6];
    *((_OWORD *)WeakRetained + 150) = v9;
    *((_OWORD *)WeakRetained + 147) = v11;
    *((_OWORD *)WeakRetained + 148) = v10;
    v13 = a2[9];
    v12 = a2[10];
    v14 = a2[8];
    *(_OWORD *)(WeakRetained + 2460) = *(__int128 *)((char *)a2 + 172);
    *((_OWORD *)WeakRetained + 152) = v13;
    *((_OWORD *)WeakRetained + 153) = v12;
    *((_OWORD *)WeakRetained + 151) = v14;
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 310, (WTF::StringImpl *)(a2 + 12));
    WTF::Vector<WebKit::OptionItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(WeakRetained + 2488), (uint64_t)a2 + 200);
    *((_DWORD *)WeakRetained + 626) = *((_DWORD *)a2 + 54);
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 314, (WTF::StringImpl *)(a2 + 14));
    *((_QWORD *)WeakRetained + 315) = *((_QWORD *)a2 + 29);
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 316, (WTF::StringImpl *)(a2 + 15));
    *((_WORD *)WeakRetained + 1268) = *((_WORD *)a2 + 124);
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 318, (WTF::StringImpl *)(a2 + 16));
    v15 = *(__int128 *)((char *)a2 + 264);
    *(_OWORD *)(WeakRetained + 2568) = *(__int128 *)((char *)a2 + 280);
    *(_OWORD *)(WeakRetained + 2552) = v15;
    *((_WORD *)WeakRetained + 1292) = *((_WORD *)a2 + 148);
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 324, (WTF::StringImpl *)(a2 + 19));
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 325, (WTF::StringImpl *)((char *)a2 + 312));
    WTF::String::operator=((WTF::StringImpl **)WeakRetained + 326, (WTF::StringImpl *)(a2 + 20));
    *((_WORD *)WeakRetained + 1308) = *((_WORD *)a2 + 164);
    WebCore::Color::operator=();
    WTF::Vector<WebCore::Color,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((uint64_t)(WeakRetained + 2632), (uint64_t *)a2 + 43);
    v16 = *(__int128 *)((char *)a2 + 360);
    v17 = *(__int128 *)((char *)a2 + 376);
    v18 = *(__int128 *)((char *)a2 + 392);
    *((_QWORD *)WeakRetained + 337) = *((_QWORD *)a2 + 51);
    *(_OWORD *)(WeakRetained + 2664) = v17;
    *(_OWORD *)(WeakRetained + 2680) = v18;
    *(_OWORD *)(WeakRetained + 2648) = v16;
    CFRelease(WeakRetained);
    v19 = *(uint64_t (**)(void))(**(_QWORD **)(a1 + 8) + 16);
  }
  else
  {
    v19 = *(uint64_t (**)(void))(**(_QWORD **)(a1 + 8) + 16);
  }
  return v19();
}

- (uint64_t)selectWordForReplacement
{
  void *v2;

  *a1 = off_1E3507B80;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)selectWordForReplacement
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_internalEndSelectionChange");
    CFRelease(v2);
  }
}

- (uint64_t)requestRVItemInSelectedRangeWithCompletionHandler:()WKInteraction
{
  *(_QWORD *)a1 = off_1E3507BA8;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;

  *(_QWORD *)a1 = off_1E3507BA8;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)requestRVItemInSelectedRangeWithCompletionHandler:()WKInteraction
{
  id WeakRetained;
  const void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    WebKit::RevealItem::item(a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
    CFRelease(v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
}

- (uint64_t)_internalSelectTextForContextMenuWithLocationInView:()WKInteraction completionHandler:
{
  id *v2;
  void *v3;

  *a1 = off_1E3507BD0;
  v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_internalSelectTextForContextMenuWithLocationInView:()WKInteraction completionHandler:
{
  id *v6;
  id *WeakRetained;
  id *v8;
  WTF::StringImpl *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  void *aBlock;
  WTF::StringImpl *v16;
  CFTypeRef v17[2];
  CFTypeRef cf;
  id v19;
  uint64_t v20;

  v6 = (id *)(a1 + 8);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (a2 && (objc_msgSend(WeakRetained, "shouldSuppressEditMenu") & 1) == 0)
      objc_msgSend(v8[90], "activateSelection");
    aBlock = _Block_copy(*(const void **)(a1 + 16));
    v9 = *(WTF::StringImpl **)a3;
    if (*(_QWORD *)a3)
      *(_DWORD *)v9 += 2;
    v16 = v9;
    *(_OWORD *)v17 = *(_OWORD *)(a3 + 8);
    v10 = *(const void **)(a3 + 24);
    cf = v10;
    if (v10)
      CFRetain(v10);
    v19 = 0;
    objc_copyWeak(&v19, v6);
    v11 = WTF::fastMalloc((WTF *)0x40);
    v12 = v11;
    *(_QWORD *)v11 = off_1E3507BF8;
    *(_QWORD *)(v11 + 8) = aBlock;
    *(_BYTE *)(v11 + 16) = a2;
    if (v16)
      *(_DWORD *)v16 += 2;
    *(_QWORD *)(v11 + 24) = v16;
    *(_OWORD *)(v11 + 32) = *(_OWORD *)v17;
    *(_QWORD *)(v11 + 48) = cf;
    if (cf)
      CFRetain(cf);
    *(_QWORD *)(v12 + 56) = 0;
    objc_moveWeak((id *)(v12 + 56), &v19);
    v20 = v12;
    objc_msgSend(v8, "doAfterComputingImageAnalysisResultsForBackgroundRemoval:", &v20);
    v13 = v20;
    v20 = 0;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    objc_destroyWeak(&v19);
    if (cf)
      CFRelease(cf);
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v14);
      else
        *(_DWORD *)v16 -= 2;
    }
    _Block_release(0);
    CFRelease(v8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  }
}

- (uint64_t)insertTextPlaceholderWithSize:()WKInteraction completionHandler:
{
  id *v2;
  void *v3;

  *a1 = off_1E3507C20;
  v2 = (id *)(a1 + 1);
  _Block_release(a1[2]);
  objc_destroyWeak(v2);
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)insertTextPlaceholderWithSize:()WKInteraction completionHandler:
{
  id WeakRetained;
  void *v5;
  __int128 v6;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  WKTextPlaceholder *v16;
  CGRect v17;
  __int128 v18;
  _OWORD v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v5 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "webView") && *(_BYTE *)(a2 + 80))
  {
    v6 = *(_OWORD *)(a2 + 48);
    v19[2] = *(_OWORD *)(a2 + 32);
    v19[3] = v6;
    v19[4] = *(_OWORD *)(a2 + 64);
    v7 = *(_OWORD *)(a2 + 16);
    v19[0] = *(_OWORD *)a2;
    v19[1] = v7;
    WebCore::FloatRect::operator CGRect();
    objc_msgSend(v5, "convertRect:fromView:", objc_msgSend(v5, "webView"), v8, v9, v10, v11);
    v17.origin.x = v12;
    v17.origin.y = v13;
    v17.size.width = v14;
    v17.size.height = v15;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v18, &v17);
    v19[0] = v18;
    v16 = -[WKTextPlaceholder initWithElementContext:]([WKTextPlaceholder alloc], "initWithElementContext:", v19);
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    if (v16)
      CFRelease(v16);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    if (!v5)
      return;
  }
  CFRelease(v5);
}

- (_QWORD)_handleDropByInsertingImagePlaceholders:()WKInteraction session:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3507C48;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)_handleDropByInsertingImagePlaceholders:()WKInteraction session:
{
  WebCore::DestinationColorSpace *v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t result;
  void *v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  WebCore::NativeImage *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  int v34;
  uint64_t v35;
  _BYTE v36[80];
  _DWORD *v37;
  char v38;
  uint8_t v39[16];
  uint8_t buf[8];

  v5 = (WebCore::DestinationColorSpace *)std::__optional_move_base<WebCore::TextIndicatorData,false>::__optional_move_base[abi:sn180100](v36, a3);
  if (!v38 || (v6 = *(_QWORD *)(a1 + 8), !*(_QWORD *)(v6 + 3008)))
  {
    v24 = qword_1ECE71078;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71078, OS_LOG_TYPE_DEFAULT))
      return std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v36, v23);
    *(_WORD *)buf = 0;
    v25 = "Failed to animate image placeholders: missing text indicator data.";
LABEL_14:
    _os_log_impl(&dword_196BCC000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
    return std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v36, v23);
  }
  v7 = v37;
  if (!v37)
  {
    v24 = qword_1ECE71078;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71078, OS_LOG_TYPE_DEFAULT))
      return std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v36, v23);
    *(_WORD *)buf = 0;
    v25 = "Failed to animate image placeholders: missing unselected content image.";
    goto LABEL_14;
  }
  ++v37[2];
  v8 = WebCore::DestinationColorSpace::SRGB(v5);
  (*(void (**)(uint8_t *__return_ptr, _DWORD *, uint64_t))(*(_QWORD *)v7 + 288))(buf, v7, v8);
  if (!*(_QWORD *)buf)
  {
    v26 = qword_1ECE71078;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71078, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_196BCC000, v26, OS_LOG_TYPE_DEFAULT, "Failed to animate image placeholders: could not decode unselected content image.", v39, 2u);
LABEL_17:
    v27 = *(WebCore::NativeImage **)buf;
    *(_QWORD *)buf = 0;
    if (!v27)
      goto LABEL_34;
    v28 = *((_QWORD *)v27 + 1);
    if (__ldaxr((unsigned __int8 *)v28))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v28))
    {
      goto LABEL_22;
    }
    MEMORY[0x19AEABB3C](v28);
LABEL_22:
    v30 = *(_QWORD *)(v28 + 8);
    v31 = v30 - 1;
    *(_QWORD *)(v28 + 8) = v30 - 1;
    if (v30 == 1)
    {
      v35 = *(_QWORD *)(v28 + 16);
      v32 = *(_QWORD *)(v28 + 24);
      *(_QWORD *)(v28 + 24) = 0;
      v33 = v35 != 0;
    }
    else
    {
      v32 = 0;
      v33 = 1;
    }
    v34 = __ldxr((unsigned __int8 *)v28);
    if (v34 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v28))
      {
        if (!v31)
          goto LABEL_30;
        goto LABEL_34;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v28);
    if (!v31)
    {
LABEL_30:
      if (v32)
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
      if (!v33)
        WTF::fastFree((WTF *)v28, v23);
    }
LABEL_34:
    if (v7[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v7 + 8))(v7);
    else
      --v7[2];
    return std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v36, v23);
  }
  v9 = objc_alloc(MEMORY[0x1E0CEA638]);
  v10 = (_QWORD *)WebCore::NativeImage::platformImage(*(WebCore::NativeImage **)buf);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 440);
  v12 = 692;
  if (!*(_BYTE *)(v11 + 696))
    v12 = 688;
  v13 = (const void *)objc_msgSend(v9, "initWithCGImage:scale:orientation:", *v10, 0, *(float *)(v11 + v12));
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v13);
  if (v38)
  {
    v15 = (void *)result;
    WebCore::FloatRect::operator CGRect();
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(*(id *)(a1 + 8), "addSubview:", v15);
    v16 = *(_QWORD *)(a1 + 8);
    v17 = *(const void **)(v16 + 3568);
    *(_QWORD *)(v16 + 3568) = v15;
    if (v17)
      CFRelease(v17);
    v18 = *(void **)(a1 + 8);
    objc_msgSend(v18, "unobscuredContentRect");
    WebKit::DragDropInteractionState::deliverDelayedDropPreview(v6 + 3104, (uint64_t)v18, *(void **)(a1 + 16), a2, v19, v20, v21, v22);
    if (v13)
      CFRelease(v13);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

- (uint64_t)requestDocumentContext:()WKInteraction completionHandler:
{
  char v4;

  v4 = *(_BYTE *)(a1 + 24);
  if (*(_BYTE *)(a1 + 8))
    WebKit::DocumentEditingContext::toPlatformContext(a2, v4);
  else
    WebKit::DocumentEditingContext::toLegacyPlatformContext(a2, v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
}

- (IPC::Encoder)appHighlightMenu
{
  return WebKit::WebPageProxy::createAppHighlightInSelectedRange(*(IPC::Encoder **)(a2 + 440), *(_BYTE *)(a1 + 8) == 0, 0);
}

- (uint64_t)scrollToTextFragmentGenerationMenu
{
  uint64_t v2;
  char v4;

  v2 = *(_QWORD *)(a2 + 440);
  v4 = 0;
  return WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CopyLinkToHighlight>(*(_QWORD *)(v2 + 208), (uint64_t)&v4, *(_QWORD *)(*(_QWORD *)(v2 + 32) + 1896), 0);
}

- (_QWORD)performTextSearchWithQueryString:()WKInteraction usingOptions:resultAggregator:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3507CE8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)performTextSearchWithQueryString:()WKInteraction usingOptions:resultAggregator:
{
  __int128 *v3;
  uint64_t v4;
  unsigned int v5;
  __int128 *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WKFoundTextRange *v9;
  WTF::StringImpl *v10;
  void *v11;
  __int128 *v13;
  unint64_t v14;
  __int128 v15;
  WTF::StringImpl *v16;
  uint64_t v17;

  v3 = (__int128 *)*a2;
  v13 = (__int128 *)*a2;
  v5 = *((_DWORD *)a2 + 2);
  v4 = *((unsigned int *)a2 + 3);
  *a2 = 0;
  a2[1] = 0;
  v14 = __PAIR64__(v4, v5);
  if ((_DWORD)v4)
  {
    v6 = &v3[2 * v4];
    do
    {
      v15 = *v3;
      v7 = (WTF::StringImpl *)*((_QWORD *)v3 + 2);
      if (v7)
        *(_DWORD *)v7 += 2;
      v16 = v7;
      v17 = *((_QWORD *)v3 + 3);
      v9 = +[WKFoundTextRange foundTextRangeWithWebFoundTextRange:](WKFoundTextRange, "foundTextRangeWithWebFoundTextRange:", &v15, v13, v14);
      v10 = v16;
      v16 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v8);
        else
          *(_DWORD *)v10 -= 2;
      }
      objc_msgSend(*(id *)(a1 + 16), "foundRange:forSearchString:inDocument:", v9, *(_QWORD *)(a1 + 8), 0);
      v3 += 2;
    }
    while (v3 != v6);
  }
  objc_msgSend(*(id *)(a1 + 16), "finishedSearching", v13, v14, v15, v16);
  return WTF::Vector<WebKit::WebFoundTextRange,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v11);
}

- (uint64_t)requestRectForFoundTextRange:()WKInteraction completionHandler:
{
  uint64_t v2;

  WebCore::FloatRect::operator CGRect();
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), v2);
}

- (uint64_t)_completeImageAnalysisRequestForContextMenu:()WKInteraction requestIdentifier:hasTextResults:
{
  WTF *v3;
  unsigned int *v4;

  *(_QWORD *)a1 = off_1E3507D60;
  v3 = *(WTF **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v3)
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v3, a2);
  v4 = *(unsigned int **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v4)
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v4);
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  WTF *v3;
  unsigned int *v4;
  void *v5;

  *(_QWORD *)a1 = off_1E3507D60;
  v3 = *(WTF **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v3)
    WTF::ThreadSafeRefCounted<WTF::Box<WebKit::ImageAnalysisContextMenuActionData>::Data,(WTF::DestructionThread)0>::deref(v3, a2);
  v4 = *(unsigned int **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v4)
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)2>,(WTF::DestructionThread)2>::deref(v4);
  objc_destroyWeak((id *)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v5);
}

- (void)_completeImageAnalysisRequestForContextMenu:()WKInteraction requestIdentifier:hasTextResults:
{
  id WeakRetained;
  const void *v5;
  uint64_t v6;
  const void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = *(_QWORD *)(a1 + 24);
    if (a2)
      CFRetain(a2);
    v7 = *(const void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = a2;
    if (v7)
      CFRelease(v7);
    CFRelease(v5);
  }
}

- (uint64_t)replaceText:()WKInteraction withText:options:completionHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E3507D88;
  _Block_release(*(const void **)(a1 + 16));
  v2 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

{
  void *v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E3507D88;
  _Block_release(*(const void **)(a1 + 16));
  v3 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)replaceText:()WKInteraction withText:options:completionHandler:
{
  double *v3;
  double *v4;
  WKUITextSelectionRect *v5;
  WKUITextSelectionRect *v6;
  uint64_t v7;
  _QWORD v8[3];
  CGRect v9;
  CGRect v10;

  v8[2] = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = *(double **)(a1 + 8);
    v4 = v3 + 181;
    v5 = +[WKUITextSelectionRect selectionRectWithCGRect:](WKUITextSelectionRect, "selectionRectWithCGRect:", v3[182], v3[183], v3[184], v3[185]);
    v6 = v5;
    if (v5)
      CFRetain(v5);
    v9 = *(CGRect *)(v4 + 1);
    v10 = *(CGRect *)(v4 + 5);
    v8[0] = v6;
    if (CGRectEqualToRect(v9, v10))
    {
      v7 = 1;
    }
    else
    {
      v8[1] = +[WKUITextSelectionRect selectionRectWithCGRect:](WKUITextSelectionRect, "selectionRectWithCGRect:", v4[5], v4[6], v4[7], v4[8]);
      v7 = 2;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    if (v6)
      CFRelease(v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 16) + 16))(*(_QWORD *)(a1 + 16), MEMORY[0x1E0C9AA60]);
  }
}

- (uint64_t)requestTextRectsForString:()WKInteraction withCompletionHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E3507DB0;
  _Block_release(*(const void **)(a1 + 16));
  v2 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

{
  void *v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E3507DB0;
  _Block_release(*(const void **)(a1 + 16));
  v3 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)requestTextRectsForString:()WKInteraction withCompletionHandler:
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WKUITextSelectionRect *v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a2 + 3));
  v5 = *((unsigned int *)a2 + 3);
  if ((_DWORD)v5)
  {
    v6 = *a2;
    v7 = 16 * v5;
    do
    {
      WebCore::FloatRect::operator CGRect();
      v8 = +[WKUITextSelectionRect selectionRectWithCGRect:](WKUITextSelectionRect, "selectionRectWithCGRect:");
      if (v8)
        objc_msgSend(v4, "addObject:", v8);
      v6 += 16;
      v7 -= 16;
    }
    while (v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  if (v4)
    CFRelease(v4);
}

- (uint64_t)requestTextContextForAutocorrectionWithCompletionHandler:()WKInteraction
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  WTF *v8;
  WTF *v9;
  WTF::StringImpl *v11[5];
  WTF::StringImpl *v12[5];
  WTF::StringImpl *v13[5];
  WTF::StringImpl *v14[5];
  _BYTE v15[40];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v11);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v12);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v13);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v14);
  WebCore::AttributedString::AttributedString((WebCore::AttributedString *)v15);
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  if (a2)
  {
    v4 = (_QWORD *)(*(_QWORD *)(a1 + 16) + 1400);
    WTF::String::operator=(v11, (WTF::StringImpl *)v4);
    WTF::String::operator=(v14, (WTF::StringImpl *)(v4 + 1));
    WTF::String::operator=(v12, (WTF::StringImpl *)(v4 + 2));
    WTF::String::operator=(v13, (WTF::StringImpl *)(v4 + 3));
    v5 = v4[4];
    if (v5 == -1)
    {
      v6 = 0;
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v6 = v4[5];
    }
    *(_QWORD *)&v16 = v5;
    *((_QWORD *)&v16 + 1) = v6;
  }
  WebKit::DocumentEditingContext::toPlatformContext((uint64_t)v11, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  v8 = (WTF *)v18;
  if ((_QWORD)v18)
  {
    *(_QWORD *)&v18 = 0;
    DWORD2(v18) = 0;
    WTF::fastFree(v8, v7);
  }
  v9 = (WTF *)v17;
  if ((_QWORD)v17)
  {
    *(_QWORD *)&v17 = 0;
    DWORD2(v17) = 0;
    WTF::fastFree(v9, v7);
  }
  MEMORY[0x19AEAEECC](v15);
  MEMORY[0x19AEAEECC](v14);
  MEMORY[0x19AEAEECC](v13);
  MEMORY[0x19AEAEECC](v12);
  return MEMORY[0x19AEAEECC](v11);
}

- (uint64_t)_internalAdjustSelectionWithOffset:()WKInteraction lengthDelta:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)targetedPreviewForID:()WKInteraction completionHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E3507E28;
  _Block_release(*(const void **)(a1 + 16));
  v2 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

{
  void *v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E3507E28;
  _Block_release(*(const void **)(a1 + 16));
  v3 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)targetedPreviewForID:()WKInteraction completionHandler:
{
  WebCore::DestinationColorSpace *v3;
  _DWORD *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  void *result;
  const void *v13;
  void *v14;
  WebCore::NativeImage *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;
  uint64_t v26;
  _DWORD *v27;
  char v28;
  const void *v29;
  WebCore::NativeImage *v30;

  v3 = (WebCore::DestinationColorSpace *)std::__optional_move_base<WebCore::TextIndicatorData,false>::__optional_move_base[abi:sn180100](v24, a2);
  if (!v28 || (v4 = v27) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    return (void *)std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v24, v14);
  }
  ++v27[2];
  v5 = WebCore::DestinationColorSpace::SRGB(v3);
  (*(void (**)(WebCore::NativeImage **__return_ptr, _DWORD *, uint64_t))(*(_QWORD *)v4 + 288))(&v30, v4, v5);
  if (!v30)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    goto LABEL_13;
  }
  v6 = objc_alloc(MEMORY[0x1E0CEA638]);
  v7 = (_QWORD *)WebCore::NativeImage::platformImage(v30);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 440);
  v9 = 692;
  if (!*(_BYTE *)(v8 + 696))
    v9 = 688;
  v10 = (const void *)objc_msgSend(v6, "initWithCGImage:scale:orientation:", *v7, 0, *(float *)(v8 + v9));
  v11 = *(void **)(a1 + 8);
  result = (void *)objc_msgSend(v11, "containerForContextMenuHintPreviews");
  if (v28)
  {
    createTargetedPreview(&v29, (uint64_t)v10, v11, result, (uint64_t)&v25, (uint64_t)&v26, 0);
    v13 = v29;
    (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
    if (v13)
      CFRelease(v13);
    if (v10)
      CFRelease(v10);
LABEL_13:
    v15 = v30;
    v30 = 0;
    if (!v15)
      goto LABEL_30;
    v16 = *((_QWORD *)v15 + 1);
    if (__ldaxr((unsigned __int8 *)v16))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v16))
    {
      goto LABEL_18;
    }
    MEMORY[0x19AEABB3C](v16);
LABEL_18:
    v18 = *(_QWORD *)(v16 + 8);
    v19 = v18 - 1;
    *(_QWORD *)(v16 + 8) = v18 - 1;
    if (v18 == 1)
    {
      v23 = *(_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      *(_QWORD *)(v16 + 24) = 0;
      v21 = v23 != 0;
    }
    else
    {
      v20 = 0;
      v21 = 1;
    }
    v22 = __ldxr((unsigned __int8 *)v16);
    if (v22 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v16))
      {
        if (!v19)
          goto LABEL_26;
        goto LABEL_30;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v16);
    if (!v19)
    {
LABEL_26:
      if (v20)
        (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
      if (!v21)
        WTF::fastFree((WTF *)v16, v14);
    }
LABEL_30:
    if (v4[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 8))(v4);
    else
      --v4[2];
    return (void *)std::__optional_destruct_base<WebCore::TextIndicatorData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v24, v14);
  }
  __break(1u);
  return result;
}

- (uint64_t)updateUnderlyingTextVisibilityForTextAnimationID:()WKInteraction visible:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
