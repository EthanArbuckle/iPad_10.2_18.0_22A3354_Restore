@implementation NTKVideoPlayerListing

+ (id)listingForDevice:(id)a3 withURL:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NTKVideoPlayerListing initForDevice:withURL:]([NTKVideoPlayerListing alloc], "initForDevice:withURL:", v6, v5);

  return v7;
}

+ (id)listingForDevice:(id)a3 withFilename:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NTKVideoPlayerListing initForDevice:withFilename:]([NTKVideoPlayerListing alloc], "initForDevice:withFilename:", v6, v5);

  return v7;
}

+ (id)listingForDevice:(id)a3 withFilename:(id)a4 andColor:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[NTKVideoPlayerListing initForDevice:withFilename:]([NTKVideoPlayerListing alloc], "initForDevice:withFilename:", v9, v8);

  objc_msgSend(v10, "setColor:", v7);
  return v10;
}

- (id)initForDevice:(id)a3 withFilename:(id)a4
{
  id v7;
  id v8;
  NTKVideoPlayerListing *v9;
  NTKVideoPlayerListing *v10;
  NSArray *attributes;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKVideoPlayerListing;
  v9 = -[NTKVideoPlayerListing init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    attributes = v9->_attributes;
    v9->_attributes = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_storeStrong((id *)&v10->_device, a3);
    v10->_endBehavior = 0;
    objc_storeStrong((id *)&v10->_filename, a4);
  }

  return v10;
}

- (id)initForDevice:(id)a3 withURL:(id)a4
{
  id v7;
  id v8;
  NTKVideoPlayerListing *v9;
  NTKVideoPlayerListing *v10;
  NSArray *attributes;
  uint64_t v12;
  NSString *filename;
  uint64_t v14;
  CLKVideo *video;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NTKVideoPlayerListing;
  v9 = -[NTKVideoPlayerListing init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    attributes = v9->_attributes;
    v9->_attributes = (NSArray *)MEMORY[0x1E0C9AA60];

    v10->_endBehavior = 0;
    objc_storeStrong((id *)&v10->_url, a4);
    -[NSURL lastPathComponent](v10->_url, "lastPathComponent");
    v12 = objc_claimAutoreleasedReturnValue();
    filename = v10->_filename;
    v10->_filename = (NSString *)v12;

    objc_storeStrong((id *)&v10->_device, a3);
    objc_msgSend(MEMORY[0x1E0C94568], "videoAtURL:forDevice:", v10->_url, v10->_device);
    v14 = objc_claimAutoreleasedReturnValue();
    video = v10->_video;
    v10->_video = (CLKVideo *)v14;

  }
  return v10;
}

- (CLKVideo)video
{
  CLKVideo *video;
  void *v4;
  NSString *filename;
  CLKDevice *device;
  void *v7;
  CLKVideo *v8;
  CLKVideo *v9;

  video = self->_video;
  if (!video)
  {
    v4 = (void *)MEMORY[0x1E0C94568];
    filename = self->_filename;
    device = self->_device;
    NTKAssetsBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoNamed:forDevice:inBundle:", filename, device, v7);
    v8 = (CLKVideo *)objc_claimAutoreleasedReturnValue();
    v9 = self->_video;
    self->_video = v8;

    video = self->_video;
  }
  return video;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForDevice:withFilename:", self->_device, self->_filename);
}

- (BOOL)snapshotDiffers:(id)a3
{
  _QWORD *v4;
  _BOOL4 v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = !-[NSString isEqualToString:](self->_filename, "isEqualToString:", v4[3]);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)discardAssets
{
  CLKVideo *video;

  video = self->_video;
  self->_video = 0;

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), self->_filename);
}

- (NSString)debugDescription
{
  void *v2;
  NSString *filename;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  filename = self->_filename;
  -[CLKVideo url](self->_video, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("filename: '%@' url: '%@'"), filename, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (unint64_t)endBehavior
{
  return self->_endBehavior;
}

- (void)setEndBehavior:(unint64_t)a3
{
  self->_endBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
