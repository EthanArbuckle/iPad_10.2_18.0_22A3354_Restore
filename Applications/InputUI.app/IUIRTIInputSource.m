@implementation IUIRTIInputSource

- (IUIRTIInputSource)init
{
  IUIRTIInputSource *v2;
  IUIRTIInputSystemSourceSession *v3;
  RTIInputSystemSourceSession *sourceSession;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *layerTransformQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IUIRTIInputSource;
  v2 = -[IUIRTIInputSource init](&v12, "init");
  if (v2)
  {
    v3 = objc_alloc_init(IUIRTIInputSystemSourceSession);
    sourceSession = v2->_sourceSession;
    v2->_sourceSession = (RTIInputSystemSourceSession *)v3;

    -[RTIInputSystemSourceSession setPayloadDelegate:](v2->_sourceSession, "setPayloadDelegate:", v2);
    -[IUIRTIInputSource _setSafeAreaInsetsFrozen:](v2, "_setSafeAreaInsetsFrozen:", 1);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v9 = dispatch_queue_create("com.apple.inputservice.layerTransform", v8);
    layerTransformQueue = v2->_layerTransformQueue;
    v2->_layerTransformQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)matchInputDestinationFrame
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  id v14;
  NSString *v15;
  void *v16;
  NSObject *v17;
  NSObject *layerTransformQueue;
  unsigned int v19;
  void *v20;
  uint64_t RenderId;
  NSObject *v22;
  _QWORD v23[6];
  id v24;
  id location;
  _QWORD v26[6];
  unsigned int v27;
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD block[6];
  unsigned int v38;
  _BYTE buf[32];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource window](self, "window"));
  if (!v4)
  {
    v14 = sub_10000C050();
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: nil window", buf, 0xCu);

    }
    goto LABEL_12;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
  v6 = objc_msgSend(v5, "contextID");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
  v8 = objc_msgSend(v7, "layerID");

  if (v6)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = sub_10000C050();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: destinationContextID = %u, destinationLayerID = %llu", buf, 0x1Cu);

    }
LABEL_12:

    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0xA010000000;
  *(_QWORD *)&buf[24] = &unk_100017C61;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = dispatch_group_create();
  layerTransformQueue = self->_layerTransformQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C090;
  block[3] = &unk_10001C750;
  v38 = v6;
  block[4] = buf;
  block[5] = v8;
  dispatch_group_async(v17, layerTransformQueue, block);
  v19 = objc_msgSend(v4, "_contextId");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  RenderId = CALayerGetRenderId();

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0xA010000000;
  v28[3] = &unk_100017C61;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = self->_layerTransformQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000C0EC;
  v26[3] = &unk_10001C750;
  v27 = v19;
  v26[4] = v28;
  v26[5] = RenderId;
  dispatch_group_async(v17, v22, v26);
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000C148;
  v23[3] = &unk_10001C778;
  objc_copyWeak(&v24, &location);
  v23[4] = buf;
  v23[5] = v28;
  dispatch_group_notify(v17, (dispatch_queue_t)&_dispatch_main_q, v23);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(buf, 8);
LABEL_13:

}

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IUIRTIInputSource;
  -[IUIRTIInputSource setContinuousSpellCheckingEnabled:](&v3, "setContinuousSpellCheckingEnabled:", 0);
}

- (CGRect)firstRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[IUIRTIInputSource _rectForLineIntersectingRange:firstLine:](self, "_rectForLineIntersectingRange:firstLine:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_lastRectForRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[IUIRTIInputSource _rectForLineIntersectingRange:firstLine:](self, "_rectForLineIntersectingRange:firstLine:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_rectForLineIntersectingRange:(id)a3 firstLine:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CGSize size;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  double v17;
  double x;
  double v19;
  double y;
  double v21;
  double width;
  double v23;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  _QWORD v29[7];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  _QWORD v36[3];
  char v37;
  uint64_t v38;
  CGRect *v39;
  uint64_t v40;
  void *v41;
  CGPoint origin;
  CGSize v43;
  CGRect result;

  v4 = a4;
  v6 = a3;
  v38 = 0;
  v39 = (CGRect *)&v38;
  v40 = 0x4010000000;
  v41 = &unk_100017C61;
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v43 = size;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTIDocumentState documentState](self->_documentState, "documentState"));

  if (v6)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RTIDocumentState documentState](self->_documentState, "documentState"));
      v10 = (char *)+[IUIRangeTransform rangeInDocumentState:fromTextRange:inUITextInput:](IUIRangeTransform, "rangeInDocumentState:fromTextRange:inUITextInput:", v9, v6, self);
      v12 = v11;

      if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x2020000000;
        v37 = 0;
        v30 = 0;
        v31 = &v30;
        v32 = 0x3010000000;
        v33 = &unk_100017C61;
        v34 = v10;
        v35 = 0;
        if (v4)
          v13 = 0;
        else
          v13 = 2;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000C520;
        v29[3] = &unk_10001C7A0;
        v29[4] = &v38;
        v29[5] = v36;
        v29[6] = &v30;
        v14 = objc_retainBlock(v29);
        -[RTIDocumentState enumerateRectsWithOptions:range:granularity:block:](self->_documentState, "enumerateRectsWithOptions:range:granularity:block:", v13, v10, v12, 1, v14);
        v15 = (char *)v31[4];
        v16 = v31[5];
        if ((v15 != v10 || v16 != v12) && &v10[v12] > &v15[v16])
          -[RTIDocumentState enumerateRectsWithOptions:range:granularity:block:](self->_documentState, "enumerateRectsWithOptions:range:granularity:block:", v13);

        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(v36, 8);
      }
    }
  }
  if (CGRectIsNull(v39[1]))
  {
    -[RTIDocumentState firstSelectionRectInWindow](self->_documentState, "firstSelectionRectInWindow");
    x = v17;
    y = v19;
    width = v21;
    height = v23;
  }
  else
  {
    x = v39[1].origin.x;
    y = v39[1].origin.y;
    width = v39[1].size.width;
    height = v39[1].size.height;
  }
  _Block_object_dispose(&v38, 8);

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[RTIDocumentState caretRectInWindow](self->_documentState, "caretRectInWindow", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  RTIDocumentState *documentState;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = objc_alloc_init((Class)NSMutableArray);
  documentState = self->_documentState;
  v6 = -[RTIDocumentState selectedTextRange](documentState, "selectedTextRange");
  v8 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C7D4;
  v11[3] = &unk_10001C7C8;
  v9 = v4;
  v12 = v9;
  -[RTIDocumentState enumerateRectsWithOptions:range:granularity:block:](documentState, "enumerateRectsWithOptions:range:granularity:block:", 2, v6, v8, -1, v11);

  return v9;
}

- (id)_rtiSourceSession
{
  return self->_sourceSession;
}

- (RTIInputSystemSessionDelegate)sourceSessionDelegate
{
  return (RTIInputSystemSessionDelegate *)-[RTIInputSystemSourceSession sessionDelegate](self->_sourceSession, "sessionDelegate");
}

- (id)inputView
{
  id v3;
  NSObject *v4;
  RTIInputSystemSourceSession *sourceSession;
  RTIInputViewInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  RTIInputViewInfo *inputViewInfo;
  unsigned int v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  IUIRTIInputView *v17;
  double y;
  double v19;
  double v20;
  IUIRTIInputView *v21;
  IUIRTIInputView *remoteInputView;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  _UILayerHostView *v33;
  _UILayerHostView *remoteInputViewLayerHost;
  RTIInputViewInfo *v35;
  RTIInputViewInfo *v36;
  IUIRTIInputView *v37;
  _UILayerHostView *v38;
  IUIRTIInputView *v39;
  _UILayerHostView *v40;
  int v42;
  RTIInputSystemSourceSession *v43;
  __int16 v44;
  RTIInputViewInfo *v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  CGSize v52;

  v3 = sub_10000C050();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sourceSession = self->_sourceSession;
    v6 = (RTIInputViewInfo *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](sourceSession, "documentTraits"));
    v42 = 138412546;
    v43 = sourceSession;
    v44 = 2112;
    v45 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "inputView, sourceSession: %@, traits: %@", (uint8_t *)&v42, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inputViewInfo"));

    v10 = sub_10000C050();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      inputViewInfo = self->_inputViewInfo;
      v13 = objc_msgSend(v9, "contextId");
      objc_msgSend(v9, "size");
      v14 = NSStringFromCGSize(v52);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v9, "insets");
      v42 = 138413314;
      v43 = (RTIInputSystemSourceSession *)v9;
      v44 = 2048;
      v45 = inputViewInfo;
      v46 = 1024;
      v47 = v13;
      v48 = 2112;
      v49 = v15;
      v50 = 2048;
      v51 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "inputView, inputViewInfo: %@ (_inputViewInfo %p), contextId: %u size: %@ insets: %f", (uint8_t *)&v42, 0x30u);

    }
    if (objc_msgSend(v9, "contextId"))
    {
      if ((objc_msgSend(v9, "isEqual:", self->_inputViewInfo) & 1) != 0)
      {
LABEL_14:

        return self->_remoteInputView;
      }
      v17 = [IUIRTIInputView alloc];
      y = CGPointZero.y;
      objc_msgSend(v9, "size");
      v21 = -[IUIRTIInputView initWithFrame:](v17, "initWithFrame:", CGPointZero.x, y, v19, v20);
      remoteInputView = self->_remoteInputView;
      self->_remoteInputView = v21;

      if ((objc_opt_respondsToSelector(v9, "shouldShowDockView") & 1) != 0)
        -[IUIRTIInputView setShouldShowDockView:](self->_remoteInputView, "setShouldShowDockView:", objc_msgSend(v9, "shouldShowDockView"));
      v23 = objc_alloc((Class)_UILayerHostView);
      objc_msgSend(v9, "insets");
      v25 = -v24;
      objc_msgSend(v9, "size");
      v27 = v26;
      objc_msgSend(v9, "size");
      v29 = v28;
      objc_msgSend(v9, "insets");
      v31 = v29 + v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
      v33 = (_UILayerHostView *)objc_msgSend(v23, "initWithFrame:pid:contextID:", objc_msgSend(v32, "processId"), objc_msgSend(v9, "contextId"), 0.0, v25, v27, v31);
      remoteInputViewLayerHost = self->_remoteInputViewLayerHost;
      self->_remoteInputViewLayerHost = v33;

      -[IUIRTIInputView addSubview:](self->_remoteInputView, "addSubview:", self->_remoteInputViewLayerHost);
      v35 = (RTIInputViewInfo *)objc_msgSend(v9, "copy");
      v36 = self->_inputViewInfo;
      self->_inputViewInfo = v35;
    }
    else
    {
      v39 = self->_remoteInputView;
      self->_remoteInputView = 0;

      v40 = self->_remoteInputViewLayerHost;
      self->_remoteInputViewLayerHost = 0;

      v36 = self->_inputViewInfo;
      self->_inputViewInfo = 0;
    }

    goto LABEL_14;
  }
  v37 = self->_remoteInputView;
  self->_remoteInputView = 0;

  v38 = self->_remoteInputViewLayerHost;
  self->_remoteInputViewLayerHost = 0;

  return self->_remoteInputView;
}

- (id)textInputContextIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputContextIdentifier"));

  return v3;
}

- (id)textInputMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textInputModeData"));

  if (!v4
    || (v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(UITextInputMode, v5), v4, 0), (v7 = (void *)objc_claimAutoreleasedReturnValue(v6)) == 0))
  {
    v10.receiver = self;
    v10.super_class = (Class)IUIRTIInputSource;
    v8 = -[IUIRTIInputSource textInputMode](&v10, "textInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (id)_additionalTextInputLocales
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession documentTraits](self->_sourceSession, "documentTraits"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "additionalLocaleIdentifiers"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10)));
          if (v11)
            objc_msgSend(v5, "addObject:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)IUIRTIInputSource;
    v12 = -[IUIRTIInputSource _additionalTextInputLocales](&v14, "_additionalTextInputLocales");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  return v5;
}

- (void)ingestDataPayload:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  RTIDocumentState *v8;
  RTIDocumentState *documentState;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = objc_opt_class(RTIInputSystemDataPayload, v4);
  if ((objc_opt_isKindOfClass(v12, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "documentTraits"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textInputTraits"));

    v8 = (RTIDocumentState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "documentState"));
    documentState = self->_documentState;
    self->_documentState = v8;

    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UITextInputTraits defaultTextInputTraits](UITextInputTraits, "defaultTextInputTraits"));
      objc_msgSend(v10, "overlayWithTITextInputTraits:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource performSelector:](self, "performSelector:", "_textInputTraits"));
      objc_msgSend(v11, "takeTraitsFrom:", v10);

    }
  }
  -[RTIInputSystemSourceSession handleTextActionPayload:](self->_sourceSession, "handleTextActionPayload:", v12);
  -[IUIRTIInputSource matchInputDestinationFrame](self, "matchInputDestinationFrame");

}

- (void)ingestDocumentTraits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[UITextInputTraits defaultTextInputTraits](UITextInputTraits, "defaultTextInputTraits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputTraits"));
  objc_msgSend(v9, "overlayWithTITextInputTraits:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource performSelector:](self, "performSelector:", "_textInputTraits"));
  objc_msgSend(v6, "takeTraitsFrom:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RTIInputSystemDataPayload payloadWithData:](RTIInputSystemDataPayload, "payloadWithData:", 0));
  objc_msgSend(v7, "setDocumentTraits:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession uuid](self->_sourceSession, "uuid"));
  objc_msgSend(v7, "setSessionUUID:", v8);

  -[RTIInputSystemSourceSession handleTextActionPayload:](self->_sourceSession, "handleTextActionPayload:", v7);
  -[IUIRTIInputSource matchInputDestinationFrame](self, "matchInputDestinationFrame");

}

- (void)ingestDocumentState:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_documentState, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[RTIInputSystemDataPayload payloadWithData:](RTIInputSystemDataPayload, "payloadWithData:", 0));
  objc_msgSend(v7, "setDocumentState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTIInputSystemSourceSession uuid](self->_sourceSession, "uuid"));
  objc_msgSend(v7, "setSessionUUID:", v6);

  -[RTIInputSystemSourceSession handleTextActionPayload:](self->_sourceSession, "handleTextActionPayload:", v7);
}

- (void)handleTextActionPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource dataTransportDelegate](self, "dataTransportDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource sourceSession](self, "sourceSession"));
  objc_msgSend(v6, "inputSource:didGenerateTextActionPayload:", v5, v4);

}

- (BOOL)conformsToProtocol:(id)a3
{
  __objc2_prot *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v4 = (__objc2_prot *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource sourceSession](self, "sourceSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentTraits"));

  v7 = (unint64_t)objc_msgSend(v6, "delegateConformanceType");
  if (&OBJC_PROTOCOL___UITextInput == v4)
  {
    self = (IUIRTIInputSource *)((v7 >> 1) & 1);
  }
  else if (&OBJC_PROTOCOL___UITextInputPrivate == v4)
  {
    self = (IUIRTIInputSource *)((v7 >> 2) & 1);
  }
  else if (&OBJC_PROTOCOL___UIKeyInput == v4)
  {
    LOBYTE(self) = v7 & 1;
  }
  else if (&OBJC_PROTOCOL___UIKeyInputPrivate == v4)
  {
    self = (IUIRTIInputSource *)((v7 >> 4) & 1);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IUIRTIInputSource;
    LOBYTE(self) = -[IUIRTIInputSource conformsToProtocol:](&v9, "conformsToProtocol:", v4);
  }

  return (char)self;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v9;
  objc_super v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource sourceSession](self, "sourceSession"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentTraits"));

  v7 = objc_msgSend(v6, "delegateConformanceType");
  if (!sel_isEqual(a3, "handleKeyWebEvent:withCompletionHandler:") || (v7 & 0x20) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)IUIRTIInputSource;
    v9 = -[IUIRTIInputSource respondsToSelector:](&v11, "respondsToSelector:", a3);
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSource sourceSession](self, "sourceSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "documentTraits"));

  if ((objc_opt_respondsToSelector(v4, "disableAutomaticKeyboardUI") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "disableAutomaticKeyboardUI");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IUIRTIInputSource;
    v5 = -[IUIRTIInputSource _disableAutomaticKeyboardUI](&v8, "_disableAutomaticKeyboardUI");
  }
  v6 = v5;

  return v6;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IUIRTIInputSource;
  -[IUIRTIInputSource didMoveToWindow](&v3, "didMoveToWindow");
  -[IUIRTIInputSource matchInputDestinationFrame](self, "matchInputDestinationFrame");
}

- (BOOL)canBecomeFirstResponder
{
  return self->canBecomeFirstResponder;
}

- (void)setCanBecomeFirstResponder:(BOOL)a3
{
  self->canBecomeFirstResponder = a3;
}

- (IUIRTIInputSourceDelegate)dataTransportDelegate
{
  return (IUIRTIInputSourceDelegate *)objc_loadWeakRetained((id *)&self->_dataTransportDelegate);
}

- (void)setDataTransportDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataTransportDelegate, a3);
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (RTIInputSystemSourceSession)sourceSession
{
  return self->_sourceSession;
}

- (void)setSourceSession:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSession, a3);
}

- (IUIRTIInputView)remoteInputView
{
  return self->_remoteInputView;
}

- (void)setRemoteInputView:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInputView, a3);
}

- (_UILayerHostView)remoteInputViewLayerHost
{
  return self->_remoteInputViewLayerHost;
}

- (void)setRemoteInputViewLayerHost:(id)a3
{
  objc_storeStrong((id *)&self->_remoteInputViewLayerHost, a3);
}

- (RTIInputViewInfo)inputViewInfo
{
  return self->_inputViewInfo;
}

- (void)setInputViewInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputViewInfo, 0);
  objc_storeStrong((id *)&self->_remoteInputViewLayerHost, 0);
  objc_storeStrong((id *)&self->_remoteInputView, 0);
  objc_storeStrong((id *)&self->_sourceSession, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataTransportDelegate);
  objc_storeStrong((id *)&self->_layerTransformQueue, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
}

@end
