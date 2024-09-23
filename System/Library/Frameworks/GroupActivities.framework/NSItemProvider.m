@implementation NSItemProvider

void __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, id, _QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  lpLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v24 = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1A0DB3000, v4, OS_LOG_TYPE_INFO, "Started loading link metadata for TUConversationActivityMetadata from NSItemProvider: %@", (uint8_t *)&v24, 0xCu);
  }

  v6 = (void *)CUTWeakLinkClass();
  v8 = *(void **)(a1 + 32);
  v7 = (id *)(a1 + 32);
  objc_msgSend(v8, "linkMetadatablob");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  lpLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      v12 = *v7;
      v24 = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1A0DB3000, v10, OS_LOG_TYPE_INFO, "TUConversationActivityMetadata had linkMetadatablob, using that to derive link metadata for NSItemProvider load: %@", (uint8_t *)&v24, 0xCu);
    }

    objc_msgSend(*v7, "linkMetadatablob");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadataWithDataRepresentation:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v11)
  {
    v15 = *v7;
    v24 = 138412290;
    v25 = v15;
    _os_log_impl(&dword_1A0DB3000, v10, OS_LOG_TYPE_INFO, "TUConversationActivityMetadata did not have a linkMetadatablob, deriving link metadata directly from TUConversationActivityMetadata properties for NSItemProvider load: %@", (uint8_t *)&v24, 0xCu);
  }

  v14 = objc_alloc_init((Class)v6);
  objc_msgSend(*v7, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v16);

  objc_msgSend(*v7, "subTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSummary:", v17);

  objc_msgSend(*v7, "imageData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc((Class)CUTWeakLinkClass());
    objc_msgSend(*v7, "imageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "initWithData:MIMEType:", v13, CFSTR("image/jpeg"));
    objc_msgSend(v14, "setImage:", v20);

LABEL_11:
  }
  lpLog();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v3)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v23 = *v7;
      v24 = 138412290;
      v25 = v23;
      _os_log_impl(&dword_1A0DB3000, v22, OS_LOG_TYPE_INFO, "Finished loading link metadata for TUConversationActivityMetadata from NSItemProvider: %@", (uint8_t *)&v24, 0xCu);
    }

    v3[2](v3, v14, 0);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke_cold_1((uint64_t *)v7, v22);

  }
}

void __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A0DB3000, a2, OS_LOG_TYPE_ERROR, "NSItemProvider completionHandler was unexpectedly nil. Not loading link metadata for TUConversationActivityMetadata: %@", (uint8_t *)&v3, 0xCu);
}

@end
