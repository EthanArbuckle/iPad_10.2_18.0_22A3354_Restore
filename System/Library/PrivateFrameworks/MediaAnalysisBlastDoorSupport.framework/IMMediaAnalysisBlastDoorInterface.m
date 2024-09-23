@implementation IMMediaAnalysisBlastDoorInterface

- (IMMediaAnalysisBlastDoorInterface)init
{
  IMMediaAnalysisBlastDoorInterface *v2;
  IMMediaAnalysisBlastDoorInterfaceInternal *v3;
  IMMediaAnalysisBlastDoorInterfaceInternal *interface;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)IMMediaAnalysisBlastDoorInterface;
  v2 = -[IMMediaAnalysisBlastDoorInterface init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMMediaAnalysisBlastDoorInterfaceInternal);
    interface = v2->_interface;
    v2->_interface = v3;

  }
  return v2;
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v10 = a3;
  -[IMMediaAnalysisBlastDoorInterface interface](self, "interface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a4;
  *(float *)&v13 = a5;
  objc_msgSend(v11, "generateImagePreviewForFileURL:maxPixelDimension:scale:error:", v10, a6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  -[IMMediaAnalysisBlastDoorInterface interface](self, "interface");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a4;
  *(float *)&v16 = a6;
  objc_msgSend(v17, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", v14, v13, v15, width, height, v16);

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
  -[IMMediaAnalysisBlastDoorInterface interface](self, "interface");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = a9;
  objc_msgSend(v20, "generateMovieFramesForAttachmentWithFileURL:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:", v18, a4, a5, a6, v11, a8, v19, v17);

}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMMediaAnalysisBlastDoorInterface interface](self, "interface");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateMetadataforAttachmentWithfileURL:resultHandler:", v7, v6);

}

- (IMMediaAnalysisBlastDoorInterfaceInternal)interface
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
