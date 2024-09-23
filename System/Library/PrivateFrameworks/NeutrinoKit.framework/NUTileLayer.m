@implementation NUTileLayer

- (NUTileLayer)initWithImage:(id)a3 tile:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  id v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NUTileLayer;
  v8 = -[NUTileLayer init](&v18, sel_init);
  v9 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v6;
  v10 = v6;

  if (v7)
  {
    objc_msgSend(v7, "frameRect");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  v11 = v17;
  *(_OWORD *)(v8 + 40) = v16;
  *(_OWORD *)(v8 + 56) = v11;
  v12 = (void *)*((_QWORD *)v8 + 4);
  v13 = *(_OWORD *)(v8 + 56);
  v16 = *(_OWORD *)(v8 + 40);
  v17 = v13;
  objc_msgSend(MEMORY[0x24BE6C3F0], "regionWithRect:", &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginAccessRegion:", v14);

  return (NUTileLayer *)v8;
}

- (void)dealloc
{
  NUPurgeableSurfaceImage *image;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  void *v5;
  objc_super v6;
  _OWORD v7[2];

  image = self->_image;
  size = self->_imageRect.size;
  v7[0] = self->_imageRect.origin;
  v7[1] = size;
  objc_msgSend(MEMORY[0x24BE6C3F0], "regionWithRect:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUPurgeableSurfaceImage endAccessRegion:](image, "endAccessRegion:", v5);

  v6.receiver = self;
  v6.super_class = (Class)NUTileLayer;
  -[NUTileLayer dealloc](&v6, sel_dealloc);
}

- ($21C794F2A23EEFF9903A5FA3949B7063)imageRect
{
  $21C794F2A23EEFF9903A5FA3949B7063 *result;

  objc_copyStruct(retstr, &self->_imageRect, 32, 1, 0);
  return result;
}

- (NUPurgeableSurfaceImage)image
{
  return (NUPurgeableSurfaceImage *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
