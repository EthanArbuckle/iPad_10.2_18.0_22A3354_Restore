@implementation InlineRecentStickersViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v12.receiver = self;
  v12.super_class = (Class)InlineRecentStickersViewController;
  -[InlineRecentStickersViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  if (IMIsStickersStripInCling())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_MSStickerSendManager sharedInstance](_MSStickerSendManager, "sharedInstance"));
    objc_msgSend(v5, "setDelegate:", self);

    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)qword_100012560;
    v17 = qword_100012560;
    if (!qword_100012560)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100002B9C;
      v13[3] = &unk_10000C558;
      v13[4] = &v14;
      sub_100002B9C((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    v8 = objc_alloc_init(v7);
    objc_msgSend(v8, "setDelegate:", self);
    -[InlineRecentStickersViewController addChildViewController:](self, "addChildViewController:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController view](self, "view"));
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "setFrame:");

    objc_msgSend(v9, "setAutoresizingMask:", 18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController view](self, "view"));
    objc_msgSend(v11, "addSubview:", v9);

    objc_msgSend(v8, "didMoveToParentViewController:", self);
  }
}

- (void)setHostBundleID:(id)a3
{
  __CFString *v4;
  __SecTask *v5;
  __SecTask *v6;
  __CFString *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  __CFString *v11;
  audit_token_t v12;

  v4 = (__CFString *)a3;
  -[InlineRecentStickersViewController _hostAuditToken](self, "_hostAuditToken");
  v5 = SecTaskCreateWithAuditToken(0, &v12);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopyValueForEntitlement(v5, CFSTR("application-identifier"), 0);
    CFRelease(v6);
  }
  else
  {
    v7 = &stru_10000C888;
  }
  v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.InputUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_MSStickerSendManager sharedInstance](_MSStickerSendManager, "sharedInstance"));
  v10 = v9;
  if (v8)
    v11 = v4;
  else
    v11 = v7;
  objc_msgSend(v9, "setHostBundleID:", v11);

}

- (id)_remoteProxy
{
  return -[InlineRecentStickersViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_10000C3B0);
}

- (void)applyEffect:(int64_t)a3 toSticker:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(id, id);
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v7 = a4;
  v8 = (void (**)(id, id))a5;
  if (a3 < 1
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representations")),
        v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &stru_10000C3F0),
        v9,
        v10 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v8[2](v8, v7);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[VKCStickerEffect effectWithType:](VKCStickerEffect, "effectWithType:", a3));
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_10000190C;
    v24 = sub_10000191C;
    v25 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representations"));
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v10));

    v13 = objc_alloc((Class)UIImage);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "data"));
    v15 = objc_msgSend(v13, "initWithData:", v14);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100001924;
    v16[3] = &unk_10000C418;
    v19 = &v20;
    v18 = v8;
    v17 = v7;
    objc_msgSend(v11, "applyToImage:completion:", v15, v16);

    _Block_object_dispose(&v20, 8);
  }

}

- (void)requestStageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 effectType:(int64_t)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 ckAttributionInfo:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  InlineRecentStickersViewController *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  int64_t v48;
  _QWORD v49[5];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 buf;
  Class (*v55)(uint64_t);
  void *v56;
  uint64_t *v57;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = self;
  v22 = a9;
  v23 = a10;
  v24 = sub_100006854();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Staging sticker with identifier %@", (uint8_t *)&buf, 0xCu);
  }

  if (NSClassFromString(CFSTR("_UISticker")))
  {
    v26 = (void *)objc_opt_new();
    objc_msgSend(v26, "setIdentifier:", v16);
    objc_msgSend(v26, "setRepresentations:", v17);
    objc_msgSend(v26, "setName:", v18);
    objc_msgSend(v26, "setEffectType:", a6);
    objc_msgSend(v26, "setExternalURI:", v19);
    objc_msgSend(v26, "setAccessibilityLabel:", v20);
    objc_msgSend(v26, "setMetadata:", v22);
    objc_msgSend(v26, "setAttributionInfo:", v23);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100001D38;
    v49[3] = &unk_10000C440;
    v49[4] = v21;
    -[InlineRecentStickersViewController applyEffect:toSticker:completion:](v21, "applyEffect:toSticker:completion:", a6, v26, v49);
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController _remoteProxy](v21, "_remoteProxy"));
    objc_msgSend(v26, "stageStickerWithIdentifier:representations:name:externalURI:accessibilityLabel:", v16, v17, v18, v19, v20);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController _remoteProxy](v21, "_remoteProxy"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100001D84;
  v40[3] = &unk_10000C468;
  v28 = v16;
  v41 = v28;
  v29 = v17;
  v30 = v23;
  v31 = v29;
  v42 = v29;
  v48 = a6;
  v32 = v19;
  v43 = v32;
  v33 = v18;
  v44 = v33;
  v34 = v20;
  v45 = v34;
  v35 = v22;
  v46 = v35;
  v36 = v30;
  v47 = v36;
  objc_msgSend(v27, "remoteHandlesRecentsStickerDonationWithCompletionHandler:", v40);

  v50 = 0;
  v51 = &v50;
  v52 = 0x2050000000;
  v37 = (void *)qword_100012580;
  v53 = qword_100012580;
  if (!qword_100012580)
  {
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v55 = sub_100002D84;
    v56 = &unk_10000C558;
    v57 = &v50;
    sub_100002D84((uint64_t)&buf);
    v37 = (void *)v51[3];
  }
  v38 = objc_retainAutorelease(v37);
  _Block_object_dispose(&v50, 8);
  if ((objc_opt_respondsToSelector(v38, "trackStickerSentFromHostBundleIdentifier:") & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController _hostApplicationBundleIdentifier](v21, "_hostApplicationBundleIdentifier"));
    objc_msgSend(v38, "trackStickerSentFromHostBundleIdentifier:", v39);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)InlineRecentStickersViewController;
  -[InlineRecentStickersViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController _remoteProxy](self, "_remoteProxy"));
  objc_msgSend(v4, "dismissCard");

}

+ (id)_remoteViewControllerInterface
{
  if (qword_100012538 != -1)
    dispatch_once(&qword_100012538, &stru_10000C4A8);
  return (id)qword_100012530;
}

+ (id)_exportedInterface
{
  if (qword_100012548 != -1)
    dispatch_once(&qword_100012548, &stru_10000C4C8);
  return (id)qword_100012540;
}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = sub_100006854();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000698C();

}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4 withFrame:(CGRect)a5
{
  id v5;
  NSObject *v6;

  v5 = sub_100006854();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10000698C();

}

- (void)stickerCollectionViewControllerPrepareForNewSticker:(id)a3 fromPhotoPicker:(BOOL)a4
{
  id v4;
  NSObject *v5;

  v4 = sub_100006854();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000069B8();

}

- (void)stickerCollectionViewControllerRequestsMoreStickers:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  objc_msgSend(v3, "presentCard");

}

- (void)stickerCollectionViewController:(id)a3 requestsMSStickerFromSticker:(id)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  _UIStickerRepresentation *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void (**v39)(id, id, _QWORD);
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v6 = a4;
  v39 = (void (**)(id, id, _QWORD))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", &stru_10000C508));

  v40 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v9, "count")));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v17 = objc_opt_new(_UIStickerRepresentation);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "data"));
        -[_UIStickerRepresentation setData:](v17, "setData:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uti"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        -[_UIStickerRepresentation setType:](v17, "setType:", v20);

        objc_msgSend(v16, "size");
        -[_UIStickerRepresentation setSize:](v17, "setSize:");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "role"));
        -[_UIStickerRepresentation setRole:](v17, "setRole:", v21);

        objc_msgSend(v10, "addObject:", v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v13);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 3));
  if ((objc_opt_respondsToSelector(v40, "attributionInfo") & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributionInfo"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributionInfo"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "adamID"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, IMFileTransferAttributionInfoAdamIDKey);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributionInfo"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, IMFileTransferAttributionInfoBundleIDKey);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "attributionInfo"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, IMFileTransferAttributionInfoAppNameKey);

    }
  }
  v38 = v22;
  if ((objc_opt_respondsToSelector(v40, "accessibilityName") & 1) != 0)
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "accessibilityName"));
  else
    v37 = 0;
  v30 = objc_alloc((Class)MSSticker);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "name"));
  v33 = objc_msgSend(v40, "effect");
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "externalURI"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "metadata"));
  v36 = objc_msgSend(v30, "initWithStickerIdentifier:representations:stickerName:effectType:externalURI:localizedDescription:metadata:attributionInfo:", v31, v10, v32, v33, v34, v37, v35, v38);

  v39[2](v39, v36, 0);
}

- (id)stickerCollectionViewController:(id)a3 requestsMSStickerFromURL:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_msgSend(objc_alloc((Class)MSSticker), "initWithContentsOfURL:externalURI:localizedDescription:error:", v12, v11, v10, a7);

  return v13;
}

- (BOOL)isExpanded
{
  return 0;
}

- (void)stickerCollectionViewController:(id)a3 isPresentingViewController:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = sub_100006854();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000069E4();

}

- (void)stickerCollectionViewController:(id)a3 isDonePresentingViewController:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = sub_100006854();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000069E4();

}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInRemoteView:(CGRect)a5 completionHandler:(id)a6
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stickerIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageFileURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
    v11 = v10;
    if (v10)
    {
      v8 = v10;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));

    }
  }
  v13 = objc_msgSend(v20, "stickerEffectType");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "representations"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stickerName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "externalURI"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metadata"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "attributionInfo"));
  -[InlineRecentStickersViewController requestStageStickerWithIdentifier:representations:name:effectType:externalURI:accessibilityLabel:metadata:ckAttributionInfo:](self, "requestStageStickerWithIdentifier:representations:name:effectType:externalURI:accessibilityLabel:metadata:ckAttributionInfo:", v8, v14, v15, v13, v16, v17, v18, v19);

}

- (void)stickerDragCanceled
{
  void *v2;
  void *v3;

  v2 = (void *)qword_100012550;
  qword_100012550 = 0;

  v3 = (void *)qword_100012558;
  qword_100012558 = 0;

}

- (void)stickerDruidDragStarted
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)&qword_100012550, self);
  v2 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)qword_100012558;
  qword_100012558 = v2;

}

- (void)stickerDruidDragEndedWithIMSticker:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (id)qword_100012558;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InlineRecentStickersViewController _remoteProxy](self, "_remoteProxy"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000029BC;
  v9[3] = &unk_10000C530;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "remoteHandlesRecentsStickerDonationWithCompletionHandler:", v9);

}

- (void)stickerDruidDragEndedWithMSSticker:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = sub_100001E48();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stickerPackGUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "representations"));
  v7 = objc_msgSend(v3, "stickerEffectType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "externalURI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stickerName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributionInfo"));

  objc_msgSend(v4, "donateStickerToRecentsWithIdentifier:representations:stickerEffectType:externalURI:name:accessibilityLabel:metadata:ckAttributionInfo:", v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)qword_100012550;
  qword_100012550 = 0;

  v14 = (void *)qword_100012558;
  qword_100012558 = 0;

}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v5;
  NSObject *v6;

  v5 = sub_100006854();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100006A10();

}

@end
