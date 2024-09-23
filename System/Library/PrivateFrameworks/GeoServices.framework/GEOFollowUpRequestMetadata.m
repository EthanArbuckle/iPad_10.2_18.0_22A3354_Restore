@implementation GEOFollowUpRequestMetadata

- (GEOFollowUpRequestMetadata)initWithGEOPDFollowUpRequestMetadata:(id)a3
{
  _BYTE *v4;
  GEOFollowUpRequestMetadata *v5;
  GEOFollowUpRequestMetadata *v6;
  uint64_t v7;
  GEOFollowUpRequestMetadata *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOFollowUpRequestMetadata;
    v5 = -[GEOFollowUpRequestMetadata init](&v11, sel_init);
    v6 = v5;
    if (v5)
    {
      if ((v4[24] & 2) != 0)
        v7 = *((unsigned int *)v4 + 5);
      else
        v7 = 0;
      v5->_requestType = -[GEOFollowUpRequestMetadata _requestTypeFrom:](v5, "_requestTypeFrom:", v7);
      if ((v4[24] & 1) != 0)
        v9 = *((unsigned int *)v4 + 4);
      else
        v9 = 0;
      v6->_dataType = -[GEOFollowUpRequestMetadata _dataTypeFrom:](v6, "_dataTypeFrom:", v9);
    }
    self = v6;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)_requestTypeFrom:(int)a3
{
  return a3 == 1;
}

- (int)_dataTypeFrom:(int)a3
{
  return a3 == 1;
}

- (BOOL)isSearchRequestForNearbyPlaces
{
  return -[GEOFollowUpRequestMetadata requestType](self, "requestType") == 1
      && -[GEOFollowUpRequestMetadata dataType](self, "dataType") == 1;
}

- (int)requestType
{
  return self->_requestType;
}

- (int)dataType
{
  return self->_dataType;
}

@end
