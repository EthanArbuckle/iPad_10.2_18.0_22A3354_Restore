@implementation UIView(MPArtworkCatalog)

- (void)clearArtworkCatalogs
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  void *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "artworkCatalog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_clearDestination");
    objc_setAssociatedObject(a1, (const void *)_MPArtworkCatalogLastAssociatedObjectKey, v3, (void *)1);
    objc_setAssociatedObject(a1, (const void *)MPArtworkCatalogAssociatedObjectKey, 0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__UIView_MPArtworkCatalog__clearArtworkCatalogs__block_invoke;
    block[3] = &unk_1E31635F8;
    v14 = v3;
    v15 = a1;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "clearArtworkCatalogs");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v16, 16);
    }
    while (v6);
  }

}

- (id)artworkCatalog
{
  return objc_getAssociatedObject(a1, (const void *)MPArtworkCatalogAssociatedObjectKey);
}

@end
