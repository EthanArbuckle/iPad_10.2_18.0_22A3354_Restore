@implementation GEOCoordinateArraySupportPoint

- (GEOCoordinateArraySupportPoint)init
{
  GEOCoordinateArraySupportPoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOCoordinateArraySupportPoint;
  result = -[GEOCoordinateArraySupportPoint init](&v3, sel_init);
  if (result)
  {
    result->_heading = -1.0;
    *(_QWORD *)&result->_legacyRoadClass = 9;
    result->_matchType = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOCoordinateArraySupportPoint)initWithCoder:(id)a3
{
  id v4;
  GEOCoordinateArraySupportPoint *v5;
  id v6;
  const void *v7;
  size_t v8;
  double v9;
  uint64_t v10;
  NSUUID *anchorPointID;
  GEOCoordinateArraySupportPoint *v12;
  unint64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOCoordinateArraySupportPoint;
  v5 = -[GEOCoordinateArraySupportPoint init](&v15, sel_init);
  if (v5)
  {
    v14 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinate"), &v14);
    if (v14 && v7)
    {
      if (v14 >= 8)
        v8 = 8;
      else
        v8 = v14;
      memcpy(&v5->_routeCoordinate, v7, v8);
    }
    v5->_index = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("_index"));
    v5->_roadID = objc_msgSend(v6, "decodeInt64ForKey:", CFSTR("_roadID"));
    objc_msgSend(v6, "decodeDoubleForKey:", CFSTR("_heading"));
    v5->_heading = v9;
    v5->_isUTurn = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("_isUTurn"));
    v5->_legacyRoadClass = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("_legacyRoadClass"));
    v5->_legacyFormOfWay = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("_legacyFormOfWay"));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_anchorPointID"));
    v10 = objc_claimAutoreleasedReturnValue();
    anchorPointID = v5->_anchorPointID;
    v5->_anchorPointID = (NSUUID *)v10;

    v5->_matchType = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("_matchType"));
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_routeCoordinate, 8, CFSTR("_routeCoordinate"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_index, CFSTR("_index"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_roadID, CFSTR("_roadID"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_heading"), self->_heading);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isUTurn, CFSTR("_isUTurn"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_legacyRoadClass, CFSTR("_legacyRoadClass"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_legacyFormOfWay, CFSTR("_legacyFormOfWay"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorPointID, CFSTR("_anchorPointID"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_matchType, CFSTR("_matchType"));

}

- (id)description
{
  double v2;
  int64_t matchType;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSUUID *anchorPointID;

  matchType = self->_matchType;
  if (matchType)
  {
    if (matchType == 1)
      v5 = CFSTR("No match start");
    else
      v5 = CFSTR("No match end");
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0CB37A0];
    GEOPolylineCoordinateAsString(*(_QWORD *)&self->_routeCoordinate, 1, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@] (%@)"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x1E0CB37A0];
  GEOPolylineCoordinateAsString(*(_QWORD *)&self->_routeCoordinate, 1, 0, v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@] %d: %lld"), v12, self->_index, self->_roadID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isUTurn)
    objc_msgSend(v10, "appendString:", CFSTR(" (U-turn)"));
  anchorPointID = self->_anchorPointID;
  if (anchorPointID)
  {
    -[NSUUID UUIDString](anchorPointID, "UUIDString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendFormat:", CFSTR(" | Anchor: %@"), v6);
LABEL_10:

  }
  return v10;
}

- (PolylineCoordinate)routeCoordinate
{
  return self->_routeCoordinate;
}

- (void)setRouteCoordinate:(PolylineCoordinate)a3
{
  self->_routeCoordinate = a3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (int64_t)roadID
{
  return self->_roadID;
}

- (void)setRoadID:(int64_t)a3
{
  self->_roadID = a3;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

- (BOOL)isUTurn
{
  return self->_isUTurn;
}

- (void)setIsUTurn:(BOOL)a3
{
  self->_isUTurn = a3;
}

- (int)legacyRoadClass
{
  return self->_legacyRoadClass;
}

- (void)setLegacyRoadClass:(int)a3
{
  self->_legacyRoadClass = a3;
}

- (int)legacyFormOfWay
{
  return self->_legacyFormOfWay;
}

- (void)setLegacyFormOfWay:(int)a3
{
  self->_legacyFormOfWay = a3;
}

- (NSUUID)anchorPointID
{
  return self->_anchorPointID;
}

- (void)setAnchorPointID:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPointID, a3);
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorPointID, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0xBF80000000000000;
  return self;
}

@end
