@implementation CLKMediaAsset

- (CLKMediaAsset)initWithImage:(id)a3 forDevice:(id)a4
{
  id v7;
  id v8;
  CLKMediaAsset *v9;
  CLKMediaAsset *v10;
  CLKMediaAsset *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKMediaAsset;
  v9 = -[CLKMediaAsset init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a4);
    objc_storeStrong((id *)&v10->_image, a3);
    v11 = v10;
  }

  return v10;
}

- (CLKMediaAsset)initWithVideo:(id)a3 image:(id)a4 forDevice:(id)a5
{
  id v9;
  id v10;
  id v11;
  CLKMediaAsset *v12;
  CLKMediaAsset *v13;
  CLKMediaAsset *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKMediaAsset;
  v12 = -[CLKMediaAsset init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a5);
    objc_storeStrong((id *)&v13->_video, a3);
    objc_storeStrong((id *)&v13->_image, a4);
    v14 = v13;
  }

  return v13;
}

- (CLKMediaAsset)initWithVideo:(id)a3 image:(id)a4 videoDuration:(double)a5 stillDisplayTime:(double)a6 forDevice:(id)a7
{
  id v13;
  id v14;
  id v15;
  CLKMediaAsset *v16;
  CLKMediaAsset *v17;
  CLKMediaAsset *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CLKMediaAsset;
  v16 = -[CLKMediaAsset init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_device, a7);
    objc_storeStrong((id *)&v17->_video, a3);
    objc_storeStrong((id *)&v17->_image, a4);
    v17->_videoDuration = a5;
    v17->_stillDisplayTime = a6;
    v18 = v17;
  }

  return v17;
}

+ (id)mediaAssetWithImage:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  CLKMediaAsset *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CLKMediaAsset initWithImage:forDevice:]([CLKMediaAsset alloc], "initWithImage:forDevice:", v6, v5);

  return v7;
}

+ (id)mediaAssetWithVideo:(id)a3 image:(id)a4 forDevice:(id)a5
{
  id v7;
  id v8;
  id v9;
  CLKMediaAsset *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CLKMediaAsset initWithVideo:image:forDevice:]([CLKMediaAsset alloc], "initWithVideo:image:forDevice:", v9, v8, v7);

  return v10;
}

+ (id)mediaAssetWithVideo:(id)a3 image:(id)a4 videoDuration:(double)a5 stillDisplayTime:(double)a6 forDevice:(id)a7
{
  id v11;
  id v12;
  id v13;
  CLKMediaAsset *v14;

  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = -[CLKMediaAsset initWithVideo:image:videoDuration:stillDisplayTime:forDevice:]([CLKMediaAsset alloc], "initWithVideo:image:videoDuration:stillDisplayTime:forDevice:", v13, v12, v11, a5, a6);

  return v14;
}

+ (id)mediaAssetWithVideoAndImageNamed:(id)a3 forDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CLKMediaAsset *v12;

  v5 = a3;
  v6 = a4;
  +[CLKVideo videoNamed:forDevice:](CLKVideo, "videoNamed:forDevice:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v6, "sizeClass"))
      v8 = CFSTR("-regular@2x.png");
    else
      v8 = CFSTR("-compact@2x.png");
    objc_msgSend(v5, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = -[CLKMediaAsset initWithVideo:image:forDevice:]([CLKMediaAsset alloc], "initWithVideo:image:forDevice:", v7, v10, v6);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVideo:image:forDevice:", self->_video, self->_image, self->_device);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> _video = %@, _image = %@, _vdt = %g, _sdt = %g>"), objc_opt_class(), self, self->_video, self->_image, *(_QWORD *)&self->_videoDuration, *(_QWORD *)&self->_stillDisplayTime);
}

- (CLKVideo)video
{
  return self->_video;
}

- (UIImage)image
{
  return self->_image;
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (double)stillDisplayTime
{
  return self->_stillDisplayTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
