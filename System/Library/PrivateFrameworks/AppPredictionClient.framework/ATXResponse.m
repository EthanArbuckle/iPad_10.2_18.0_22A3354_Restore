@implementation ATXResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ATXResponse *v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("scoredPredictions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("proactiveSuggestions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheFileData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blendingModelUICacheUpdateUUID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ATXResponse initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:](self, "initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:", v9, v13, v5, v14, v15, v16);
  return v17;
}

- (ATXResponse)initWithPredictions:(id)a3 proactiveSuggestions:(id)a4 uuid:(id)a5 cacheFileData:(id)a6 blendingUICacheUpdateUUID:(id)a7 error:(id)a8
{
  id v15;
  id v16;
  id v17;
  ATXResponse *v18;
  ATXResponse *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *appClipQueue;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)ATXResponse;
  v18 = -[ATXResponse init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v19->_predictions, a3);
    objc_storeStrong((id *)&v19->_proactiveSuggestions, a4);
    objc_storeStrong((id *)&v19->_cacheFileData, a6);
    objc_storeStrong((id *)&v19->_blendingModelUICacheUpdateUUID, a7);
    objc_storeStrong((id *)&v19->_error, a8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("appClipQueue", v20);
    appClipQueue = v19->_appClipQueue;
    v19->_appClipQueue = (OS_dispatch_queue *)v21;

  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predictions, CFSTR("scoredPredictions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proactiveSuggestions, CFSTR("proactiveSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cacheFileData, CFSTR("cacheFileData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blendingModelUICacheUpdateUUID, CFSTR("blendingModelUICacheUpdateUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (NSError)error
{
  return self->_error;
}

- (void)enumerateAtxSearchResults:(id)a3
{
  id v4;
  NSArray *predictions;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  predictions = self->_predictions;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__ATXResponse_enumerateAtxSearchResults___block_invoke;
  v7[3] = &unk_1E4D5D1A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](predictions, "enumerateObjectsUsingBlock:", v7);

}

void __41__ATXResponse_enumerateAtxSearchResults___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  ATXSearchResult *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = a2;
  if (objc_msgSend(v5, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = -[ATXSearchResult initWithScoredBundleId:response:proactiveSuggestion:]([ATXSearchResult alloc], "initWithScoredBundleId:response:proactiveSuggestion:", v6, *(_QWORD *)(a1 + 32), v7);
  objc_msgSend(v6, "predictedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!+[ATXApplicationRecord isAppClipWebClipBundleId:](ATXApplicationRecord, "isAppClipWebClipBundleId:", v10))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 1, 0);
    objc_msgSend(v12, "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 2;
    v14 = v10;
    goto LABEL_10;
  }

  objc_msgSend(MEMORY[0x1E0D10840], "sharedStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronouslyGetAppClipWithIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && objc_msgSend(v12, "isApplicationInstalled") && v13)
  {
    v14 = CFSTR("com.apple.application");
    v15 = 22;
LABEL_10:

    if (!objc_msgSend(v13, "length"))
    {
      __atxlog_handle_ui();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_2((uint64_t)v10, v16);

    }
    objc_msgSend(MEMORY[0x1E0D8C7A8], "textWithString:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSearchResult setTitle:](v8, "setTitle:", v17);

    -[ATXSearchResult setIdentifier:](v8, "setIdentifier:", v10);
    -[ATXSearchResult setApplicationBundleIdentifier:](v8, "setApplicationBundleIdentifier:", v14);
    -[ATXSearchResult setIsLocalApplicationResult:](v8, "setIsLocalApplicationResult:", 1);
    -[ATXSearchResult setSectionBundleIdentifier:](v8, "setSectionBundleIdentifier:", CFSTR("com.apple.spotlight.dec.zkw.apps"));
    -[ATXSearchResult setRenderHorizontallyWithOtherResultsInCategory:](v8, "setRenderHorizontallyWithOtherResultsInCategory:", 1);
    -[ATXSearchResult title](v8, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaxLines:", 1);

    -[ATXSearchResult applicationBundleIdentifier](v8, "applicationBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSearchResult setResultBundleId:](v8, "setResultBundleId:", v19);

    -[ATXSearchResult setType:](v8, "setType:", v15);
    __atxlog_handle_ui();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v13;
      _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_INFO, "zkw app title: %@", (uint8_t *)&v26, 0xCu);
    }

    __atxlog_handle_ui();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      -[ATXSearchResult identifier](v8, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1A49EF000, v21, OS_LOG_TYPE_INFO, "zkw searchResult.identifier: %@", (uint8_t *)&v26, 0xCu);

    }
    __atxlog_handle_ui();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      -[ATXSearchResult applicationBundleIdentifier](v8, "applicationBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v24;
      _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_INFO, "zkw searchResult.applicationBundleIdentifier: %@", (uint8_t *)&v26, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_24;
  }
  __atxlog_handle_ui();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_1(v25);

  v14 = CFSTR("com.apple.application");
LABEL_24:

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingModelUICacheUpdateUUID, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestions, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_appClipQueue, 0);
  objc_storeStrong((id *)&self->_cacheFileData, 0);
}

- (NSArray)predictedApps
{
  return (NSArray *)+[ATXScoredPrediction predictionsFrom:](ATXScoredPrediction, "predictionsFrom:", self->_predictions);
}

- (ATXResponse)initWithPredictions:(id)a3 cacheFileData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ATXResponse *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = -[ATXResponse initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:](self, "initWithPredictions:proactiveSuggestions:uuid:cacheFileData:blendingUICacheUpdateUUID:error:", v10, 0, v11, v9, 0, v8);

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid:%@\npredictions:%@\nproactiveSuggestions:%@\ncacheFileData: %lu bytes\nblendingModelUICacheUpdateUUID:%@\nerror: %@"), self->_uuid, self->_predictions, self->_proactiveSuggestions, -[NSData length](self->_cacheFileData, "length"), self->_blendingModelUICacheUpdateUUID, self->_error);
}

- (id)jsonRawData
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSUUID *blendingModelUICacheUpdateUUID;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("uuid");
  -[NSUUID description](self->_uuid, "description");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("nil");
  v20[0] = v5;
  v19[1] = CFSTR("predictedApps");
  -[ATXResponse predictedApps](self, "predictedApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v7;
  v19[2] = CFSTR("proactiveSuggestions");
  -[ATXResponse proactiveSuggestions](self, "proactiveSuggestions");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = v8;
  v20[2] = v10;
  v19[3] = CFSTR("cacheFileData");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_cacheFileData, "length"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  blendingModelUICacheUpdateUUID = self->_blendingModelUICacheUpdateUUID;
  if (!blendingModelUICacheUpdateUUID)
    blendingModelUICacheUpdateUUID = (NSUUID *)&stru_1E4D5DB30;
  v20[3] = v11;
  v20[4] = blendingModelUICacheUpdateUUID;
  v19[4] = CFSTR("blendingUICacheUpdateUUID");
  v19[5] = CFSTR("error");
  -[NSError description](self->_error, "description");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("nil");
  v20[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  return v17;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXResponse jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXResponse json].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (id)jsonDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXResponse json](self, "json");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXResponse *v4;
  ATXResponse *v5;
  BOOL v6;

  v4 = (ATXResponse *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXResponse isEqualToResponse:](self, "isEqualToResponse:", v5);

  return v6;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id *v4;
  NSUUID *uuid;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSArray *predictions;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  NSArray *proactiveSuggestions;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  char v19;
  NSData *cacheFileData;
  NSData *v21;
  NSData *v22;
  NSData *v23;
  char v24;
  NSUUID *blendingModelUICacheUpdateUUID;
  NSUUID *v26;
  NSUUID *v27;
  NSUUID *v28;
  char v29;
  char v30;
  NSError *v32;
  NSError *v33;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSUUID *)v4[3];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_19;
  }
  predictions = self->_predictions;
  v11 = (NSArray *)v4[5];
  if (predictions == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = predictions;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_19;
  }
  proactiveSuggestions = self->_proactiveSuggestions;
  v16 = (NSArray *)v4[6];
  if (proactiveSuggestions == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = proactiveSuggestions;
    v19 = -[NSArray isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_19;
  }
  cacheFileData = self->_cacheFileData;
  v21 = (NSData *)v4[1];
  if (cacheFileData == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = cacheFileData;
    v24 = -[NSData isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_19;
  }
  blendingModelUICacheUpdateUUID = self->_blendingModelUICacheUpdateUUID;
  v26 = (NSUUID *)v4[7];
  if (blendingModelUICacheUpdateUUID == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = blendingModelUICacheUpdateUUID;
    v29 = -[NSUUID isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
    {
LABEL_19:
      v30 = 0;
      goto LABEL_20;
    }
  }
  v32 = self->_error;
  v33 = v32;
  if (v32 == v4[4])
    v30 = 1;
  else
    v30 = -[NSError isEqual:](v32, "isEqual:");

LABEL_20:
  return v30;
}

- (NSArray)predictions
{
  return self->_predictions;
}

- (NSArray)proactiveSuggestions
{
  return self->_proactiveSuggestions;
}

- (NSUUID)blendingModelUICacheUpdateUUID
{
  return self->_blendingModelUICacheUpdateUUID;
}

- (NSData)cacheFileData
{
  return self->_cacheFileData;
}

- (void)json
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize ATXResponse. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Uninstalled webClip reached ATXReponse", v1, 2u);
}

void __41__ATXResponse_enumerateAtxSearchResults___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "ZKW app result had no title for bundleId: %@", (uint8_t *)&v2, 0xCu);
}

@end
