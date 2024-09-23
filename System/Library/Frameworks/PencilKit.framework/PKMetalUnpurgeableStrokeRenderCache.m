@implementation PKMetalUnpurgeableStrokeRenderCache

- (PKMetalUnpurgeableStrokeRenderCache)initWithInk:(id)a3 renderZoomFactor:(int64_t)a4
{
  id v6;
  PKMetalUnpurgeableStrokeRenderCache *v7;
  uint64_t v8;
  NSMutableSet *lockedResourceSet;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  v7 = -[PKMetalStrokeRenderCache initWithInk:renderZoomFactor:](&v11, sel_initWithInk_renderZoomFactor_, v6, a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    lockedResourceSet = v7->_lockedResourceSet;
    v7->_lockedResourceSet = (NSMutableSet *)v8;

  }
  return v7;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_lockedResourceSet;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "unlock");
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  -[PKMetalUnpurgeableStrokeRenderCache dealloc](&v7, sel_dealloc);
}

- (void)addBuffer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:]((uint64_t)v4, self->_lockedResourceSet);
  v5.receiver = self;
  v5.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  -[PKMetalStrokeRenderCache addBuffer:](&v5, sel_addBuffer_, v4);

}

- (void)addSecondaryBuffer:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PKMetalStrokeRenderCacheBuffer lockPurgeableResourcesAddToSet:]((uint64_t)v4, self->_lockedResourceSet);
  v5.receiver = self;
  v5.super_class = (Class)PKMetalUnpurgeableStrokeRenderCache;
  -[PKMetalStrokeRenderCache addSecondaryBuffer:](&v5, sel_addSecondaryBuffer_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedResourceSet, 0);
}

@end
