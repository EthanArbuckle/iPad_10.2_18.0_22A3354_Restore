@implementation GEOMapItemParentVenue

- (GEOMapItemParentVenue)init
{
  GEOMapItemParentVenue *result;

  result = (GEOMapItemParentVenue *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapItemParentVenue)initWithBusinessID:(unint64_t)a3 featureType:(int)a4
{
  GEOMapItemParentVenue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemParentVenue;
  result = -[GEOMapItemParentVenue init](&v7, sel_init);
  if (result)
  {
    result->_businessID = a3;
    result->_featureType = a4;
  }
  return result;
}

- (GEOMapItemParentVenue)initWithLocatedInsideInfo:(id)a3
{
  unsigned int *v4;
  void *v5;
  GEOMapItemParentVenue *v6;

  v4 = (unsigned int *)a3;
  v5 = v4;
  if (!v4 || (~*((unsigned __int8 *)v4 + 28) & 3) != 0)
  {
    v6 = 0;
  }
  else
  {
    self = -[GEOMapItemParentVenue initWithBusinessID:featureType:](self, "initWithBusinessID:featureType:", *((_QWORD *)v4 + 2), v4[6]);
    v6 = self;
  }

  return v6;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (int)featureType
{
  return self->_featureType;
}

@end
