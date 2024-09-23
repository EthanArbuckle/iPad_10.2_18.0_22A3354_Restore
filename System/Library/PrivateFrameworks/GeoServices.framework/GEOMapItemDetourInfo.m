@implementation GEOMapItemDetourInfo

- (GEOMapItemDetourInfo)init
{
  GEOMapItemDetourInfo *result;

  result = (GEOMapItemDetourInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapItemDetourInfo)initWithResultDetourInfo:(id)a3
{
  id v5;
  GEOMapItemDetourInfo *v6;
  GEOMapItemDetourInfo *v7;
  GEOMapItemDetourInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemDetourInfo;
  v6 = -[GEOMapItemDetourInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_detourInfo, a3);
    v8 = v7;
  }

  return v7;
}

- (double)detourTime
{
  return (double)-[GEOPDResultDetourInfo detourTime](self->_detourInfo, "detourTime");
}

- (double)timeToPlace
{
  return (double)-[GEOPDResultDetourInfo timeToPlace](self->_detourInfo, "timeToPlace");
}

- (double)detourDistance
{
  return (double)-[GEOPDResultDetourInfo detourDistance](self->_detourInfo, "detourDistance");
}

- (double)distanceToPlace
{
  return (double)-[GEOPDResultDetourInfo distanceToPlace](self->_detourInfo, "distanceToPlace");
}

- (NSData)detourInfoAsData
{
  return (NSData *)-[GEOPDResultDetourInfo data](self->_detourInfo, "data");
}

- (GEOPDResultDetourInfo)pdDetourInfo
{
  return self->_detourInfo;
}

- (GEOPDResultDetourInfo)_detourInfo
{
  return self->_detourInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detourInfo, 0);
}

@end
