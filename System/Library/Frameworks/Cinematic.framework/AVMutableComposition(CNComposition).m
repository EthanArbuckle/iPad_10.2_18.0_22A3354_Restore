@implementation AVMutableComposition(CNComposition)

- (id)addTracksForCinematicAssetInfo:()CNComposition preferredStartingTrackID:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  objc_msgSend(v6, "cinematicVideoTrack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addMutableTrackWithMediaType:preferredTrackID:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cinematicDisparityTrack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mediaType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a4)
    v12 = (a4 + 1);
  else
    v12 = 0;
  if ((_DWORD)a4)
    v13 = (a4 + 2);
  else
    v13 = 0;
  objc_msgSend(a1, "addMutableTrackWithMediaType:preferredTrackID:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cinematicMetadataTrack");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "mediaType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addMutableTrackWithMediaType:preferredTrackID:", v16, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[CNAssetInfo _initWithVideoTrack:disparityTrack:metadataTrack:]([CNCompositionInfo alloc], "_initWithVideoTrack:disparityTrack:metadataTrack:", v9, v14, v17);
  return v18;
}

@end
