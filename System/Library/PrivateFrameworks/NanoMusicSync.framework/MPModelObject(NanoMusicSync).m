@implementation MPModelObject(NanoMusicSync)

- (uint64_t)nms_prefersCatalogRepresentation
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "isLibraryAdded") ^ 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "isLibraryAdded") ^ 1;
  else
    return 0;
}

- (id)nms_syncInfoContainerIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v6;
  id v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "identifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nms_syncInfoPlaylistIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NMLogForCategory(5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[MPModelObject(NanoMusicSync) nms_syncInfoContainerIdentifier].cold.1((uint64_t)a1, v6);

      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Unsupported model type. Not allowed."), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
    objc_msgSend(a1, "identifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nms_syncInfoAlbumIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

- (id)nms_recommendationObject
{
  return objc_getAssociatedObject(a1, sel_nms_recommendationObject);
}

- (void)nms_setRecommendationObject:()NanoMusicSync
{
  objc_setAssociatedObject(a1, sel_nms_recommendationObject, a3, (void *)1);
}

+ (id)nms_modelObjectWithLibraryPersistentID:()NanoMusicSync
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDDC758];
  objc_msgSend(MEMORY[0x24BDDC8C0], "kindWithModelClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nms_identifierSetWithLibraryPersistentID:modelKind:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend([a1 alloc], "initWithIdentifiers:", v7);
  return v8;
}

+ (id)nms_modelObjectWithLibraryPersistentID:()NanoMusicSync block:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x24BDDC758];
  v7 = (void *)MEMORY[0x24BDDC8C0];
  v8 = a4;
  objc_msgSend(v7, "kindWithModelClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nms_identifierSetWithLibraryPersistentID:modelKind:", a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend([a1 alloc], "initWithIdentifiers:block:", v10, v8);
  return v11;
}

- (void)nms_syncInfoContainerIdentifier
{
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a1;
  _os_log_error_impl(&dword_216E27000, a2, OS_LOG_TYPE_ERROR, "Unsupported model type. Not allowed: %@. Model Object: %@", (uint8_t *)&v6, 0x16u);

}

@end
