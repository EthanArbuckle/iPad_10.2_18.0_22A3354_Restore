@implementation IMMessagesBlastDoorInterface

- (IMMessagesBlastDoorInterface)init
{
  IMMessagesBlastDoorInterface *v2;
  IMMessagesBlastDoorInterfaceInternal *v3;
  uint64_t v4;
  IMMessagesBlastDoorInterfaceInternal *interface;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)IMMessagesBlastDoorInterface;
  v2 = -[IMMessagesBlastDoorInterface init](&v7, sel_init);
  if (v2)
  {
    v3 = [IMMessagesBlastDoorInterfaceInternal alloc];
    v4 = -[IMMessagesBlastDoorInterfaceInternal initWithBlastDoorInstanceType:](v3, "initWithBlastDoorInstanceType:", *MEMORY[0x1E0D032D8]);
    interface = v2->_interface;
    v2->_interface = (IMMessagesBlastDoorInterfaceInternal *)v4;

  }
  return v2;
}

- (IMMessagesBlastDoorInterface)initWithBlastDoorInstanceType:(id)a3
{
  id v4;
  IMMessagesBlastDoorInterface *v5;
  IMMessagesBlastDoorInterfaceInternal *v6;
  IMMessagesBlastDoorInterfaceInternal *interface;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMMessagesBlastDoorInterface;
  v5 = -[IMMessagesBlastDoorInterface init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMMessagesBlastDoorInterfaceInternal initWithBlastDoorInstanceType:]([IMMessagesBlastDoorInterfaceInternal alloc], "initWithBlastDoorInstanceType:", v4);
    interface = v5->_interface;
    v5->_interface = v6;

  }
  return v5;
}

+ (BOOL)supportsFeature:(id)a3
{
  return +[IMMessagesBlastDoorInterfaceInternal supportsFeature:](IMMessagesBlastDoorInterfaceInternal, "supportsFeature:", a3);
}

- (id)defuseTopLevelDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseTopLevelDictionary:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)defuseTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__IMMessagesBlastDoorInterface_defuseTopLevelDictionary_resultHandler___block_invoke;
  v10[3] = &unk_1E78B32A0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "defuseTopLevelDictionary:resultHandler:", v7, v10);

}

uint64_t __71__IMMessagesBlastDoorInterface_defuseTopLevelDictionary_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)decontaminateTopLevelDictionary:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__IMMessagesBlastDoorInterface_decontaminateTopLevelDictionary_resultHandler___block_invoke;
  v10[3] = &unk_1E78B32A0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "decontaminateTopLevelDictionary:resultHandler:", v7, v10);

}

uint64_t __78__IMMessagesBlastDoorInterface_decontaminateTopLevelDictionary_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)defuseSMSDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseSMSDictionary:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)defuseSMSDictionary:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defuseSMSDictionary:resultHandler:", v7, v6);

}

- (id)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defuseBalloonPluginPayload:withIdentifier:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)defuseBalloonPluginPayload:(id)a3 withIdentifier:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defuseBalloonPluginPayload:withIdentifier:resultHandler:", v10, v9, v8);

}

- (void)defuseData:(id)a3 forPreviewType:(unsigned __int8)a4 resultHandler:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defuseData:forPreviewType:resultHandler:", v9, v5, v8);

}

- (id)generatePreviewforAttachmentWithfileURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generatePreviewforAttachmentWithfileURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatePreviewforAttachmentWithfileURL:resultHandler:", v7, v6);

}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v10 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  objc_msgSend(v11, "generateImagePreviewForFileURL:maxPixelDimension:scale:error:", v10, a6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)generatePreviewforAttachmentWithfileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;

  v10 = a6;
  v11 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  objc_msgSend(v14, "generatePreviewforAttachmentWithfileURL:maxPixelDimension:scale:resultHandler:", v11, v10, v12, v13);

}

- (void)generatePreviewForMultiFrameImageWithFileURL:(id)a3 destinationFileURL:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 maxFrameCount:(int64_t)a7 isSticker:(BOOL)a8 resultHandler:(id)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;

  v9 = a8;
  v16 = a9;
  v17 = a4;
  v18 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v19 = a5;
  *(float *)&v20 = a6;
  objc_msgSend(v21, "generatePreviewForMultiFrameImageWithFileURL:destinationFileURL:maxPixelDimension:scale:maxFrameCount:isSticker:resultHandler:", v18, v17, a7, v9, v16, v19, v20);

}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;

  height = a5.height;
  width = a5.width;
  v13 = a7;
  v14 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a4;
  *(float *)&v16 = a6;
  objc_msgSend(v17, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", v14, v13, v15, width, height, v16);

}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 frameInterval:(int)a7 resultHandler:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;

  height = a5.height;
  width = a5.width;
  v15 = a8;
  v16 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v17 = a4;
  *(float *)&v18 = a6;
  objc_msgSend(v19, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:frameInterval:resultHandler:", v16, a7, v15, v17, width, height, v18);

}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  _BOOL8 v11;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v11 = a7;
  v17 = a10;
  v18 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = a9;
  objc_msgSend(v20, "generateMovieFramesForAttachmentWithFileURL:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:", v18, a4, a5, a6, v11, a8, v19, v17);

}

- (void)generateWorkoutPreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;

  v10 = a6;
  v11 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  objc_msgSend(v14, "generateWorkoutPreviewForAttachmentWithFileURL:maxPixelDimension:scale:resultHandler:", v11, v10, v12, v13);

}

- (void)generatePreviewforAudioMessageWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatePreviewforAudioMessageWithfileURL:resultHandler:", v7, v6);

}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "defuseNicknameDictionary:withKey:recordTag:resultHandler:", v13, v12, v11, v10);

}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 resultHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "defuseNicknameDictionary:withKey:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:resultHandler:", v22, v21, v20, v19, v18, v17, v16);

}

- (void)defuseNicknameDictionary:(id)a3 withKey:(id)a4 recordTag:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 processImageFields:(BOOL)a9 resultHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v17 = a10;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = a9;
  objc_msgSend(v25, "defuseNicknameDictionary:withKey:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:processImageFields:resultHandler:", v23, v22, v21, v20, v19, v18, v24, v17);

}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateMetadataforAttachmentWithfileURL:resultHandler:", v7, v6);

}

- (void)getMetadataForEmojiImageWithFileURL:(id)a3 maxStrikeCount:(int64_t)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getMetadataForEmojiImageWithFileURL:maxStrikeCount:resultHandler:", v9, a4, v8);

}

- (void)generatePreviewForEmojiImageWithFileURL:(id)a3 frameIndex:(int64_t)a4 maxPixelDimension:(double)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  double v12;
  id v13;

  v10 = a6;
  v11 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a5;
  objc_msgSend(v13, "generatePreviewForEmojiImageWithFileURL:frameIndex:maxPixelDimension:resultHandler:", v11, a4, v10, v12);

}

- (void)getMetadataforAnimatedImageWithfileURL:(id)a3 maxCount:(int64_t)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getMetadataforAnimatedImageWithfileURL:maxCount:resultHandler:", v9, a4, v8);

}

- (void)generatePreviewforAnimatedImageWithfileURL:(id)a3 maxPixelDimension:(float)a4 index:(int64_t)a5 maxCount:(int64_t)a6 resultHandler:(id)a7
{
  id v12;
  id v13;
  double v14;
  id v15;

  v12 = a7;
  v13 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = a4;
  objc_msgSend(v15, "generatePreviewforAnimatedImageWithfileURL:maxPixelDimension:index:maxCount:resultHandler:", v13, a5, a6, v12, v14);

}

- (void)defuseCollaborationNoticePayload:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defuseCollaborationNoticePayload:resultHandler:", v7, v6);

}

- (void)defuseCollaborationNoticeActionDictionary:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defuseCollaborationNoticeActionDictionary:resultHandler:", v7, v6);

}

- (void)defuseCollaborationClearNoticePayload:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "defuseCollaborationClearNoticePayload:resultHandler:", v7, v6);

}

- (id)defuseLiteTextMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseLiteTextMessage:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defuseSatelliteSMSTextMessageDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseSatelliteSMSTextMessageDictionary:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defuseChatBotCSS:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseChatBotCSS:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defuseRelayGroupMutationPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseRelayGroupMutationPayloadForData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defuseRelayReachabilityRequestPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseRelayReachabilityRequestPayloadForData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)defuseRelayReachabilityResponsePayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[IMMessagesBlastDoorInterface interface](self, "interface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defuseRelayReachabilityResponsePayloadForData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (IMMessagesBlastDoorInterfaceInternal)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
}

@end
