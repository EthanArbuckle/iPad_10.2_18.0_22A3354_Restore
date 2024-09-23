@implementation PKPeerPaymentMessagesContentRenderBubbleViewController

- (void)loadView
{
  PKPeerPaymentBubbleView *bubbleView;
  PKPeerPaymentBubbleView *v4;
  PKPeerPaymentBubbleView *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  PKPeerPaymentBubbleView *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id location;

  bubbleView = self->_bubbleView;
  if (!bubbleView)
  {
    v4 = (PKPeerPaymentBubbleView *)objc_alloc_init((Class)PKPeerPaymentBubbleView);
    v5 = self->_bubbleView;
    self->_bubbleView = v4;

    -[PKPeerPaymentBubbleView setDisplaysApplePayLogo:](self->_bubbleView, "setDisplaysApplePayLogo:", 1);
    -[PKPeerPaymentBubbleView setLiveRenderingEnabled:](self->_bubbleView, "setLiveRenderingEnabled:", 1);
    v6 = objc_msgSend(objc_alloc((Class)UIPanGestureRecognizer), "initWithTarget:action:", self, "_bubbleViewPanned");
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v6);
    v7 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_bubbleViewDoubleTapped");
    objc_msgSend(v7, "setNumberOfTapsRequired:", 2);
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v7);
    v8 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "_bubbleViewLongPressed");
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v8);
    v9 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_bubbleViewSelected");
    objc_msgSend(v9, "setNumberOfTapsRequired:", 1);
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v6);
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v7);
    objc_msgSend(v9, "requireGestureRecognizerToFail:", v8);
    -[PKPeerPaymentBubbleView addGestureRecognizer:](self->_bubbleView, "addGestureRecognizer:", v9);
    objc_initWeak(&location, self);
    v10 = self->_bubbleView;
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100004328;
    v14 = &unk_100020938;
    objc_copyWeak(&v15, &location);
    -[PKPeerPaymentBubbleView setActionHandler:](v10, "setActionHandler:", &v11);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    bubbleView = self->_bubbleView;
  }
  -[PKPeerPaymentMessagesContentRenderBubbleViewController setView:](self, "setView:", bubbleView, v11, v12, v13, v14);
}

- (void)reloadContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKPeerPaymentMessage *currentMessage;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t Object;
  NSObject *v12;
  int v13;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v14;
  __int16 v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerPaymentMessage"));

  currentMessage = self->_currentMessage;
  if (!currentMessage
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessage identifier](currentMessage, "identifier")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier")),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentMessage, v6);
    Object = PKLogFacilityTypeGetObject(11);
    v12 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: rendering message : %@", (uint8_t *)&v13, 0x16u);
    }

    -[PKPeerPaymentBubbleView updateWithPeerPaymentMessage:animated:](self->_bubbleView, "updateWithPeerPaymentMessage:animated:", v6, 0);
    if (objc_msgSend(v6, "type") == (id)2
      && !-[PKPeerPaymentMessagesContentRenderBubbleViewController _isMessageFromMe:](self, "_isMessageFromMe:", v6))
    {
      -[PKPeerPaymentBubbleView setAction:animated:](self->_bubbleView, "setAction:animated:", 1, 0);
    }
    -[PKPeerPaymentBubbleView sizeToFit](self->_bubbleView, "sizeToFit");
  }
  -[PKPeerPaymentMessagesContentRenderBubbleViewController _fetchStatus](self, "_fetchStatus");

}

- (BOOL)_isMessageFromMe:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "underlyingMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderParticipantIdentifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeConversation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localParticipantIdentifier"));

  v9 = 0;
  if (v5 && v8)
    v9 = objc_msgSend(v5, "isEqual:", v8);

  return v9;
}

- (BOOL)_isMessage:(id)a3 validForTransaction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;
  uint64_t Object;
  NSObject *v14;
  int v16;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerPaymentMessageReceivedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "underlyingMessage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "time"));

  if (-[PKPeerPaymentMessagesContentRenderBubbleViewController _isMessageFromMe:](self, "_isMessageFromMe:", v6))
  {
    v11 = 1;
  }
  else
  {
    v11 = 1;
    if (objc_msgSend(v6, "hasBeenSent"))
    {
      if (v8)
      {
        if (v10)
        {
          objc_msgSend(v8, "timeIntervalSinceDate:", v10);
          if (fabs(v12) >= 1.0)
          {
            Object = PKLogFacilityTypeGetObject(11);
            v14 = objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v16 = 134219010;
              v17 = self;
              v18 = 2112;
              v19 = v6;
              v20 = 2112;
              v21 = v7;
              v22 = 2114;
              v23 = v10;
              v24 = 2114;
              v25 = v8;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Message: %@ is not valid for Transaction: %@. (%{public}@ != %{public}@)", (uint8_t *)&v16, 0x34u);
            }

            v11 = 0;
          }
        }
      }
    }
  }

  return v11;
}

- (id)bubbleView
{
  return self->_bubbleView;
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PKPeerPaymentMessagesContentRenderBubbleViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (!self->_currentMessage)
    -[PKPeerPaymentMessagesContentRenderBubbleViewController reloadContent](self, "reloadContent");
  v6 = CGSizeZero.height;
  v7 = self->_pendingBubbleViewSize.width;
  v8 = self->_pendingBubbleViewSize.height;
  if (CGSizeZero.width == v7 && v6 == v8)
    -[PKPeerPaymentBubbleView sizeThatFits:](self->_bubbleView, "sizeThatFits:", width, height, CGSizeZero.width, v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)generatedSnapshot
{
  return -[PKPeerPaymentBubbleView generatedSnapshot](self->_bubbleView, "generatedSnapshot");
}

- (void)_fetchStatus
{
  PKPeerPaymentMessage *v3;
  uint64_t v4;
  PKPeerPaymentBubbleView *bubbleView;
  id *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  PKPeerPaymentBubbleView *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  PKPeerPaymentMessage *v16;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  v3 = self->_currentMessage;
  if (PKUseMockSURFServer(v3, v4))
  {
    if (-[PKPeerPaymentMessage type](v3, "type") == (id)1)
    {
      -[PKPeerPaymentBubbleView setAction:animated:](self->_bubbleView, "setAction:animated:", 0, 0);
      -[PKPeerPaymentBubbleView setState:animated:](self->_bubbleView, "setState:animated:", 5, 0);
    }
    -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToReferenceSizeAnimated](self, "_resizeBubbleViewToReferenceSizeAnimated");
    bubbleView = self->_bubbleView;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100004DFC;
    v19[3] = &unk_1000207D0;
    objc_copyWeak(&v20, &location);
    -[PKPeerPaymentBubbleView performPostRender:](bubbleView, "performPostRender:", v19);
    v6 = &v20;
  }
  else
  {
    if (!v3 || -[PKPeerPaymentMessage type](v3, "type") != (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
      objc_msgSend(v10, "noteReadyForDisplay");

      goto LABEL_11;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
    v8 = objc_msgSend(v7, "peerPaymentRequiresEnablement");

    if (v8)
    {
      -[PKPeerPaymentBubbleView setState:animated:](self->_bubbleView, "setState:animated:", 10, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
      objc_msgSend(v9, "noteReadyForDisplay");

      -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToReferenceSizeAnimated](self, "_resizeBubbleViewToReferenceSizeAnimated");
      goto LABEL_11;
    }
    if (-[PKPeerPaymentMessagesContentRenderBubbleViewController _isMessageFromMe:](self, "_isMessageFromMe:", v3)
      && !-[PKPeerPaymentMessage hasBeenSent](v3, "hasBeenSent"))
    {
      v12 = self->_bubbleView;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000055C4;
      v13[3] = &unk_100020A00;
      objc_copyWeak(&v14, &location);
      v13[4] = self;
      -[PKPeerPaymentBubbleView performPostRender:](v12, "performPostRender:", v13);
      v6 = &v14;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100004E44;
      v15[3] = &unk_1000209D8;
      objc_copyWeak(&v18, &location);
      v16 = v3;
      v17 = self;
      objc_msgSend(v11, "localStatusForMessage:completion:", v16, v15);

      v6 = &v18;
    }
  }
  objc_destroyWeak(v6);
LABEL_11:

  objc_destroyWeak(&location);
}

- (void)_resizeBubbleViewToReferenceSizeAnimated
{
  -[PKPeerPaymentBubbleView referenceSize](self->_bubbleView, "referenceSize");
  -[PKPeerPaymentMessagesContentRenderBubbleViewController _resizeBubbleViewToSize:completion:](self, "_resizeBubbleViewToSize:completion:", 0);
}

- (void)_resizeBubbleViewToSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void (**v7)(_QWORD);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t Object;
  NSObject *v14;
  _BOOL4 v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  id v19;
  NSString *v20;
  void *v21;
  void *v22;
  dispatch_time_t v23;
  _QWORD v24[5];
  void (**v25)(_QWORD);
  id v26[3];
  id location;
  uint8_t buf[4];
  PKPeerPaymentMessagesContentRenderBubbleViewController *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  NSSize v34;
  NSSize v35;
  NSSize v36;

  height = a3.height;
  width = a3.width;
  v7 = (void (**)(_QWORD))a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  objc_msgSend(v8, "contentSize");
  v10 = v9;
  v12 = v11;

  Object = PKLogFacilityTypeGetObject(11);
  v14 = objc_claimAutoreleasedReturnValue(Object);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (width == v10 && height == v12)
  {
    if (v15)
    {
      v34.width = width;
      v34.height = height;
      v16 = NSStringFromSize(v34);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 134218242;
      v29 = self;
      v30 = 2114;
      v31 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: No bubble view resize needed. Size: %{public}@.", buf, 0x16u);

    }
    if (v7)
      v7[2](v7);
  }
  else
  {
    if (v15)
    {
      v35.width = width;
      v35.height = height;
      v18 = NSStringFromSize(v35);
      v19 = (id)objc_claimAutoreleasedReturnValue(v18);
      v36.width = v10;
      v36.height = v12;
      v20 = NSStringFromSize(v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 134218498;
      v29 = self;
      v30 = 2114;
      v31 = v19;
      v32 = 2114;
      v33 = v21;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Resize bubble view to size: %{public}@ content size: %{public}@.", buf, 0x20u);

    }
    self->_pendingBubbleViewSize.width = width;
    self->_pendingBubbleViewSize.height = height;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
    objc_msgSend(v22, "noteContentSizeNeedsUpdate");

    v23 = dispatch_time(0, 800000000);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000058F8;
    v24[3] = &unk_100020A28;
    objc_copyWeak(v26, &location);
    v24[4] = self;
    v26[1] = *(id *)&width;
    v26[2] = *(id *)&height;
    v25 = v7;
    dispatch_after(v23, (dispatch_queue_t)&_dispatch_main_q, v24);

    objc_destroyWeak(v26);
  }
  objc_destroyWeak(&location);

}

- (void)_bubbleViewSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t Object;
  NSObject *v10;
  int v11;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v12;
  __int16 v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeConversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedMessage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerPaymentMessage"));

  if (!v6)
    goto LABEL_11;
  if (objc_msgSend(v6, "type") == (id)1
    && objc_msgSend(v6, "hasBeenSent")
    && -[PKPeerPaymentBubbleView state](self->_bubbleView, "state") != (id)9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
    -[NSObject handleAction:sender:completion:](v10, "handleAction:sender:completion:", 6, self, 0);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v6, "type") != (id)3 || !objc_msgSend(v6, "hasBeenSent"))
  {
LABEL_11:
    Object = PKLogFacilityTypeGetObject(11);
    v10 = objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Ignoring bubble tap on message: %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "isFromMe"))
    v7 = 8;
  else
    v7 = 5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  objc_msgSend(v8, "handleAction:sender:completion:", v7, self, 0);

LABEL_14:
}

- (void)_bubbleViewPanned
{
  uint64_t Object;
  NSObject *v4;
  int v5;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v6;

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Pan gesture detected. Not showing transaction details.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_bubbleViewDoubleTapped
{
  uint64_t Object;
  NSObject *v4;
  int v5;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v6;

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Double tap gesture detected. Not showing transaction details.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_bubbleViewLongPressed
{
  uint64_t Object;
  NSObject *v4;
  int v5;
  PKPeerPaymentMessagesContentRenderBubbleViewController *v6;

  Object = PKLogFacilityTypeGetObject(11);
  v4 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentMessagesContentRenderBubbleViewController %p: Long press gesture detected. Not showing transaction details.", (uint8_t *)&v5, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessage, 0);
  objc_storeStrong((id *)&self->_bubbleView, 0);
}

@end
