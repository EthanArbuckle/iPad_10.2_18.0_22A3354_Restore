@implementation MKMapItemMetadataImageRequest

+ (id)requestWithMapItem:(id)a3 info:(id)a4
{
  id v5;
  id v6;
  MKMapItemMetadataImageRequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(MKMapItemMetadataImageRequest);
  -[MKMapItemMetadataImageRequest setInfo:](v7, "setInfo:", v5);

  -[MKMapItemMetadataRequest setMapItem:](v7, "setMapItem:", v6);
  return v7;
}

- (id)url
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[MKMapItemMetadataImageRequest info](self, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void (**imageHandler)(id, MKMapItemMetadataImageRequest *, _QWORD, void *);
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
  {
    imageHandler = (void (**)(id, MKMapItemMetadataImageRequest *, _QWORD, void *))self->_imageHandler;
    if (!imageHandler)
    {
LABEL_7:
      v6 = 0;
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MKMapItemMetadataImageRequestErrorDomain"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    imageHandler[2](imageHandler, self, 0, v8);

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  imageHandler = (void (**)(id, MKMapItemMetadataImageRequest *, _QWORD, void *))self->_imageHandler;
  if (imageHandler)
  {
    if (v5)
    {
      imageHandler[2](self->_imageHandler, self, v5, 0);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_8:
  -[MKMapItemMetadataImageRequest setImageHandler:](self, "setImageHandler:", 0);

}

- (void)handleError:(id)a3
{
  void (**imageHandler)(id, MKMapItemMetadataImageRequest *, _QWORD, id);

  imageHandler = (void (**)(id, MKMapItemMetadataImageRequest *, _QWORD, id))self->_imageHandler;
  if (imageHandler)
    imageHandler[2](imageHandler, self, 0, a3);
  -[MKMapItemMetadataImageRequest setImageHandler:](self, "setImageHandler:", 0);
}

- (GEOPhotoInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (id)imageHandler
{
  return self->_imageHandler;
}

- (void)setImageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageHandler, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
