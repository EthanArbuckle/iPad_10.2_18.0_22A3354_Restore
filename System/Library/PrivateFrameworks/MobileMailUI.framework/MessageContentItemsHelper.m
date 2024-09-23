@implementation MessageContentItemsHelper

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MessageContentItemsHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (OS_os_log *)(id)log_log_1;
}

void __32__MessageContentItemsHelper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.mobilemail", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

- (id)_representationTypeForContentItem:(id)a3
{
  void *v3;
  int v4;
  id *v5;
  id v6;

  objc_msgSend(a3, "uniformTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ef_conformsToRFC822UTType");
  v5 = (id *)MEMORY[0x1E0D1DBD8];
  if (!v4)
    v5 = (id *)MEMORY[0x1E0D1DBF0];
  v6 = *v5;

  return v6;
}

- (MessageContentItemsHelper)initWithWebView:(id)a3 contentItemHandler:(id)a4
{
  id v7;
  id v8;
  MessageContentItemsHelper *v9;
  MessageContentItemsHelper *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *elementIDToContentID;
  NSMutableDictionary *v13;
  NSMutableDictionary *elementIDToWKAttachmentID;
  NSMutableDictionary *v15;
  NSMutableDictionary *contentIDToTask;
  NSMutableSet *v17;
  NSMutableSet *inlinedImageContentIDs;
  uint64_t v19;
  EFScheduler *attachmentsScheduler;
  void *v21;
  void *v22;
  uint64_t v23;
  MSMailWebProcessAttachmentProxy *webProcessProxy;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MessageContentItemsHelper;
  v9 = -[MessageContentItemsHelper init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeWeak((id *)&v10->_representationHandler, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    elementIDToContentID = v10->_elementIDToContentID;
    v10->_elementIDToContentID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    elementIDToWKAttachmentID = v10->_elementIDToWKAttachmentID;
    v10->_elementIDToWKAttachmentID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentIDToTask = v10->_contentIDToTask;
    v10->_contentIDToTask = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    inlinedImageContentIDs = v10->_inlinedImageContentIDs;
    v10->_inlinedImageContentIDs = v17;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.messageContentItemsHelperAttachments"), 25);
    v19 = objc_claimAutoreleasedReturnValue();
    attachmentsScheduler = v10->_attachmentsScheduler;
    v10->_attachmentsScheduler = (EFScheduler *)v19;

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EFF78098);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_remoteObjectRegistry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectProxyWithInterface:", v21);
    v23 = objc_claimAutoreleasedReturnValue();
    webProcessProxy = v10->_webProcessProxy;
    v10->_webProcessProxy = (MSMailWebProcessAttachmentProxy *)v23;

  }
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_contentItems);
}

- (void)setContentItems:(id)a3
{
  NSArray *v4;
  NSArray *contentItems;
  EMMailDropMetadata *mailDropBannerMetadata;
  id maildropProgressHandler;
  NSProgress *totalMailDropProgress;
  id v9;

  v9 = a3;
  v4 = (NSArray *)objc_msgSend(v9, "copy");
  contentItems = self->_contentItems;
  self->_contentItems = v4;

  self->_didComputeMailDropProperties = 0;
  mailDropBannerMetadata = self->_mailDropBannerMetadata;
  self->_mailDropBannerMetadata = 0;

  self->_totalUnstartedMailDropDownloadSize = 0;
  maildropProgressHandler = self->_maildropProgressHandler;
  self->_totalMailDropDownloadSize = 0;
  self->_maildropProgressHandler = 0;

  totalMailDropProgress = self->_totalMailDropProgress;
  self->_totalMailDropProgress = 0;

  self->_allMailDropsDownloaded = 0;
}

- (void)associateElementID:(id)a3 withContentID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementIDToContentID, "setObject:forKeyedSubscript:", a4, a3);
}

- (void)associateElementID:(id)a3 withWKAttachmentID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementIDToWKAttachmentID, "setObject:forKeyedSubscript:", a4, a3);
}

- (id)contentItemForElementID:(id)a3
{
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementIDToContentID, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageContentItemsHelper contentItemForContentID:](self, "contentItemForContentID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentItemForContentID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[MessageContentItemsHelper contentItems](self, "contentItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "contentID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v4);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_computeMailDropProperties
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  EMMailDropMetadata *v11;
  EMMailDropMetadata *mailDropBannerMetadata;
  uint64_t v13;
  NSProgress *v14;
  NSProgress *totalMailDropProgress;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->_didComputeMailDropProperties = 1;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MessageContentItemsHelper contentItems](self, "contentItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v9, "mailDropMetadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (!v6)
          {
            objc_msgSend(MEMORY[0x1E0D1E1B8], "mailDropMetadata");
            v11 = (EMMailDropMetadata *)objc_claimAutoreleasedReturnValue();
            mailDropBannerMetadata = self->_mailDropBannerMetadata;
            self->_mailDropBannerMetadata = v11;

          }
          v13 = objc_msgSend(v10, "fileSize");
          if (objc_msgSend(v9, "isAvailableLocally"))
            v5 += v13;
          else
            self->_totalUnstartedMailDropDownloadSize += v13;
          -[EMMailDropMetadata merge:](self->_mailDropBannerMetadata, "merge:", v10);
          ++v6;
          v4 += v13;
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);

    if (v6 >= 2)
      -[EMMailDropMetadata setFlags:](self->_mailDropBannerMetadata, "setFlags:", -[EMMailDropMetadata flags](self->_mailDropBannerMetadata, "flags") | 0x10);
  }
  else
  {

    v5 = 0;
    v4 = 0;
  }
  if (self->_mailDropBannerMetadata)
  {
    -[MessageContentItemsHelper setTotalMailDropDownloadSize:](self, "setTotalMailDropDownloadSize:", v4);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v4);
    v14 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    totalMailDropProgress = self->_totalMailDropProgress;
    self->_totalMailDropProgress = v14;

    if (v5 >= v4)
      self->_allMailDropsDownloaded = 1;
  }
}

- (EMMailDropMetadata)mailDropBannerMetadata
{
  if (!self->_didComputeMailDropProperties)
    -[MessageContentItemsHelper _computeMailDropProperties](self, "_computeMailDropProperties");
  return self->_mailDropBannerMetadata;
}

- (void)noteDidFailLoadingResourceWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageContentItemsHelper contentItemForContentID:](self, "contentItemForContentID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MessageContentItemsHelper noteDidFailLoadingResourceWithURL:].cold.1();
    }

    objc_msgSend(v4, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageContentItemsHelper _injectAttachmentViewForElementWithSourceAttributeValue:forContentItem:](self, "_injectAttachmentViewForElementWithSourceAttributeValue:forContentItem:", v9, v7);

  }
}

- (void)attachmentWasTappedWithElementID:(id)a3 rect:(CGRect)a4 view:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  id v26;
  uint64_t v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  -[MessageContentItemsHelper contentItemForElementID:](self, "contentItemForElementID:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1D56AF000, v17, OS_LOG_TYPE_DEFAULT, "tapped unknown attachment %@", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_19;
  }
  +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "contentID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v15;
    _os_log_impl(&dword_1D56AF000, v14, OS_LOG_TYPE_DEFAULT, "tapped attachment %@", (uint8_t *)&v25, 0xCu);

  }
  v16 = -[MessageContentItemsHelper displayStateForContentItem:](self, "displayStateForContentItem:", v13);
  switch(v16)
  {
    case 1:
      -[MessageContentItemsHelper displayViewerForContentItem:rect:view:](self, "displayViewerForContentItem:rect:view:", v13, v12, x, y, width, height);
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "contentID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v19;
        _os_log_impl(&dword_1D56AF000, v17, OS_LOG_TYPE_DEFAULT, "attachment %@ is already downloaded", (uint8_t *)&v25, 0xCu);

      }
      goto LABEL_19;
    case 2:
      -[NSMutableDictionary objectForKeyedSubscript:](self->_elementIDToWKAttachmentID, "objectForKeyedSubscript:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "contentID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[MessageContentItemsHelper attachmentWasTappedWithElementID:rect:view:].cold.1(v24, (uint64_t)v11, (uint64_t)&v25, v17);
        }
        goto LABEL_19;
      }
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "contentID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v22;
        _os_log_impl(&dword_1D56AF000, v21, OS_LOG_TYPE_DEFAULT, "attachment %@ is downloadable", (uint8_t *)&v25, 0xCu);

      }
      v23 = -[MessageContentItemsHelper startDownloadForContentItem:userInitiated:](self, "startDownloadForContentItem:userInitiated:", v13, 1);
      break;
    case 3:
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "contentID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v18;
        _os_log_impl(&dword_1D56AF000, v17, OS_LOG_TYPE_DEFAULT, "attachment %@ is downloading", (uint8_t *)&v25, 0xCu);

      }
LABEL_19:

      break;
  }

}

- (void)displayViewerForContentItem:(id)a3 rect:(CGRect)a4 view:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  if (objc_msgSend(v11, "exchangeEventUID"))
  {
    -[MessageContentItemsHelper representationHandler](self, "representationHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "showSelectedExchangeEventUID:fromRect:view:", objc_msgSend(v11, "exchangeEventUID"), v12, x, y, width, height);
  }
  else
  {
    -[MessageContentItemsHelper _futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:](self, "_futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:", v11, 0, 0, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__MessageContentItemsHelper_displayViewerForContentItem_rect_view___block_invoke;
    v15[3] = &unk_1E9A02C98;
    v15[4] = self;
    v17 = x;
    v18 = y;
    v19 = width;
    v20 = height;
    v16 = v12;
    objc_msgSend(v13, "onScheduler:addSuccessBlock:", v14, v15);

  }
}

void __67__MessageContentItemsHelper_displayViewerForContentItem_rect_view___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "representationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showSelectedContentRepresentation:fromRect:view:", v4, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (void)showMenuForContentItem:(id)a3 rect:(CGRect)a4 view:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  -[MessageContentItemsHelper _futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:](self, "_futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:", a3, 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__MessageContentItemsHelper_showMenuForContentItem_rect_view___block_invoke;
  v15[3] = &unk_1E9A02C98;
  v15[4] = self;
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  v14 = v11;
  v16 = v14;
  objc_msgSend(v12, "onScheduler:addSuccessBlock:", v13, v15);

}

void __62__MessageContentItemsHelper_showMenuForContentItem_rect_view___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "representationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMenuForSelectedContentRepresentation:fromRect:view:", v4, *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (id)futureForContentItem:(id)a3 download:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  -[MessageContentItemsHelper _futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:](self, "_futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:", a3, v4, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_futureForContentItem:(id)a3 networkUsage:(int64_t)a4 invokerID:(id)a5 previouslyInvoked:(BOOL *)a6 progress:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  MessageContentItemRepresentationTask *v15;
  MessageContentItemRepresentationTask *v16;
  void *v17;
  void *v18;
  int64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  MessageContentItemRepresentationTask *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  objc_msgSend(v12, "contentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contentIDToTask, "objectForKeyedSubscript:", v14);
  v15 = (MessageContentItemRepresentationTask *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
LABEL_8:
    -[MessageContentItemsHelper _representationTypeForContentItem:](self, "_representationTypeForContentItem:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MessageContentItemRepresentationTask initWithContentItem:type:networkUsage:]([MessageContentItemRepresentationTask alloc], "initWithContentItem:type:networkUsage:", v12, v22, a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentIDToTask, "setObject:forKeyedSubscript:", v16, v14);
    -[MessageContentItemRepresentationTask future](v16, "future");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __101__MessageContentItemsHelper__futureForContentItem_networkUsage_invokerID_previouslyInvoked_progress___block_invoke;
    v28[3] = &unk_1E9A02CC0;
    v28[4] = self;
    v29 = v12;
    v30 = v14;
    objc_msgSend(v23, "onScheduler:addFailureBlock:", v24, v28);

    -[MessageContentItemRepresentationTask resume](v16, "resume");
    goto LABEL_9;
  }
  -[MessageContentItemRepresentationTask future](v15, "future");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resultIfAvailable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

    goto LABEL_9;
  }
  v19 = -[MessageContentItemRepresentationTask networkUsage](v16, "networkUsage");

  if (v19 < a4)
  {
    +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v16;
      _os_log_impl(&dword_1D56AF000, v20, OS_LOG_TYPE_DEFAULT, "Removing and re-creating task: %@", buf, 0xCu);
    }

    -[MessageContentItemRepresentationTask progress](v16, "progress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "cancel");

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentIDToTask, "setObject:forKeyedSubscript:", 0, v14);
    goto LABEL_8;
  }
LABEL_9:
  v25 = -[MessageContentItemRepresentationTask hasBeenAccessedByInvokerWithID:](v16, "hasBeenAccessedByInvokerWithID:", v13);
  -[MessageContentItemRepresentationTask addAccessedByInvokerWithID:](v16, "addAccessedByInvokerWithID:", v13);
  if (a6)
    *a6 = v25;
  if (a7)
  {
    -[MessageContentItemRepresentationTask progress](v16, "progress");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[MessageContentItemRepresentationTask future](v16, "future");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __101__MessageContentItemsHelper__futureForContentItem_networkUsage_invokerID_previouslyInvoked_progress___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisplayState:forContentItem:", 2, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
}

- (void)updateDragItemProvider:(id)a3 forElementID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[MessageContentItemsHelper contentItemForElementID:](self, "contentItemForElementID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageContentItemsHelper _futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:](self, "_futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:", v8, 0, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v6);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke;
  v11[3] = &unk_1E9A02D10;
  objc_copyWeak(&v13, &location);
  v10 = v8;
  v12 = v10;
  objc_msgSend(v9, "addSuccessBlock:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "uniformTypeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "hasItemConformingToTypeIdentifier:", v5))
    {
      objc_msgSend(WeakRetained, "setDataAvailability:forTypeIdentifier:", 1, v5);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke_2;
      v9[3] = &unk_1E9A02CE8;
      v10 = v6;
      objc_msgSend(WeakRetained, "registerFileRepresentationForTypeIdentifier:dataAvailableImmediately:visibility:loadHandler:", v5, 1, 0, v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSuggestedName:", v8);

    objc_msgSend(WeakRetained, "registerObject:visibility:", v6, 0);
  }

}

uint64_t __65__MessageContentItemsHelper_updateDragItemProvider_forElementID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 1, 0);
  return 0;
}

- (void)_injectAttachmentViewForElementWithSourceAttributeValue:(id)a3 forContentItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[ContentItemMarkupGenerator attachmentElementMarkupStringForContentItem:](ContentItemMarkupGenerator, "attachmentElementMarkupStringForContentItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageContentItemsHelper webView](self, "webView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "mcv_stringFromJavaScriptMethod:arguments:", CFSTR("replaceNodeWithSrcWithAttachment"), v10);

}

- (int64_t)displayStateForContentItem:(id)a3
{
  NSMutableDictionary *contentIDToTask;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int64_t v8;

  contentIDToTask = self->_contentIDToTask;
  objc_msgSend(a3, "contentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](contentIDToTask, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "future");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFinished");

    if (v7)
      v8 = 1;
    else
      v8 = 3;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (void)setDisplayState:(int64_t)a3 forContentItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MessageContentItemsHelper webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mcv_stringFromJavaScriptMethod:arguments:", CFSTR("set_state_for_attachment_cid"), v10);

}

- (void)_updateProgressFraction:(id)a3 forContentItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "fractionCompleted");
  -[MessageContentItemsHelper setPercentCompleted:forContentItem:](self, "setPercentCompleted:forContentItem:", v6);
  objc_msgSend(v6, "mailDropMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[MessageContentItemsHelper displayStateForContentItem:](self, "displayStateForContentItem:", v6) == 3)
    {
      -[MessageContentItemsHelper maildropProgressHandler](self, "maildropProgressHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[MessageContentItemsHelper maildropProgressHandler](self, "maildropProgressHandler");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[NSProgress fractionCompleted](self->_totalMailDropProgress, "fractionCompleted");
        v9[2](v9, 3);

      }
    }
  }

}

- (void)setPercentCompleted:(double)a3 forContentItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MessageContentItemsHelper webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v7, "mcv_stringFromJavaScriptMethod:arguments:", CFSTR("set_progress_for_attachment_cid"), v10);

}

- (void)inlineImageFinishedDownloading:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_inlinedImageContentIDs, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_inlinedImageContentIDs, "addObject:", v5);
    objc_msgSend(v4, "contentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MFCreateURLForContentID();

    objc_msgSend(v4, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _markupForInlineAttachment(v4, objc_msgSend(v8, "conformsToType:", *MEMORY[0x1E0CEC570]));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MessageContentItemsHelper webView](self, "webView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v11;
    v14[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "mcv_stringFromJavaScriptMethod:arguments:", CFSTR("imageAttachmentNodeFinishedDownloading"), v12);

  }
}

- (id)startDownloadForContentItem:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  MessageContentItemsHelper *v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  char v37;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    v7 = 2;
  else
    v7 = 1;
  v45 = 0;
  v44 = 0;
  -[MessageContentItemsHelper _futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:](self, "_futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:", v6, v7, CFSTR("startDownloadForContentItem"), &v45, &v44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v44;
  v10 = objc_msgSend(v6, "dataTransferByteCount");
  if (v45)
  {
    +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "contentID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v12;
      v48 = 2112;
      v49 = v9;
      _os_log_impl(&dword_1D56AF000, v11, OS_LOG_TYPE_DEFAULT, "Stopped downloading contentItem %@ since downloading was previously invoked with a progress of %@", buf, 0x16u);

    }
  }
  else
  {
    v13 = v10;
    v14 = objc_msgSend(v6, "isAvailableLocally");
    v15 = MEMORY[0x1E0C809B0];
    if ((v14 & 1) == 0)
    {
      -[MessageContentItemsHelper setDisplayState:forContentItem:](self, "setDisplayState:forContentItem:", 3, v6);
      NSStringFromSelector(sel_fractionCompleted);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v15;
      v41[1] = 3221225472;
      v41[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke;
      v41[3] = &unk_1E9A02D60;
      v41[4] = self;
      v42 = v9;
      v43 = v6;
      objc_msgSend(v42, "ef_observeKeyPath:options:usingBlock:", v16, 1, v41);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v39[0] = v15;
      v39[1] = 3221225472;
      v39[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_3;
      v39[3] = &unk_1E9A02D88;
      v40 = v17;
      v18 = v17;
      objc_msgSend(v8, "always:", v39);

    }
    objc_msgSend(v6, "mailDropMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isPhotoArchive");

    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_4;
    v35[3] = &unk_1E9A02E00;
    v37 = v20;
    v35[4] = self;
    v22 = v6;
    v36 = v22;
    v38 = v4;
    objc_msgSend(v8, "onScheduler:addSuccessBlock:", v21, v35);

    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    v29 = 3221225472;
    v30 = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_124;
    v31 = &unk_1E9A02E28;
    v24 = v22;
    v32 = v24;
    v33 = self;
    v34 = v13;
    objc_msgSend(v8, "onScheduler:addFailureBlock:", v23, &v28);

    -[MessageContentItemsHelper representationHandler](self, "representationHandler", v28, v29, v30, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "didStartDownloadForContentItemWithProgress:", v9);

    objc_msgSend(v24, "mailDropMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      self->_totalUnstartedMailDropDownloadSize -= v13;
      -[NSProgress addChild:withPendingUnitCount:](self->_totalMailDropProgress, "addChild:withPendingUnitCount:", v9, v13);
    }
    v11 = v9;

  }
  return v9;
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_2;
  v4[3] = &unk_1E9A02D38;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v4);

}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateProgressFraction:forContentItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, double);
  void *v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  id v31;
  size_t v32;
  _DWORD __b[162];
  int v34[2];
  int v35;
  pid_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setDisplayState:forContentItem:", 1, *(_QWORD *)(a1 + 40));
  if (v3 && !objc_msgSend(*(id *)(a1 + 40), "exchangeEventUID"))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D608]), "initWithName:expiration:preventIdleSleep:", CFSTR("com.apple.mobilemail.savingPhotos"), 0, 600.0);
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5;
      v29[3] = &unk_1E9A02DD8;
      v30 = v3;
      v31 = v4;
      v6 = v4;
      objc_msgSend(v5, "performBlock:", v29);

      v7 = v30;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3650]);
      objc_msgSend(v3, "contentURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v8, "initWithURL:options:error:", v9, 2, 0);

      if (objc_msgSend(v6, "isRegularFile"))
      {
        v10 = +[ContentItemMarkupGenerator isDisplayableInlineContentItem:](ContentItemMarkupGenerator, "isDisplayableInlineContentItem:", *(_QWORD *)(a1 + 40));
        v11 = +[ContentItemMarkupGenerator isPDFContentItem:](ContentItemMarkupGenerator, "isPDFContentItem:", *(_QWORD *)(a1 + 40));
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(*(id *)(a1 + 40), "contentID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "webView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_attachmentForIdentifier:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "uniformTypeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFileWrapper:contentType:completion:", v6, v16, 0);

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "inlineImageFinishedDownloading:", *(_QWORD *)(a1 + 40));
        }
        else if (v11)
        {
          -[MessageContentItemsHelper updatePDFContentItemIfNeeded:contentRepresentation:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v3);
        }
      }
      else
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = objc_msgSend(v7, "length");
        objc_msgSend(*(id *)(a1 + 40), "uniformTypeIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (*(_BYTE *)(a1 + 49))
          v21 = &stru_1E9A04480;
        else
          v21 = CFSTR("not ");
        objc_msgSend(v17, "stringWithFormat:", CFSTR("WKAttachment is missing for an ID with length %lu, type %@, %@user initiated"), v18, v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D1EE70], "sharedReporter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "reportIssueType:description:", v25, v22);

        memset(__b, 170, sizeof(__b));
        __b[8] = 0;
        *(_QWORD *)v34 = 0xE00000001;
        v35 = 1;
        v36 = getpid();
        v32 = 648;
        if (!sysctl(v34, 4u, __b, &v32, 0, 0) && (__b[8] & 0x800) != 0)
          __debugbreak();

      }
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "mailDropMetadata");
  v26 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "maildropProgressHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
LABEL_28:

      goto LABEL_29;
    }
    v28 = (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "completedUnitCount") < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);

    if (!v28)
    {
      objc_msgSend(*(id *)(a1 + 32), "maildropProgressHandler");
      v26 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      v26[2](v26, 1, 1.0);
      goto LABEL_28;
    }
  }
LABEL_29:

}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D4D560], "archiveDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputWithURL:", v3);

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D4D558], "archive");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_6;
    v6[3] = &unk_1E9A02DB0;
    v7 = v2;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v4, "decompressContents:completion:", v7, v6);

    v5 = v7;
  }
  else
  {
    MFLogGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "contentURL");
      objc_claimAutoreleasedReturnValue();
      __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5_cold_1();
    }
  }

}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.photoLibrary"), 17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "scrubbedArchiveEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "contents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length")
          && (objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v7),
              (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7;
          v14[3] = &unk_1E9A02D88;
          v9 = v8;
          v15 = v9;
          objc_msgSend(v1, "performBlock:", v14);

        }
        else
        {
          MFLogGeneral();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v6;
            _os_log_error_impl(&dword_1D56AF000, v9, OS_LOG_TYPE_ERROR, "#Attachments Error reading extracted archive entry %@", buf, 0xCu);
          }
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v3);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_114;
  v12[3] = &unk_1E9A02D88;
  v13 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performBlock:", v12);

  return 1;
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7()
{
  char v0;
  id v1;
  NSObject *v2;

  v0 = MFCameraRollSaveImage();
  v1 = 0;
  if ((v0 & 1) == 0)
  {
    MFLogGeneral();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v1, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7_cold_1();
    }

  }
}

uint64_t __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_114(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)updatePDFContentItemIfNeeded:(void *)a3 contentRepresentation:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "contentID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

    if ((_DWORD)v7)
    {
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "ef_publicDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v10;
        _os_log_impl(&dword_1D56AF000, v9, OS_LOG_TYPE_DEFAULT, "Content item is already displayed inline (%{public}@)", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v5, "type");
      v9 = objc_claimAutoreleasedReturnValue();
      if ((-[NSObject conformsToType:](v9, "conformsToType:", *MEMORY[0x1E0CEC570]) & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v6, "contentURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v11, "dataWithContentsOfURL:options:error:", v12, 3, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;

        if (v13)
        {
          _markupForInlineAttachment(v5, 1);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc(MEMORY[0x1E0D46E00]);
          objc_msgSend(v5, "contentID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithContentID:uttype:data:additionalMarkup:", v17, v9, v13, v15);

          objc_msgSend(*(id *)(a1 + 72), "updateToInlinePDFAttachmentIfNeeded:", v18);
        }
        else
        {
          +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            -[NSObject ef_publicDescription](v14, "ef_publicDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "ef_publicDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[MessageContentItemsHelper updatePDFContentItemIfNeeded:contentRepresentation:].cold.1(v19, v20, (uint64_t)buf, v15);
          }
        }

      }
      else
      {
        +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[MessageContentItemsHelper updatePDFContentItemIfNeeded:contentRepresentation:].cold.2();
        }
      }

    }
  }

}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_124(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, double);

  objc_msgSend(*(id *)(a1 + 32), "mailDropMetadata");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 40), "maildropProgressHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "maildropProgressHandler");
      v5 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      v5[2](v5, 2, 0.0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "completedUnitCount") - *(_QWORD *)(a1 + 48));
    }
  }
}

- (void)downloadAllMailDropAttachments
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_contentItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isAvailableLocally", (_QWORD)v11) & 1) == 0)
        {
          objc_msgSend(v7, "mailDropMetadata");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8 == 0;

          if (!v9)
            v10 = -[MessageContentItemsHelper startDownloadForContentItem:userInitiated:](self, "startDownloadForContentItem:userInitiated:", v7, 1);
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)saveContentItem:(id)a3 toDestination:(int64_t)a4
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[MessageContentItemsHelper _futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:](self, "_futureForContentItem:networkUsage:invokerID:previouslyInvoked:progress:", a3, 0, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke;
  v7[3] = &__block_descriptor_40_e33_v16__0__EMContentRepresentation_8l;
  v7[4] = a4;
  objc_msgSend(v5, "onScheduler:addSuccessBlock:", v6, v7);

}

void __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  id v26;
  char v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v12 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v9, &v32);
  v13 = v32;

  if (v13)
    v14 = 0;
  else
    v14 = v12;
  if ((v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v31 = 0;
    objc_msgSend(v15, "_doc_importItemAtURL:toDestination:error:", v9, v16, &v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v31;

    if (!v17 || v18)
    {
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v29 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v34 = v9;
        v35 = 2050;
        v36 = v29;
        v37 = 2114;
        v38 = v18;
        _os_log_error_impl(&dword_1D56AF000, v19, OS_LOG_TYPE_ERROR, "Failed to save url: %{public}@ to destination: %{public}ld, error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v17;
        _os_log_impl(&dword_1D56AF000, v19, OS_LOG_TYPE_DEFAULT, "Imported file to URL: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "contentURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v20;
      v35 = 2114;
      v36 = v9;
      v37 = 2114;
      v38 = v13;
      _os_log_error_impl(&dword_1D56AF000, v18, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@, error: %{public}@", buf, 0x20u);

    }
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "fileExistsAtPath:", v22);

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v25 = objc_msgSend(v24, "removeItemAtURL:error:", v9, &v30);
    v26 = v30;

    if (v26)
      v27 = 0;
    else
      v27 = v25;
    if ((v27 & 1) == 0)
    {
      +[MessageContentItemsHelper log](MessageContentItemsHelper, "log");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke_cold_1((uint64_t)v9, (uint64_t)v26, v28);

    }
  }

}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (ContentRepresentationHandlingDelegate)representationHandler
{
  return (ContentRepresentationHandlingDelegate *)objc_loadWeakRetained((id *)&self->_representationHandler);
}

- (void)setRepresentationHandler:(id)a3
{
  objc_storeWeak((id *)&self->_representationHandler, a3);
}

- (unint64_t)totalMailDropDownloadSize
{
  return self->_totalMailDropDownloadSize;
}

- (void)setTotalMailDropDownloadSize:(unint64_t)a3
{
  self->_totalMailDropDownloadSize = a3;
}

- (BOOL)allMailDropsDownloaded
{
  return self->_allMailDropsDownloaded;
}

- (void)setAllMailDropsDownloaded:(BOOL)a3
{
  self->_allMailDropsDownloaded = a3;
}

- (id)maildropProgressHandler
{
  return self->_maildropProgressHandler;
}

- (void)setMaildropProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maildropProgressHandler, 0);
  objc_destroyWeak((id *)&self->_representationHandler);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_mailDropBannerMetadata, 0);
  objc_storeStrong((id *)&self->_webProcessProxy, 0);
  objc_storeStrong((id *)&self->_totalMailDropProgress, 0);
  objc_storeStrong((id *)&self->_attachmentsScheduler, 0);
  objc_storeStrong((id *)&self->_inlinedImageContentIDs, 0);
  objc_storeStrong((id *)&self->_contentIDToTask, 0);
  objc_storeStrong((id *)&self->_elementIDToWKAttachmentID, 0);
  objc_storeStrong((id *)&self->_elementIDToContentID, 0);
}

- (void)noteDidFailLoadingResourceWithURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1D56AF000, v3, v4, "injecting attachment element, failed to load content item %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)attachmentWasTappedWithElementID:(uint64_t)a3 rect:(NSObject *)a4 view:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2(&dword_1D56AF000, a4, a3, "attachment %@ is not downloadable since elementID %@ is not found in WKAttachmentID dictionary", (uint8_t *)a3);

  OUTLINED_FUNCTION_1();
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_5_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_1D56AF000, v3, v4, "#Attachments Error opening zip at %@.", v5);

  OUTLINED_FUNCTION_1();
}

void __71__MessageContentItemsHelper_startDownloadForContentItem_userInitiated___block_invoke_7_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1D56AF000, v3, v4, "#Attachments Error saving Maildrop image: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)updatePDFContentItemIfNeeded:(uint64_t)a3 contentRepresentation:(NSObject *)a4 .cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2(&dword_1D56AF000, a4, a3, "Failed to get data from url (%{public}@) %{public}@", (uint8_t *)a3);

  OUTLINED_FUNCTION_1();
}

- (void)updatePDFContentItemIfNeeded:contentRepresentation:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1D56AF000, v3, v4, "UTType does not conform to PDF (%{public}@)", v5);

  OUTLINED_FUNCTION_1();
}

void __59__MessageContentItemsHelper_saveContentItem_toDestination___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_2(&dword_1D56AF000, a3, (uint64_t)a3, "Failed to cleanup %{public}@, error: %{public}@", (uint8_t *)&v3);
}

@end
