@implementation AVTAvatarStore

- (AVTAvatarStore)initWithPersistenceAvatarStore:(id)a3 imageGenerator:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTImageStore *v11;
  void *v12;
  void *v13;
  AVTImageStore *v14;
  AVTAvatarStore *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [AVTImageStore alloc];
  objc_msgSend(v8, "coreEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stickerImageStoreLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[AVTImageStore initWithEnvironment:validateImages:location:](v11, "initWithEnvironment:validateImages:location:", v12, 0, v13);

  v15 = -[AVTAvatarStore initWithPersistenceAvatarStore:imageGenerator:imageStore:environment:](self, "initWithPersistenceAvatarStore:imageGenerator:imageStore:environment:", v10, v9, v14, v8);
  return v15;
}

- (AVTAvatarStore)persistenceAvatarStore
{
  return self->_persistenceAvatarStore;
}

- (BOOL)canCreateAvatar
{
  void *v2;
  char v3;

  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canCreateAvatar");

  return v3;
}

- (AVTAvatarStore)init
{
  id v3;
  AVTAvatarStore *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D00878]);
  v4 = -[AVTAvatarStore initWithPersistenceAvatarStore:](self, "initWithPersistenceAvatarStore:", v3);

  return v4;
}

+ (id)defaultImageGeneratorForEnvironment:(id)a3
{
  id v3;
  AVTImageStore *v4;
  void *v5;
  void *v6;
  AVTImageStore *v7;
  void *v8;
  AVTAvatarRecordImageGenerator *v9;

  v3 = a3;
  v4 = [AVTImageStore alloc];
  objc_msgSend(v3, "coreEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageStoreLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTImageStore initWithEnvironment:validateImages:location:](v4, "initWithEnvironment:validateImages:location:", v5, 1, v6);

  objc_msgSend(v3, "renderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AVTAvatarRecordImageGenerator initWithImageStore:renderer:environment:]([AVTAvatarRecordImageGenerator alloc], "initWithImageStore:renderer:environment:", v7, v8, v3);

  return v9;
}

+ (unint64_t)maximumNumberOfSavableAvatars
{
  return objc_msgSend(MEMORY[0x1E0D00878], "maximumNumberOfSavableAvatars");
}

+ (unint64_t)maximumNumberOfFetchableAvatars
{
  return objc_msgSend(MEMORY[0x1E0D00878], "maximumNumberOfFetchableAvatars");
}

- (AVTAvatarStore)initWithImageGenerator:(id)a3 environment:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  AVTAvatarStore *v10;

  v6 = (objc_class *)MEMORY[0x1E0D00878];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[AVTAvatarStore initWithPersistenceAvatarStore:imageGenerator:environment:](self, "initWithPersistenceAvatarStore:imageGenerator:environment:", v9, v8, v7);

  return v10;
}

- (AVTAvatarStore)initWithPersistenceAvatarStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AVTAvatarStore *v7;

  v4 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultImageGeneratorForEnvironment:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVTAvatarStore initWithPersistenceAvatarStore:imageGenerator:environment:](self, "initWithPersistenceAvatarStore:imageGenerator:environment:", v4, v6, v5);

  return v7;
}

- (AVTAvatarStore)initWithPersistenceAvatarStore:(id)a3 imageGenerator:(id)a4 imageStore:(id)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AVTAvatarStore *v15;
  uint64_t v16;
  AVTUILogger *logger;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarStore;
  v15 = -[AVTAvatarStore init](&v19, sel_init);
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v11, "setImageHandlingDelegate:", v15);
    objc_storeStrong((id *)&v15->_persistenceAvatarStore, a3);
    objc_storeStrong((id *)&v15->_imageGenerator, a4);
    objc_storeStrong((id *)&v15->_imageStore, a5);
    objc_msgSend(v14, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    logger = v15->_logger;
    v15->_logger = (AVTUILogger *)v16;

  }
  return v15;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  void *v4;

  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "canCreateAvatarWithError:", a3);

  return (char)a3;
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "avatarsForFetchRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)fetchAvatarsForFetchRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAvatarsForFetchRequest:completionHandler:", v7, v6);

}

- (void)saveAvatarRecord:(id)a3 thumbnailAvatar:(id)a4 completionBlock:(id)a5 thumbnailGenerationCompletionBlock:(id)a6
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
  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saveAvatarRecord:thumbnailAvatar:completionBlock:thumbnailGenerationCompletionBlock:", v13, v12, v11, v10);

}

- (void)deleteAvatar:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAvatar:completionHandler:", v7, v6);

}

- (void)duplicateAvatar:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duplicateAvatar:completionBlock:", v7, v6);

}

- (void)deleteAvatarWithIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarStore persistenceAvatarStore](self, "persistenceAvatarStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteAvatarWithIdentifier:completionBlock:", v7, v6);

}

- (void)clearContentAtLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarStore logger](self, "logger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AVTImageStore clearContentAtLocation:logger:](AVTImageStore, "clearContentAtLocation:logger:", v4, v5);

}

- (BOOL)generateThumbnailsForAvatarRecord:(id)a3 avatar:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[AVTAvatarStore imageGenerator](self, "imageGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "generateThumbnailsForAvatarRecord:avatar:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)generateThumbnailsForAvatarRecords:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[AVTAvatarStore imageGenerator](self, "imageGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "generateThumbnailsForAvatarRecords:error:", v6, a4);

  return (char)a4;
}

- (BOOL)generateThumbnailsForDuplicateAvatarRecord:(id)a3 originalRecord:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[AVTAvatarStore imageGenerator](self, "imageGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "generateThumbnailsForDuplicateAvatarRecord:originalRecord:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)deleteThumbnailsForAvatarRecordsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[AVTAvatarStore imageGenerator](self, "imageGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "deleteThumbnailsForAvatarRecordsWithIdentifiers:error:", v6, a4);

  return (char)a4;
}

- (void)clearStickersForAvatarRecordIdentifier:(id)a3 withEnvironment:(id)a4
{
  +[AVTUIStickerRenderer clearStickersForAvatarRecordIdentifier:withEnvironment:](AVTUIStickerRenderer, "clearStickersForAvatarRecordIdentifier:withEnvironment:", a3, a4);
}

- (void)deleteImagesForAvatarRecordIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  +[AVTAvatarRecordCacheableResource persistentIdentifierPrefixForRecordWithIdentifier:](AVTAvatarRecordCacheableResource, "persistentIdentifierPrefixForRecordWithIdentifier:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarStore imageStore](self, "imageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteImagesForItemsWithPersistentIdentifierPrefix:error:", v6, 0);

}

- (void)updateThumbnailsForChangesWithTracker:(id)a3 recordProvider:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarStore imageGenerator](self, "imageGenerator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateThumbnailsForChangesWithTracker:recordProvider:", v7, v6);

}

- (void)setStickerBackendDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarStore internalStore](self, "internalStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStickerBackendDelegate:", v4);

}

- (AVTStickerBackendDelegate)stickerBackendDelegate
{
  void *v2;
  void *v3;

  -[AVTAvatarStore internalStore](self, "internalStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stickerBackendDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTStickerBackendDelegate *)v3;
}

- (id)recentStickersForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[AVTAvatarStore internalStore](self, "internalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recentStickersForFetchRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didUseStickerWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTAvatarStore internalStore](self, "internalStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUseStickerWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, v9, v8);

}

- (void)deleteRecentStickersWithAvatarIdentifier:(id)a3 stickerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[AVTAvatarStore internalStore](self, "internalStore");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteRecentStickersWithAvatarIdentifier:stickerIdentifier:completionHandler:", v10, v9, v8);

}

- (void)deleteRecentStickersForChangeTracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarStore internalStore](self, "internalStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteRecentStickersForChangeTracker:completionHandler:", v7, v6);

}

- (AVTAvatarRecordImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (AVTImageStore)imageStore
{
  return self->_imageStore;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setInternalStore:(id)a3
{
  objc_storeWeak((id *)&self->_internalStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalStore);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_persistenceAvatarStore, 0);
  objc_storeStrong((id *)&self->_imageGenerator, 0);
}

@end
