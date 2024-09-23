@implementation GTMTLReplayRasterMapLayerQuery

- (GTMTLReplayRasterMapLayerQuery)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  GTMTLReplayRasterMapLayerQuery *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  uint64_t v16;
  NSArray *horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
  uint64_t v18;
  NSArray *verticalLogicalCoordinatesAtPhysicalTileBoundaries;
  GTMTLReplayRasterMapLayerQuery *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GTMTLReplayRasterMapLayerQuery;
  v6 = -[GTMTLReplayRasterMapLayerQuery init](&v22, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSData, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(NSError, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v6->_size.width = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size.width"));
    v6->_size.height = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size.height"));
    v6->_size.depth = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size.depth"));
    v12 = objc_opt_class(NSArray, v11);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(NSNumber, v13), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("horizontalLogicalCoordinatesAtPhysicalTileBoundaries")));
    horizontalLogicalCoordinatesAtPhysicalTileBoundaries = v6->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
    v6->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries = (NSArray *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("verticalLogicalCoordinatesAtPhysicalTileBoundaries")));
    verticalLogicalCoordinatesAtPhysicalTileBoundaries = v6->_verticalLogicalCoordinatesAtPhysicalTileBoundaries;
    v6->_verticalLogicalCoordinatesAtPhysicalTileBoundaries = (NSArray *)v18;

    v20 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t width;
  id v5;

  width = self->_size.width;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", width, CFSTR("size.width"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_size.height, CFSTR("size.height"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_size.depth, CFSTR("size.depth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries, CFSTR("horizontalLogicalCoordinatesAtPhysicalTileBoundaries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries, CFSTR("verticalLogicalCoordinatesAtPhysicalTileBoundaries"));

}

- (NSArray)horizontalLogicalCoordinatesAtPhysicalTileBoundaries
{
  return self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries;
}

- (void)setHorizontalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries, a3);
}

- (NSArray)verticalLogicalCoordinatesAtPhysicalTileBoundaries
{
  return self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries;
}

- (void)setVerticalLogicalCoordinatesAtPhysicalTileBoundaries:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries, a3);
}

- (GTSize)size
{
  *retstr = self[1];
  return self;
}

- (void)setSize:(GTSize *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->width;
  self->_size.depth = a3->depth;
  *(_OWORD *)&self->_size.width = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLogicalCoordinatesAtPhysicalTileBoundaries, 0);
  objc_storeStrong((id *)&self->_horizontalLogicalCoordinatesAtPhysicalTileBoundaries, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
