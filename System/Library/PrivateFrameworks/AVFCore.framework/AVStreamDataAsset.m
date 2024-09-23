@implementation AVStreamDataAsset

- (AVStreamDataAsset)initWithParser:(id)a3 tracks:(id)a4
{
  AVStreamDataAsset *v6;
  AVStreamDataAsset *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVStreamDataAsset;
  v6 = -[AVAsset init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_weakReferenceToParser, a3);
    v7->_inspector = -[AVStreamDataAssetInspector initWithTrackIDs:]([AVStreamDataAssetInspector alloc], "initWithTrackIDs:", objc_msgSend(a4, "allKeys"));
    v7->_inspectorLoader = -[AVAssetSynchronousInspectorLoader initWithAssetInspector:]([AVAssetSynchronousInspectorLoader alloc], "initWithAssetInspector:", v7->_inspector);
    v7->_trackDictsByTrackID = (NSDictionary *)objc_msgSend(a4, "copy");
    v7->_tracksOnce = objc_alloc_init(AVDispatchOnce);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVStreamDataAsset;
  -[AVAsset dealloc](&v3, sel_dealloc);
}

- (id)parser
{
  return objc_loadWeak((id *)&self->_weakReferenceToParser);
}

- (id)copyAssetWithAdditionalTrackID:(int)a3 mediaType:(id)a4
{
  uint64_t v6;
  id v7;

  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  -[NSDictionary objectForKey:](self->_trackDictsByTrackID, "objectForKey:", v6);
  v7 = (id)-[NSDictionary mutableCopy](self->_trackDictsByTrackID, "mutableCopy");
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a4, CFSTR("mediaType"), 0), v6);
  return -[AVStreamDataAsset initWithParser:tracks:]([AVStreamDataAsset alloc], "initWithParser:tracks:", -[AVStreamDataAsset parser](self, "parser"), v7);
}

- (id)copyAssetWithReplacementFormatDescription:(opaqueCMFormatDescription *)a3 forTrackID:(int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v7 = (id)-[NSDictionary mutableCopy](self->_trackDictsByTrackID, "mutableCopy");
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v8), "mutableCopy");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setObject:forKey:", a3, CFSTR("formatDescription"));
    objc_msgSend(v7, "setObject:forKey:", v10, v8);
  }
  return -[AVStreamDataAsset initWithParser:tracks:]([AVStreamDataAsset alloc], "initWithParser:tracks:", -[AVStreamDataAsset parser](self, "parser"), v7);
}

- (id)copyAssetRemovingTrackID:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  v5 = (id)-[NSDictionary mutableCopy](self->_trackDictsByTrackID, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
  return -[AVStreamDataAsset initWithParser:tracks:]([AVStreamDataAsset alloc], "initWithParser:tracks:", -[AVStreamDataAsset parser](self, "parser"), v5);
}

- (id)mediaTypeForTrackID:(int)a3
{
  id result;

  result = -[NSDictionary objectForKey:](self->_trackDictsByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  if (result)
    return (id)objc_msgSend(result, "objectForKey:", CFSTR("mediaType"));
  return result;
}

- (id)formatDescriptionsForTrackID:(int)a3
{
  id result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  result = (id)objc_msgSend(-[NSDictionary objectForKey:](self->_trackDictsByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3)), "objectForKey:", CFSTR("formatDescription"));
  if (result)
  {
    v4[0] = result;
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  }
  return result;
}

- (id)tracks
{
  AVDispatchOnce *tracksOnce;
  _QWORD v5[5];

  tracksOnce = self->_tracksOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__AVStreamDataAsset_tracks__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](tracksOnce, "runBlockOnce:", v5);
  return self->_tracks;
}

id __27__AVStreamDataAsset_tracks__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", -[AVAssetTrack _initWithAsset:trackID:]([AVAssetTrack alloc], "_initWithAsset:trackID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "integerValue")));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return 0;
}

- (id)_assetInspector
{
  return self->_inspector;
}

- (id)_assetInspectorLoader
{
  return self->_inspectorLoader;
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakReferenceToParser);
}

@end
