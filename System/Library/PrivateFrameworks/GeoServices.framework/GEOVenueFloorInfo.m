@implementation GEOVenueFloorInfo

- (GEOVenueFloorInfo)init
{
  GEOVenueFloorInfo *result;

  result = (GEOVenueFloorInfo *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOVenueFloorInfo)initWithOrdinal:(signed __int16)a3 levelID:(unint64_t)a4
{
  GEOVenueFloorInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVenueFloorInfo;
  result = -[GEOVenueFloorInfo init](&v7, sel_init);
  if (result)
  {
    result->_ordinal = a3;
    result->_levelID = a4;
  }
  return result;
}

- (GEOVenueFloorInfo)initWithLevel:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  GEOVenueFloorInfo *v6;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (v4
    && (~v4[36] & 3) == 0
    && +[GEOVenueFloorInfo isIntegerValidOrdinal:](GEOVenueFloorInfo, "isIntegerValidOrdinal:", *((int *)v4 + 8)))
  {
    self = -[GEOVenueFloorInfo initWithOrdinal:levelID:](self, "initWithOrdinal:levelID:", *((__int16 *)v5 + 16), *((_QWORD *)v5 + 3));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)floorInfosFromLevels:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__GEOVenueFloorInfo_floorInfosFromLevels___block_invoke;
  v9[3] = &unk_1E1C132E8;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __42__GEOVenueFloorInfo_floorInfosFromLevels___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  GEOVenueFloorInfo *v4;
  GEOVenueFloorInfo *v5;

  v3 = a2;
  v5 = -[GEOVenueFloorInfo initWithLevel:]([GEOVenueFloorInfo alloc], "initWithLevel:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

+ (BOOL)isIntegerValidOrdinal:(int64_t)a3
{
  return a3 == (__int16)a3;
}

- (signed)ordinal
{
  return self->_ordinal;
}

- (unint64_t)levelID
{
  return self->_levelID;
}

@end
