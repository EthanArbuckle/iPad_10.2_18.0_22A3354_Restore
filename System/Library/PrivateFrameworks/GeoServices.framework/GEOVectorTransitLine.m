@implementation GEOVectorTransitLine

- (id)init:(void *)a3 withVectorTile:(id)a4
{
  id v6;
  GEOVectorTransitLine *v7;
  GEOVectorTransitLine *v8;
  GEOFeature *v9;
  GEOFeature *feature;
  objc_super v12;

  v6 = a4;
  if (a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOVectorTransitLine;
    v7 = -[GEOVectorTransitLine init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_vectorTransitLine = a3;
      v9 = -[GEOFeature init:withVectorTile:]([GEOFeature alloc], "init:withVectorTile:", a3, v6);
      feature = v8->_feature;
      v8->_feature = v9;

    }
    self = v8;
    a3 = self;
  }

  return a3;
}

- (void)get
{
  return self->_vectorTransitLine;
}

- (GEOFeature)feature
{
  return self->_feature;
}

- (GeoCodecsRGBAColor8)color
{
  GeoCodecsRGBAColor8 *vectorTransitLine;

  vectorTransitLine = (GeoCodecsRGBAColor8 *)self->_vectorTransitLine;
  if (vectorTransitLine)
    return vectorTransitLine + 20;
  else
    return 0;
}

- (unsigned)systemIndex
{
  _DWORD *vectorTransitLine;

  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine)
    return vectorTransitLine[21];
  else
    return 0;
}

- (float)minZoom
{
  float *vectorTransitLine;

  vectorTransitLine = (float *)self->_vectorTransitLine;
  if (vectorTransitLine)
    return vectorTransitLine[22];
  else
    return 0.0;
}

- (unsigned)subtitleOffset
{
  _DWORD *vectorTransitLine;

  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine)
    return vectorTransitLine[23];
  else
    return 0;
}

- (unsigned)cartoId
{
  _DWORD *vectorTransitLine;

  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine)
    return vectorTransitLine[24];
  else
    return 0;
}

- (unsigned)order
{
  _DWORD *vectorTransitLine;

  vectorTransitLine = self->_vectorTransitLine;
  if (vectorTransitLine)
    return vectorTransitLine[25];
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
