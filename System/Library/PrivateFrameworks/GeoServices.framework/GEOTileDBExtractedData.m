@implementation GEOTileDBExtractedData

- (GEOTileDBExtractedData)initWithData:(id)a3 externalResourceUUID:(id)a4
{
  id v7;
  id v8;
  GEOTileDBExtractedData *v9;
  GEOTileDBExtractedData *v10;
  GEOTileDBExtractedData *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOTileDBExtractedData;
  v9 = -[GEOTileDBExtractedData init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_externalResourceUUID, a4);
    v11 = v10;
  }

  return v10;
}

- (GEOTileDBExtractedData)initWithData:(id)a3
{
  id v5;
  GEOTileDBExtractedData *v6;
  GEOTileDBExtractedData *v7;
  GEOTileDBExtractedData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOTileDBExtractedData;
  v6 = -[GEOTileDBExtractedData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

- (NSUUID)externalResourceUUID
{
  return self->_externalResourceUUID;
}

- (GEOTileData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_externalResourceUUID, 0);
}

@end
