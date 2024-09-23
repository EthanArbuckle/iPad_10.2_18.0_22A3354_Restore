@implementation GEOEnhancedPlacement

- (GEOEnhancedPlacement)initWithBuildingIds:(id)a3 elevationInMeters:(id)a4 buildingHeightInMeters:(id)a5 buildingFaceAzimuth:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOEnhancedPlacement *v14;
  uint64_t v15;
  NSArray *buildingIds;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GEOEnhancedPlacement;
  v14 = -[GEOEnhancedPlacement init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    buildingIds = v14->_buildingIds;
    v14->_buildingIds = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_elevationInMeters, a4);
    objc_storeStrong((id *)&v14->_buildingHeightInMeters, a5);
    objc_storeStrong((id *)&v14->_buildingFaceAzimuth, a6);
  }

  return v14;
}

- (GEOEnhancedPlacement)initWithGEOPDEnhancedPlacement:(id)a3
{
  _QWORD *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  GEOEnhancedPlacement *v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (!v4)
  {
    v6 = (void *)objc_msgSend(v5, "initWithCapacity:", 0);
    v9 = (void *)objc_msgSend(v6, "copy");
    v16 = -[GEOEnhancedPlacement initWithBuildingIds:elevationInMeters:buildingHeightInMeters:buildingFaceAzimuth:](self, "initWithBuildingIds:elevationInMeters:buildingHeightInMeters:buildingFaceAzimuth:", v9, 0, 0, 0);
    goto LABEL_12;
  }
  v6 = (void *)objc_msgSend(v5, "initWithCapacity:", v4[3]);
  if (v4[3])
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GEOPDEnhancedPlacement buildingIdAtIndex:]((uint64_t)v4, v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < v4[3]);
  }
  v9 = (void *)objc_msgSend(v6, "copy");
  v11 = *((_BYTE *)v4 + 56);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v4 + 5));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *((_BYTE *)v4 + 56);
    if ((v13 & 4) != 0)
    {
LABEL_7:
      LODWORD(v10) = *((_DWORD *)v4 + 13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v4[7] & 2) != 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else
  {
    v12 = 0;
    v13 = *((_BYTE *)v4 + 56);
    if ((v13 & 4) != 0)
      goto LABEL_7;
  }
  v14 = 0;
  if ((v13 & 2) != 0)
  {
LABEL_8:
    LODWORD(v10) = *((_DWORD *)v4 + 12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[GEOEnhancedPlacement initWithBuildingIds:elevationInMeters:buildingHeightInMeters:buildingFaceAzimuth:](self, "initWithBuildingIds:elevationInMeters:buildingHeightInMeters:buildingFaceAzimuth:", v9, v12, v14, v15);

    if ((v13 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  v16 = -[GEOEnhancedPlacement initWithBuildingIds:elevationInMeters:buildingHeightInMeters:buildingFaceAzimuth:](self, "initWithBuildingIds:elevationInMeters:buildingHeightInMeters:buildingFaceAzimuth:", v9, v12, v14, 0);
  if ((v13 & 4) != 0)
LABEL_9:

LABEL_10:
  if ((v11 & 1) != 0)

LABEL_12:
  return v16;
}

- (NSArray)buildingIds
{
  return self->_buildingIds;
}

- (NSNumber)elevationInMeters
{
  return self->_elevationInMeters;
}

- (NSNumber)buildingHeightInMeters
{
  return self->_buildingHeightInMeters;
}

- (NSNumber)buildingFaceAzimuth
{
  return self->_buildingFaceAzimuth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildingFaceAzimuth, 0);
  objc_storeStrong((id *)&self->_buildingHeightInMeters, 0);
  objc_storeStrong((id *)&self->_elevationInMeters, 0);
  objc_storeStrong((id *)&self->_buildingIds, 0);
}

@end
