@implementation GEOVenueComponentIdentifier

- (GEOVenueComponentIdentifier)init
{
  GEOVenueComponentIdentifier *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GEOVenueComponentIdentifier;
  result = -[GEOVenueComponentIdentifier init](&v3, sel_init);
  if (result)
  {
    result->_hasBuildingID = 0;
    result->_hasUnitID = 0;
    result->_hasFixtureID = 0;
  }
  return result;
}

- (GEOVenueComponentIdentifier)initWithBuildingID:(unint64_t)a3
{
  GEOVenueComponentIdentifier *result;

  result = -[GEOVenueComponentIdentifier init](self, "init");
  if (result)
  {
    result->_buildingID = a3;
    result->_hasBuildingID = 1;
  }
  return result;
}

- (GEOVenueComponentIdentifier)initWithBuildingID:(unint64_t)a3 floorInfo:(id)a4
{
  id v7;
  GEOVenueComponentIdentifier *v8;
  GEOVenueComponentIdentifier *v9;

  v7 = a4;
  v8 = -[GEOVenueComponentIdentifier initWithBuildingID:](self, "initWithBuildingID:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_floorInfo, a4);

  return v9;
}

- (GEOVenueComponentIdentifier)initWithBuildingID:(unint64_t)a3 floorInfo:(id)a4 unitID:(unint64_t)a5
{
  GEOVenueComponentIdentifier *result;

  result = -[GEOVenueComponentIdentifier initWithBuildingID:floorInfo:](self, "initWithBuildingID:floorInfo:", a3, a4);
  if (result)
  {
    result->_unitID = a5;
    result->_hasUnitID = 1;
  }
  return result;
}

- (GEOVenueComponentIdentifier)initWithBuildingID:(unint64_t)a3 floorInfo:(id)a4 fixtureID:(unint64_t)a5
{
  GEOVenueComponentIdentifier *result;

  result = -[GEOVenueComponentIdentifier initWithBuildingID:floorInfo:](self, "initWithBuildingID:floorInfo:", a3, a4);
  if (result)
  {
    result->_fixtureID = a5;
    result->_hasFixtureID = 1;
  }
  return result;
}

- (GEOVenueComponentIdentifier)initWithVenueIdentifier:(id)a3
{
  _WORD *v4;
  _QWORD *v5;
  __int16 v6;
  int v7;
  GEOVenueComponentIdentifier *v8;
  GEOVenueFloorInfo *v9;
  GEOVenueFloorInfo *floorInfo;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  unint64_t i;
  void *v15;
  NSArray *v16;
  NSArray *sectionIDs;
  GEOVenueComponentIdentifier *v18;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t, unint64_t);
  void *v22;
  _QWORD *v23;

  v4 = a3;
  v5 = v4;
  if (v4
    && ((v6 = v4[76], v7 = v6 & 0x110, (v6 & 0x25) != 0)
     || v7 == 272
     || (-[GEOPDVenueIdentifier _readSectionIds]((uint64_t)v4), v5[7]))
    && (v8 = -[GEOVenueComponentIdentifier init](self, "init"), (self = v8) != 0))
  {
    v8->_buildingID = v5[9];
    v8->_hasBuildingID = v5[19] & 1;
    v8->_unitID = v5[14];
    v8->_hasUnitID = (v5[19] & 0x20) != 0;
    v8->_fixtureID = v5[11];
    v8->_hasFixtureID = (v5[19] & 4) != 0;
    if (v7 == 272
      && +[GEOVenueFloorInfo isIntegerValidOrdinal:](GEOVenueFloorInfo, "isIntegerValidOrdinal:", *((int *)v5 + 37)))
    {
      v9 = -[GEOVenueFloorInfo initWithOrdinal:levelID:]([GEOVenueFloorInfo alloc], "initWithOrdinal:levelID:", *((__int16 *)v5 + 74), v5[13]);
      floorInfo = self->_floorInfo;
      self->_floorInfo = v9;

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v21 = __55__GEOVenueComponentIdentifier_initWithVenueIdentifier___block_invoke;
    v22 = &unk_1E1C0C5B0;
    v23 = v5;
    -[GEOPDVenueIdentifier _readSectionIds]((uint64_t)v23);
    v11 = v23[7];
    v12 = v20;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v21((uint64_t)v12, i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v15);

      }
    }
    v16 = (NSArray *)objc_msgSend(v13, "copy");

    sectionIDs = self->_sectionIDs;
    self->_sectionIDs = v16;

    self = self;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __55__GEOVenueComponentIdentifier_initWithVenueIdentifier___block_invoke(uint64_t a1, unint64_t a2)
{
  return -[GEOPDVenueIdentifier sectionIdAtIndex:](*(_QWORD *)(a1 + 32), a2);
}

- (BOOL)_hasBuildingID
{
  return self->_hasBuildingID;
}

- (unint64_t)buildingID
{
  return self->_buildingID;
}

- (GEOVenueFloorInfo)floorInfo
{
  return self->_floorInfo;
}

- (NSArray)sectionIDs
{
  return self->_sectionIDs;
}

- (BOOL)_hasUnitID
{
  return self->_hasUnitID;
}

- (unint64_t)unitID
{
  return self->_unitID;
}

- (BOOL)_hasFixtureID
{
  return self->_hasFixtureID;
}

- (unint64_t)fixtureID
{
  return self->_fixtureID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIDs, 0);
  objc_storeStrong((id *)&self->_floorInfo, 0);
}

@end
