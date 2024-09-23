@implementation AVPlayerItemPhotosensitivityMetadataHandler

- (AVPlayerItemPhotosensitivityMetadataHandler)initWithPlayerItem:(id)a3
{
  id v4;
  AVPlayerItemPhotosensitivityMetadataHandler *v5;
  AVPlayerItemPhotosensitivityMetadataHandler *v6;
  id v7;
  void *v8;
  uint64_t v9;
  AVPlayerItemMetadataCollector *metadataCollector;
  id WeakRetained;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVPlayerItemPhotosensitivityMetadataHandler;
  v5 = -[AVPlayerItemPhotosensitivityMetadataHandler init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    v7 = objc_alloc(MEMORY[0x1E0C8B310]);
    v14[0] = CFSTR("com.apple.accessibility.video.strobing.general-flash");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithIdentifiers:classifyingLabels:", 0, v8);
    metadataCollector = v6->_metadataCollector;
    v6->_metadataCollector = (AVPlayerItemMetadataCollector *)v9;

    -[AVPlayerItemMetadataCollector setDelegate:queue:](v6->_metadataCollector, "setDelegate:queue:", v6, MEMORY[0x1E0C80D38]);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_item);
    objc_msgSend(WeakRetained, "addMediaDataCollector:", v6->_metadataCollector);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(WeakRetained, "removeMediaDataCollector:", self->_metadataCollector);

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemPhotosensitivityMetadataHandler;
  -[AVPlayerItemPhotosensitivityMetadataHandler dealloc](&v4, sel_dealloc);
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;

  -[AVPlayerItemPhotosensitivityMetadataHandler setPhotosensitivityRegions:](self, "setPhotosensitivityRegions:", a4);
  v7 = (void *)MEMORY[0x1E0CB37C0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  objc_msgSend(v7, "notificationWithName:object:userInfo:", CFSTR("AVPlayerItemPhotosensitiveRegionsChangedNotification"), WeakRetained, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotification:", v10);

}

- (NSArray)photosensitivityRegions
{
  return self->_photosensitivityRegions;
}

- (void)setPhotosensitivityRegions:(id)a3
{
  objc_storeStrong((id *)&self->_photosensitivityRegions, a3);
}

- (AVPlayerItemMediaDataCollector)metadataCollector
{
  return &self->_metadataCollector->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosensitivityRegions, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_metadataCollector, 0);
}

@end
