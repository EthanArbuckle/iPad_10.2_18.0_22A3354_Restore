@implementation CFXExportClipDataSource

- (CFXExportClipDataSource)initWithClip:(id)a3
{
  id v5;
  CFXExportClipDataSource *v6;
  CFXExportClipDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFXExportClipDataSource;
  v6 = -[CFXExportClipDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clip, a3);

  return v7;
}

- (CGSize)renderSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)frameSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int)duration
{
  void *v2;
  int v3;

  -[CFXExportClipDataSource clip](self, "clip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "duration");

  return v3;
}

- (int)frameRate
{
  void *v2;
  int v3;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frameRate");

  return v3;
}

- (int)timeScale
{
  void *v2;
  int v3;

  +[CFXMediaSettings sharedInstance](CFXMediaSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "timeScale");

  return v3;
}

- (BOOL)isExporting
{
  return 1;
}

- (int64_t)count
{
  return 1;
}

- (double)imageScale
{
  double result;

  +[CFXVideoSettings imageScale](CFXVideoSettings, "imageScale");
  return result;
}

- (BOOL)screenCanShow2160P
{
  return 0;
}

- (BOOL)use2160Pcontent:(BOOL)a3
{
  return 0;
}

- (id)colorSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[CFXExportClipDataSource clip](self, "clip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CFXClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clip, 0);
}

@end
