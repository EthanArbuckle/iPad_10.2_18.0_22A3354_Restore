@implementation MPModelStoreBrowseRoomMusicKitRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MPStoreModelRequestConfiguration *v11;
  void *v12;
  MPStoreModelRequestConfiguration *v13;
  MPStoreModelRequestConfiguration *v14;

  v6 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadAdditionalContentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    || (objc_msgSend(v7, "roomID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MPModelStoreBrowseRoomMusicKitRequestOperation _roomURLWithRoomID:storeURLBag:](self, "_roomURLWithRoomID:storeURLBag:", v9, v6), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9, v8))
  {
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHTTPMethod:", CFSTR("GET"));
    -[MPStoreModelRequestOperation remainingTimeInterval](self, "remainingTimeInterval");
    objc_msgSend(v10, "setTimeoutInterval:");
    v11 = [MPStoreModelRequestConfiguration alloc];
    v12 = (void *)objc_msgSend(v10, "copy");
    v13 = -[MPStoreModelRequestConfiguration initWithURLRequest:](v11, "initWithURLRequest:", v12);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7201, 0);
    v8 = 0;
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MPModelStoreBrowseSectionBuilder *v12;
  void *v13;
  void *v14;
  MPModelStoreBrowseContentItemBuilder *v15;
  void *v16;
  void *v17;
  MPModelStoreBrowseContentItemBuilder *v18;
  NSIndexSet *v19;
  MPModelStoreBrowseRoomMusicKitResponseParser *v20;
  void *v21;
  MPModelStoreBrowseRoomMusicKitResponseParser *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[MPStoreModelRequestOperation request](self, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPModelStoreBrowseSectionBuilder allSupportedInternalOnlyProperties](MPModelStoreBrowseSectionBuilder, "allSupportedInternalOnlyProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertySetByCombiningWithPropertySet:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v11;
  v12 = -[MPModelStoreBrowseSectionBuilder initWithRequestedPropertySet:]([MPModelStoreBrowseSectionBuilder alloc], "initWithRequestedPropertySet:", v11);
  v29[0] = CFSTR("MPModelStoreBrowseContentItemPropertyItemType");
  v29[1] = CFSTR("MPModelStoreBrowseContentItemPropertyDetailedItemType");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [MPModelStoreBrowseContentItemBuilder alloc];
  objc_msgSend(v8, "itemProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "propertySetByCombiningWithPropertySet:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[MPModelStoreBrowseContentItemBuilder initWithRequestedPropertySet:](v15, "initWithRequestedPropertySet:", v17);

  v19 = self->_allowedFCKinds;
  v20 = [MPModelStoreBrowseRoomMusicKitResponseParser alloc];
  -[MPAsyncOperation userIdentity](self, "userIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPModelStoreBrowseRoomMusicKitResponseParser initWithRawResponseOutput:sectionBuilder:contentItemBuilder:filteredFCKinds:userIdentity:](v20, "initWithRawResponseOutput:sectionBuilder:contentItemBuilder:filteredFCKinds:userIdentity:", v7, v12, v18, v19, v21);

  -[MPModelStoreBrowseRoomMusicKitResponseParser results](v22, "results");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  -[MPModelStoreBrowseRoomMusicKitRequestOperation _produceResponseWithParser:results:error:](self, "_produceResponseWithParser:results:error:", v22, v23, &v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v28;

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
    v26 = objc_claimAutoreleasedReturnValue();

    v25 = (id)v26;
  }
  v6[2](v6, v24, v25);

}

- (id)_produceResponseWithParser:(id)a3 results:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MPModelStoreBrowseResponse *v10;
  void *v11;
  MPModelStoreBrowseResponse *v12;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v12 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  v10 = [MPModelStoreBrowseResponse alloc];
  -[MPStoreModelRequestOperation request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MPModelResponse initWithRequest:](v10, "initWithRequest:", v11);

  -[MPModelStoreBrowseResponse setParser:](v12, "setParser:", v8);
  if (objc_msgSend(v9, "numberOfSections") >= 1)
    -[MPModelResponse setResults:](v12, "setResults:", v9);
  if (a5)
  {
LABEL_7:
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DDBD38], -7102, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_9:

  return v12;
}

- (id)_roomURLWithRoomID:(id)a3 storeURLBag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v25[16];
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "stringForBagKey:", CFSTR("countryCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    MusicURLComponentsWithURLBag(v7, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v27[0] = CFSTR("/v1/editorial");
    v27[1] = v8;
    v27[2] = CFSTR("rooms");
    v27[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathWithComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPath:](v9, "setPath:", v12);

    v13 = objc_alloc(MEMORY[0x1E0CB39D8]);
    -[MPStoreModelRequestOperation request](self, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientPlatformIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (const __CFString *)v15;
    else
      v17 = CFSTR("iphone");
    v18 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("platform"), v17);
    v26 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setQueryItems:](v9, "setQueryItems:", v19);

    MusicURLQueryItemLanguageWithURLBag(v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[NSObject queryItems](v9, "queryItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "arrayByAddingObject:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setQueryItems:](v9, "setQueryItems:", v22);

    }
    -[NSObject URL](v9, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = os_log_create("com.apple.amp.mediaplayer", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_ERROR, "No country code found in bag, can't create storefront endpoint URL", v25, 2u);
    }
    v23 = 0;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedFCKinds, 0);
}

@end
