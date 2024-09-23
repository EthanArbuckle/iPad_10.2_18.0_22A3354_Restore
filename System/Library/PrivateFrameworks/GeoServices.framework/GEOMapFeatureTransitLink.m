@implementation GEOMapFeatureTransitLink

- (NSString)internalLineName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  GEOVectorTransitLineAlongLink(self->_transitLink, self->_lineIndex);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "name");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "feature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithUTF8String:", objc_msgSend(v6, "name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (id)_containingTile
{
  return -[GEOTransitLink containingTile](self->_transitLink, "containingTile");
}

- (GeoCodecsVectorTilePoint)_tilePointsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  GeoCodecsVectorTilePoint *result;
  unint64_t v6;

  v6 = 0;
  result = (GeoCodecsVectorTilePoint *)GEOTransitLinkPoints(self->_transitLink, a3, &v6);
  if (a4)
    *a4 = v6;
  return result;
}

- (float)_elevationsForSection:(unint64_t)a3 outCount:(unint64_t *)a4
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapFeatureTransitLink;
  v4 = -[GEOMapFeatureLine copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 6, self->_transitLink);
  v4[7] = (id)self->_lineIndex;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLink, 0);
}

- (uint64_t)tileKey
{
  void *v1;
  _QWORD *v2;
  __int128 v4;

  objc_msgSend(a1, "_containingTile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (_QWORD *)objc_msgSend(v1, "tileKey");
  *(_QWORD *)((char *)&v4 + 1) = (*v2 << 32) & 0xFFFFC00000000000 | ((unint64_t)((*v2 >> 8) & 0x3F) << 40);
  LOBYTE(v4) = *v2;

  return v4;
}

- (GEOTransitLink)transitLink
{
  return self->_transitLink;
}

- (GEOMapFeatureTransitLink)initWithTransitLink:(id)a3 lineIndex:(unint64_t)a4
{
  id v7;
  GEOMapFeatureTransitLink *v8;
  GEOMapFeatureTransitLink *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOMapFeatureTransitLink;
  v8 = -[GEOMapFeatureLine init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transitLink, a3);
    v9->_lineIndex = a4;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GEOMapFeatureTransitLink;
  -[GEOMapFeatureLine dealloc](&v2, sel_dealloc);
}

@end
