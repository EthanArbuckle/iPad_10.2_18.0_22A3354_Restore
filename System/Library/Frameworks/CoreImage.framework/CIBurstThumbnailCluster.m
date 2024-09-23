@implementation CIBurstThumbnailCluster

- (CIBurstThumbnailCluster)init
{
  objc_super v4;

  self->burstImages = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  self->imageProps = 0;
  v4.receiver = self;
  v4.super_class = (Class)CIBurstThumbnailCluster;
  return -[CIBurstThumbnailCluster init](&v4, sel_init);
}

- (CIBurstThumbnailCluster)initWithImageData:(id)a3 dict:(id)a4 identifier:(id)a5 imageProps:(id)a6 completionBlock:(id)a7
{
  CIBurstThumbnailCluster *v12;
  CIBurstImageStat *v13;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  uint64_t v28;
  const __CFDictionary *v29;
  CMTime time;
  CMTime v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CIBurstThumbnailCluster;
  v12 = -[CIBurstThumbnailCluster init](&v33, sel_init);
  v12->burstImages = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  -[CIBurstThumbnailCluster setImageProps:](v12, "setImageProps:", a6);
  -[CIBurstThumbnailCluster setImage:](v12, "setImage:", a3);
  -[CIBurstThumbnailCluster setCompletionBlock:](v12, "setCompletionBlock:", a7);
  v13 = -[CIBurstImageStat initWithIdentifier:]([CIBurstImageStat alloc], "initWithIdentifier:", a5);
  BurstLoggingMessage("ThumbnailCluster - adding %s\n", (const char *)objc_msgSend(a5, "UTF8String"));
  if (!a4)
    goto LABEL_28;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v15 = objc_msgSend(a4, "objectForKey:", CFSTR("JpegData"));
  if (v15)
  {
    -[CIBurstThumbnailCluster setFullsizeJpegData:](v12, "setFullsizeJpegData:", v15);
    -[CIBurstImageStat setFullsizeJpegData:](v13, "setFullsizeJpegData:", -[CIBurstThumbnailCluster fullsizeJpegData](v12, "fullsizeJpegData"));
    -[CIBurstImageStat setFullsizeJpegSize:](v13, "setFullsizeJpegSize:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("JpegDataSize")), "intValue"));
  }
  if ((isKindOfClass & 1) == 0)
    goto LABEL_12;
  v16 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
  if (v16)
  {
    v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    -[CIBurstImageStat setOrientation:](v13, "setOrientation:", objc_msgSend(v17, "intValue"));
  }
  v18 = objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0CBCF70]);
  if (!v18)
  {
LABEL_28:
    BurstLoggingMessage("[CIBurstThumbnailCluster initWithImageData] : no error\n");
    goto LABEL_29;
  }
  v19 = (void *)v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("6"));
    if (v20)
      v21 = objc_msgSend(v20, "intValue");
    else
      v21 = 0;
    -[CIBurstImageStat setAEAverage:](v13, "setAEAverage:", v21);
    v22 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("5"));
    if (v22)
      v23 = objc_msgSend(v22, "intValue");
    else
      v23 = 0;
    -[CIBurstImageStat setAETarget:](v13, "setAETarget:", v23);
    v24 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("4"));
    if (v24)
      v25 = objc_msgSend(v24, "intValue") != 0;
    else
      v25 = 0;
    -[CIBurstImageStat setAEStable:](v13, "setAEStable:", v25);
    v26 = (void *)objc_msgSend(v19, "objectForKey:", CFSTR("7"));
    if (v26)
      v27 = objc_msgSend(v26, "intValue") != 0;
    else
      v27 = 0;
    -[CIBurstImageStat setAFStable:](v13, "setAFStable:", v27);
    v28 = objc_msgSend(v19, "objectForKey:", CFSTR("2"));
    if (!v28 || -[CIBurstImageStat setAEMatrix:](v13, "setAEMatrix:", v28))
      -[CIBurstImageStat computeAEMatrix:](v13, "computeAEMatrix:", a3);
    v29 = (const __CFDictionary *)objc_msgSend(v19, "objectForKey:", CFSTR("3"));
    if (v29)
    {
      memset(&v32, 0, sizeof(v32));
      CMTimeMakeFromDictionary(&v32, v29);
      time = v32;
      -[CIBurstImageStat setTimestamp:](v13, "setTimestamp:", CMTimeGetSeconds(&time));
    }
    goto LABEL_28;
  }
LABEL_12:
  BurstLoggingMessage("[CIBurstThumbnailCluster initWithImageData] : metadata parsing error\n");
LABEL_29:
  -[NSMutableArray addObject:](v12->burstImages, "addObject:", v13);

  return v12;
}

- (void)dealloc
{
  NSMutableArray *burstImages;
  objc_super v4;

  burstImages = self->burstImages;
  if (burstImages)
  {

    self->burstImages = 0;
  }
  -[CIBurstThumbnailCluster releaseImage](self, "releaseImage");
  v4.receiver = self;
  v4.super_class = (Class)CIBurstThumbnailCluster;
  -[CIBurstThumbnailCluster dealloc](&v4, sel_dealloc);
}

- (void)releaseImage
{
  CIBurstYUVImage *image;
  NSMutableDictionary *imageProps;

  image = self->image;
  if (image)
  {

    self->image = 0;
  }
  imageProps = self->imageProps;
  if (imageProps)
  {

    self->imageProps = 0;
  }
  if (-[CIBurstThumbnailCluster fullsizeJpegData](self, "fullsizeJpegData"))
  {
    CFRelease(-[CIBurstThumbnailCluster fullsizeJpegData](self, "fullsizeJpegData"));
    -[CIBurstThumbnailCluster setFullsizeJpegData:](self, "setFullsizeJpegData:", 0);
  }
}

- (void)addItemsFromCluster:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->burstImages, "addObjectsFromArray:", *((_QWORD *)a3 + 1));
}

- (float)computeMergeCost:(id)a3 :(int *)a4 :(int)a5
{
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  int v19;
  int v20;
  NSMutableArray *obj;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = -[NSMutableArray count](self->burstImages, "count");
  v24 = a3;
  v10 = -1.0;
  if ((float)((float)a5 / 1.5) >= (float)(unint64_t)(objc_msgSend(*((id *)a3 + 1), "count") + v9))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->burstImages;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v25)
    {
      v23 = *(_QWORD *)v31;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v13 = (void *)v24[1];
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v27 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                v19 = objc_msgSend(v12, "temporalOrder");
                v20 = objc_msgSend(v18, "temporalOrder") + v19 * a5;
                if (v10 < (float)a4[v20])
                  v10 = (float)a4[v20];
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v15);
          }
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v25);
    }
    else
    {
      return 0.0;
    }
  }
  return v10;
}

- (NSMutableArray)burstImages
{
  return self->burstImages;
}

- (void)setBurstImages:(id)a3
{
  self->burstImages = (NSMutableArray *)a3;
}

- (NSMutableDictionary)imageProps
{
  return self->imageProps;
}

- (void)setImageProps:(id)a3
{
  self->imageProps = (NSMutableDictionary *)a3;
}

- (CIBurstYUVImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
  self->image = (CIBurstYUVImage *)a3;
}

- (id)completionBlock
{
  return self->completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  self->completionBlock = a3;
}

- (__IOSurface)fullsizeJpegData
{
  return self->_fullsizeJpegData;
}

- (void)setFullsizeJpegData:(__IOSurface *)a3
{
  self->_fullsizeJpegData = a3;
}

@end
