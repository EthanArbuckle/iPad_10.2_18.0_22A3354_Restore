@implementation _MKSpatialPlaceLookupTicket

- (_MKSpatialPlaceLookupTicket)initWithTicket:(id)a3
{
  id v5;
  _MKSpatialPlaceLookupTicket *v6;
  _MKSpatialPlaceLookupTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKSpatialPlaceLookupTicket;
  v6 = -[_MKSpatialPlaceLookupTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spatialPlaceLookupTicket, a3);

  return v7;
}

- (id)traits
{
  return (id)-[GEOMapServiceSpatialPlaceLookupTicket traits](self->_spatialPlaceLookupTicket, "traits");
}

- (GEOMapRegion)boundingRegion
{
  return self->_resultBoundingRegion;
}

- (void)cancel
{
  -[GEOMapServiceSpatialPlaceLookupTicket cancel](self->_spatialPlaceLookupTicket, "cancel");
}

- (void)submitWithHandler:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  GEOMapServiceSpatialPlaceLookupTicket *spatialPlaceLookupTicket;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    spatialPlaceLookupTicket = self->_spatialPlaceLookupTicket;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke;
    v9[3] = &unk_1E20DABC0;
    v9[4] = self;
    v10 = v6;
    -[GEOMapServiceSpatialPlaceLookupTicket submitWithHandler:queue:](spatialPlaceLookupTicket, "submitWithHandler:queue:", v9, a4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultBoundingRegion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_spatialPlaceLookupTicket, 0);
}

@end
