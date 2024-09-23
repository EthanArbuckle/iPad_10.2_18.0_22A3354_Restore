@implementation MSConversation

- (void)insertMediaAtURL:(id)a3 attributionURL:(id)a4 attributionIcon:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _MSMessageMediaPayload *v13;
  __CFDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setMediaURL:](v13, "setMediaURL:", v12);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    CFDictionarySetValue(v14, CFSTR("url"), v15);

  if (v18)
  {
    _UIImageJPEGRepresentation();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      CFDictionarySetValue(v14, CFSTR("icon"), v16);

  }
  if (-[__CFDictionary count](v14, "count"))
    -[_MSMessageMediaPayload setAttributionInfo:](v13, "setAttributionInfo:", v14);
  -[MSConversation context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stageMediaItem:skipShelf:forceStage:completionHandler:", v13, 0, 0, v10);

}

- (void)insertMediaAtURL:(id)a3 completionHandler:(id)a4
{
  -[MSConversation insertMediaAtURL:attributionURL:attributionIcon:completionHandler:](self, "insertMediaAtURL:attributionURL:attributionIcon:completionHandler:", a3, 0, 0, a4);
}

- (void)insertImage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _MSMessageMediaPayload *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setImage:](v9, "setImage:", v7);

  -[MSConversation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stageMediaItem:skipShelf:forceStage:completionHandler:", v9, 0, 0, v6);

}

- (void)insertStickerWithImage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _MSMessageMediaPayload *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setImage:](v9, "setImage:", v7);

  -[MSConversation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stageMediaItem:skipShelf:forceStage:completionHandler:", v9, 0, 0, v6);

}

- (void)insertStickerWithMediaAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _MSMessageMediaPayload *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setMediaURL:](v9, "setMediaURL:", v7);

  -[MSConversation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stageMediaItem:skipShelf:forceStage:completionHandler:", v9, 0, 0, v6);

}

+ (id)activeConversation
{
  void *v2;
  void *v3;

  +[_MSMessageAppContext activeExtensionContext](_MSMessageAppContext, "activeExtensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeConversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_initWithState:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  MSConversation *v8;
  uint64_t v9;
  NSUUID *identifier;
  void *v11;
  uint64_t v12;
  NSUUID *localParticipantIdentifier;
  void *v14;
  uint64_t v15;
  NSArray *remoteParticipantIdentifiers;
  uint64_t v17;
  MSMessage *selectedMessage;
  uint64_t v19;
  NSString *conversationIdentifier;
  uint64_t v21;
  NSData *engramID;
  uint64_t v23;
  NSString *groupID;
  uint64_t v25;
  NSString *iMessageLoginID;
  uint64_t v27;
  NSString *senderAddress;
  uint64_t v29;
  NSArray *recipientAddresses;
  uint64_t v31;
  NSString *generatedSummary;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  MSConversationContextItem *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSArray *contextItems;
  void *v46;
  uint64_t v47;
  NSArray *draftAssetArchives;
  MSConversation *v50;
  id v51;
  id v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)MSConversation;
  v8 = -[MSConversation init](&v58, sel_init);
  if (v8)
  {
    v51 = v7;
    v52 = a4;
    objc_msgSend(v6, "conversationIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_msgSend(v6, "senderIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    localParticipantIdentifier = v8->_localParticipantIdentifier;
    v8->_localParticipantIdentifier = (NSUUID *)v12;

    objc_msgSend(v6, "recipientIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    remoteParticipantIdentifiers = v8->_remoteParticipantIdentifiers;
    v8->_remoteParticipantIdentifiers = (NSArray *)v15;

    objc_msgSend(v6, "activeMessage");
    v17 = objc_claimAutoreleasedReturnValue();
    selectedMessage = v8->_selectedMessage;
    v8->_selectedMessage = (MSMessage *)v17;

    objc_msgSend(v6, "conversationID");
    v19 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v8->_conversationIdentifier;
    v8->_conversationIdentifier = (NSString *)v19;

    objc_msgSend(v6, "conversationEngramID");
    v21 = objc_claimAutoreleasedReturnValue();
    engramID = v8->_engramID;
    v8->_engramID = (NSData *)v21;

    objc_msgSend(v6, "groupID");
    v23 = objc_claimAutoreleasedReturnValue();
    groupID = v8->_groupID;
    v8->_groupID = (NSString *)v23;

    objc_msgSend(v6, "iMessageLoginID");
    v25 = objc_claimAutoreleasedReturnValue();
    iMessageLoginID = v8->_iMessageLoginID;
    v8->_iMessageLoginID = (NSString *)v25;

    objc_msgSend(v6, "senderAddress");
    v27 = objc_claimAutoreleasedReturnValue();
    senderAddress = v8->_senderAddress;
    v8->_senderAddress = (NSString *)v27;

    objc_msgSend(v6, "recipientAddresses");
    v29 = objc_claimAutoreleasedReturnValue();
    recipientAddresses = v8->_recipientAddresses;
    v8->_recipientAddresses = (NSArray *)v29;

    objc_msgSend(v6, "generatedSummary");
    v31 = objc_claimAutoreleasedReturnValue();
    generatedSummary = v8->_generatedSummary;
    v50 = v8;
    v8->_generatedSummary = (NSString *)v31;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v6, "conversationContext");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v55 != v36)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v39 = objc_alloc_init(MSConversationContextItem);
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CKGenerativeContextTimestamp"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSConversationContextItem setTimestamp:](v39, "setTimestamp:", v40);

          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CKGenerativeContextText"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSConversationContextItem setMessageContent:](v39, "setMessageContent:", v41);

          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CKGenerativeContextHandle"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSConversationContextItem setSenderHandle:](v39, "setSenderHandle:", v42);

          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("CKGenerativeContextDisplayName"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSConversationContextItem setSenderDisplayName:](v39, "setSenderDisplayName:", v43);

          objc_msgSend(v33, "addObject:", v39);
        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v35);
    }

    v44 = objc_msgSend(v33, "copy");
    v8 = v50;
    contextItems = v50->_contextItems;
    v50->_contextItems = (NSArray *)v44;

    v50->_isiMessage = objc_msgSend(v6, "isiMessage");
    v50->_isBusiness = objc_msgSend(v6, "isBusiness");
    objc_msgSend(v6, "draftAssetArchives");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "copy");
    draftAssetArchives = v50->_draftAssetArchives;
    v50->_draftAssetArchives = (NSArray *)v47;

    objc_storeStrong((id *)&v50->_context, v52);
    v7 = v51;
  }

  return v8;
}

- (void)_updateWithState:(id)a3
{
  id v4;
  NSArray *remoteParticipantIdentifiers;
  void *v6;
  void *v7;
  MSMessage *selectedMessage;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  remoteParticipantIdentifiers = self->_remoteParticipantIdentifiers;
  v16 = v4;
  objc_msgSend(v4, "recipientIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(remoteParticipantIdentifiers) = -[NSArray isEqual:](remoteParticipantIdentifiers, "isEqual:", v6);

  if ((remoteParticipantIdentifiers & 1) == 0)
  {
    objc_msgSend(v16, "recipientIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSConversation setRemoteParticipantIdentifiers:](self, "setRemoteParticipantIdentifiers:", v7);

  }
  selectedMessage = self->_selectedMessage;
  if (!selectedMessage
    || (objc_msgSend(v16, "activeMessage"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[MSMessage isEqual:](selectedMessage, "isEqual:", v9),
        v9,
        !v10))
  {
    -[MSConversation delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_conversation:willSelectMessage:", self, v12);

    objc_msgSend(v16, "activeMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSConversation setSelectedMessage:](self, "setSelectedMessage:", v13);

    -[MSConversation delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_conversation:didSelectMessage:", self, v15);

  }
}

- (void)insertMessage:(MSMessage *)message completionHandler:(void *)completionHandler
{
  -[MSConversation _insertMessage:skipShelf:completionHandler:](self, "_insertMessage:skipShelf:completionHandler:", message, 0, completionHandler);
}

- (void)insertMessage:(id)a3 localizedChangeDescription:(id)a4 completionHandler:(id)a5
{
  -[MSConversation _insertMessage:localizedChangeDescription:skipShelf:completionHandler:](self, "_insertMessage:localizedChangeDescription:skipShelf:completionHandler:", a3, a4, 0, a5);
}

- (void)insertText:(NSString *)text completionHandler:(void *)completionHandler
{
  -[MSConversation _insertText:skipShelf:completionHandler:](self, "_insertText:skipShelf:completionHandler:", text, 0, completionHandler);
}

- (void)insertAttachment:(NSURL *)URL withAlternateFilename:(NSString *)filename completionHandler:(void *)completionHandler
{
  -[MSConversation _insertAttachment:withAlternateFilename:skipShelf:generativePlaygroundRecipe:completionHandler:](self, "_insertAttachment:withAlternateFilename:skipShelf:generativePlaygroundRecipe:completionHandler:", URL, filename, 0, 0, completionHandler);
}

- (void)insertRichLink:(id)a3 completionHandler:(id)a4
{
  -[MSConversation _insertRichLink:skipShelf:completionHandler:](self, "_insertRichLink:skipShelf:completionHandler:", a3, 0, a4);
}

- (void)insertSticker:(MSSticker *)sticker completionHandler:(void *)completionHandler
{
  -[MSConversation _insertSticker:skipShelf:completionHandler:](self, "_insertSticker:skipShelf:completionHandler:", sticker, 0, completionHandler);
}

- (void)insertSticker:(id)a3 withSourceFrame:(CGRect)a4 completionHandler:(id)a5
{
  -[MSConversation _insertSticker:skipShelf:frameInWindowCoordinates:completionHandler:](self, "_insertSticker:skipShelf:frameInWindowCoordinates:completionHandler:", a3, 0, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)sendMessage:(MSMessage *)message completionHandler:(void *)completionHandler
{
  -[MSConversation _insertMessage:skipShelf:completionHandler:](self, "_insertMessage:skipShelf:completionHandler:", message, 1, completionHandler);
}

- (void)sendMessage:(id)a3 localizedChangeDescription:(id)a4 completionHandler:(id)a5
{
  -[MSConversation _insertMessage:localizedChangeDescription:skipShelf:completionHandler:](self, "_insertMessage:localizedChangeDescription:skipShelf:completionHandler:", a3, a4, 1, a5);
}

- (void)sendText:(NSString *)text completionHandler:(void *)completionHandler
{
  -[MSConversation _insertText:skipShelf:completionHandler:](self, "_insertText:skipShelf:completionHandler:", text, 1, completionHandler);
}

- (void)sendAttachment:(NSURL *)URL withAlternateFilename:(NSString *)filename completionHandler:(void *)completionHandler
{
  -[MSConversation _insertAttachment:withAlternateFilename:skipShelf:generativePlaygroundRecipe:completionHandler:](self, "_insertAttachment:withAlternateFilename:skipShelf:generativePlaygroundRecipe:completionHandler:", URL, filename, 1, 0, completionHandler);
}

- (void)sendRichLink:(id)a3 completionHandler:(id)a4
{
  -[MSConversation _insertRichLink:skipShelf:completionHandler:](self, "_insertRichLink:skipShelf:completionHandler:", a3, 1, a4);
}

- (void)sendSticker:(MSSticker *)sticker completionHandler:(void *)completionHandler
{
  -[MSConversation _insertSticker:skipShelf:completionHandler:](self, "_insertSticker:skipShelf:completionHandler:", sticker, 1, completionHandler);
}

- (void)_insertMessage:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MSConversation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v8)
    v11 = v8;
  else
    v11 = &__block_literal_global_6;
  objc_msgSend(v10, "stageAppItem:skipShelf:completionHandler:", v9, v5, v11);

}

- (void)_insertMessage:(id)a3 localizedChangeDescription:(id)a4 skipShelf:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  objc_msgSend(v11, "setBreadcrumbText:", a4);
  -[MSConversation context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  if (v10)
    v13 = v10;
  else
    v13 = &__block_literal_global_14;
  objc_msgSend(v12, "stageAppItem:skipShelf:completionHandler:", v11, v6, v13);

}

- (void)_insertText:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _MSMessageMediaPayload *v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v13 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setText:](v13, "setText:", v9);

  -[MSConversation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    v12 = v8;
  else
    v12 = &__block_literal_global_16;
  objc_msgSend(v10, "stageMediaItem:skipShelf:forceStage:completionHandler:", v13, v5, 0, v12);

}

- (void)_insertAttachment:(id)a3 withAlternateFilename:(id)a4 skipShelf:(BOOL)a5 generativePlaygroundRecipe:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  _MSMessageMediaPayload *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a5;
  v23 = a3;
  v12 = a4;
  v13 = a7;
  v14 = a6;
  v15 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setMediaURL:](v15, "setMediaURL:", v23);
  if (!v12
    || (objc_msgSend(v12, "pathExtension"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "length"),
        v16,
        !v17))
  {
    objc_msgSend(v23, "standardizedURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v19;
  }
  -[_MSMessageMediaPayload setMediaFilename:](v15, "setMediaFilename:", v12);
  -[_MSMessageMediaPayload setGenerativePlaygroundRecipeData:](v15, "setGenerativePlaygroundRecipeData:", v14);

  -[MSConversation context](self, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v13)
    v22 = v13;
  else
    v22 = &__block_literal_global_17;
  objc_msgSend(v20, "stageMediaItem:skipShelf:forceStage:completionHandler:", v15, v9, 0, v22);

}

- (void)_insertRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MSConversation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v8)
    v11 = v8;
  else
    v11 = &__block_literal_global_18;
  objc_msgSend(v10, "stageRichLink:skipShelf:completionHandler:", v9, v5, v11);

}

- (void)_insertSticker:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _MSMessageMediaPayload *v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v13 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", v9);

  -[MSConversation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    v12 = v8;
  else
    v12 = &__block_literal_global_19;
  objc_msgSend(v10, "stageMediaItem:skipShelf:forceStage:completionHandler:", v13, v5, 0, v12);

}

- (void)_insertSticker:(id)a3 skipShelf:(BOOL)a4 frameInWindowCoordinates:(CGRect)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _MSMessageMediaPayload *v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  v13 = a6;
  v14 = a3;
  v18 = -[_MSMessageMediaPayload initWithSticker:]([_MSMessageMediaPayload alloc], "initWithSticker:", v14);

  -[_MSMessageMediaPayload setSourceFrame:](v18, "setSourceFrame:", x, y, width, height);
  -[MSConversation context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
    v17 = v13;
  else
    v17 = &__block_literal_global_20;
  objc_msgSend(v15, "stageMediaItem:skipShelf:forceStage:completionHandler:", v18, v10, 0, v17);

}

- (void)_insertAttachment:(id)a3 adamID:(id)a4 appName:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _MSMessageMediaPayload *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a4;
  v10 = a5;
  v11 = a6;
  v12 = a3;
  v13 = objc_alloc_init(_MSMessageMediaPayload);
  -[_MSMessageMediaPayload setMediaURL:](v13, "setMediaURL:", v12);

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v16 && (objc_msgSend(v16, "isEqualToNumber:", &unk_1EA2679A8) & 1) == 0)
    objc_msgSend(v14, "setValue:forKey:", v16, CFSTR("adam-id"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v14, "setValue:forKey:", v10, CFSTR("name"));
  if (objc_msgSend(v14, "count"))
    -[_MSMessageMediaPayload setAttributionInfo:](v13, "setAttributionInfo:", v14);
  -[MSConversation context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stageMediaItem:skipShelf:forceStage:completionHandler:", v13, 0, 0, v11);

}

- (void)_insertAssetArchive:(id)a3 completionHandler:(id)a4
{
  -[MSConversation _insertAssetArchive:skipShelf:completionHandler:](self, "_insertAssetArchive:skipShelf:completionHandler:", a3, 0, a4);
}

- (void)_sendAssetArchive:(id)a3 completionHandler:(id)a4
{
  -[MSConversation _insertAssetArchive:skipShelf:completionHandler:](self, "_insertAssetArchive:skipShelf:completionHandler:", a3, 1, a4);
}

- (void)_insertAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[MSConversation context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v8)
    v11 = v8;
  else
    v11 = &__block_literal_global_23;
  objc_msgSend(v10, "stageAssetArchive:skipShelf:completionHandler:", v9, v5, v11);

}

- (void)_removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MSConversation context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAssetArchiveWithIdentifier:completionHandler:", v7, v6);

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSData)engramID
{
  return self->_engramID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (MSMessage)selectedMessage
{
  return self->_selectedMessage;
}

- (void)setSelectedMessage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMessage, a3);
}

- (NSUUID)localParticipantIdentifier
{
  return self->_localParticipantIdentifier;
}

- (NSArray)remoteParticipantIdentifiers
{
  return self->_remoteParticipantIdentifiers;
}

- (void)setRemoteParticipantIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_remoteParticipantIdentifiers, a3);
}

- (_MSMessageAppContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSArray)draftAssetArchives
{
  return self->_draftAssetArchives;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (NSString)iMessageLoginID
{
  return self->_iMessageLoginID;
}

- (NSArray)recipientAddresses
{
  return self->_recipientAddresses;
}

- (NSString)generatedSummary
{
  return self->_generatedSummary;
}

- (NSArray)contextItems
{
  return self->_contextItems;
}

- (BOOL)isiMessage
{
  return self->_isiMessage;
}

- (BOOL)isBusiness
{
  return self->_isBusiness;
}

- (MSConversationDelegate)delegate
{
  return (MSConversationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextItems, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
  objc_storeStrong((id *)&self->_iMessageLoginID, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_draftAssetArchives, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_remoteParticipantIdentifiers, 0);
  objc_storeStrong((id *)&self->_localParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedMessage, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
