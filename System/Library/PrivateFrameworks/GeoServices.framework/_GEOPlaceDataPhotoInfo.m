@implementation _GEOPlaceDataPhotoInfo

- (_GEOPlaceDataPhotoInfo)initWithURL:(id)a3 width:(double)a4 height:(double)a5
{
  id v9;
  void *v10;
  _GEOPlaceDataPhotoInfo *v11;
  void *v12;
  uint64_t v13;
  _GEOPlaceDataPhotoInfo *v14;
  _GEOPlaceDataPhotoInfo *v15;
  objc_super v17;

  v9 = a3;
  v10 = v9;
  v11 = 0;
  if (a4 > 0.0 && a5 > 0.0)
  {
    objc_msgSend(v9, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v17.receiver = self;
      v17.super_class = (Class)_GEOPlaceDataPhotoInfo;
      v14 = -[_GEOPlaceDataPhotoInfo init](&v17, sel_init);
      v15 = v14;
      if (v14)
      {
        v14->_size.width = a4;
        v14->_size.height = a5;
        objc_storeStrong((id *)&v14->_url, a3);
      }
      self = v15;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("url : %@ \n width : %f \n height : %f"), self->_url, *(_QWORD *)&self->_size.width, *(_QWORD *)&self->_size.height);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
