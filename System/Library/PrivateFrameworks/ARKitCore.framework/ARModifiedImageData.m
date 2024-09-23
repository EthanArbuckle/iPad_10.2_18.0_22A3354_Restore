@implementation ARModifiedImageData

- (ARModifiedImageData)initWithImageData:(id)a3
{
  id v4;
  ARModifiedImageData *v5;
  id v6;
  uint64_t v7;
  ARImageData *originalImage;
  void *v9;
  uint64_t v10;
  NSDictionary *metaData;
  ARImageData *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARModifiedImageData;
  v5 = -[ARImageData initWithImageData:](&v14, sel_initWithImageData_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      objc_msgSend(v6, "originalImage");
      v7 = objc_claimAutoreleasedReturnValue();
      originalImage = v5->_originalImage;
      v5->_originalImage = (ARImageData *)v7;

      objc_msgSend(v6, "metaData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      metaData = v5->_metaData;
      v5->_metaData = (NSDictionary *)v10;

    }
    else
    {
      v12 = (ARImageData *)v4;
      v9 = v5->_originalImage;
      v5->_originalImage = v12;
    }

    -[ARImageData setVisionData:](v5, "setVisionData:", 0);
  }

  return v5;
}

- (ARImageData)originalImage
{
  return self->_originalImage;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
}

@end
