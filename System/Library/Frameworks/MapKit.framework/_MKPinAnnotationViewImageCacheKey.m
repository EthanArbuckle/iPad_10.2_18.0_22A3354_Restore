@implementation _MKPinAnnotationViewImageCacheKey

- (_MKPinAnnotationViewImageCacheKey)initWithMapType:(unint64_t)a3 pinColor:(id)a4 traits:(id)a5
{
  id v9;
  id v10;
  _MKPinAnnotationViewImageCacheKey *v11;
  _MKPinAnnotationViewImageCacheKey *v12;
  _MKPinAnnotationViewImageCacheKey *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MKPinAnnotationViewImageCacheKey;
  v11 = -[_MKPinAnnotationViewImageCacheKey init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_mapType = a3;
    objc_storeStrong((id *)&v11->_pinColor, a4);
    v12->_idiom = objc_msgSend(v10, "userInterfaceIdiom");
    v12->_userInterfaceStyle = objc_msgSend(v10, "userInterfaceStyle");
    v13 = v12;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t mapType;

  mapType = self->_mapType;
  return -[UIColor hash](self->_pinColor, "hash") ^ mapType ^ self->_idiom ^ self->_userInterfaceStyle;
}

- (BOOL)isEqual:(id)a3
{
  _MKPinAnnotationViewImageCacheKey *v4;
  _MKPinAnnotationViewImageCacheKey *v5;
  _MKPinAnnotationViewImageCacheKey *v6;
  char v7;

  v4 = (_MKPinAnnotationViewImageCacheKey *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_idiom == v5->_idiom
        && self->_userInterfaceStyle == v5->_userInterfaceStyle
        && self->_mapType == v5->_mapType)
      {
        v7 = -[UIColor isEqual:](self->_pinColor, "isEqual:", v5->_pinColor);
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinColor, 0);
}

@end
