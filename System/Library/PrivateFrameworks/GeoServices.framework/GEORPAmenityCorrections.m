@implementation GEORPAmenityCorrections

- (GEORPAmenityCorrections)init
{
  GEORPAmenityCorrections *v2;
  GEORPAmenityCorrections *v3;
  GEORPAmenityCorrections *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPAmenityCorrections;
  v2 = -[GEORPAmenityCorrections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPAmenityCorrections)initWithData:(id)a3
{
  GEORPAmenityCorrections *v3;
  GEORPAmenityCorrections *v4;
  GEORPAmenityCorrections *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPAmenityCorrections;
  v3 = -[GEORPAmenityCorrections initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPAmenityCorrections;
  -[GEORPAmenityCorrections dealloc](&v3, sel_dealloc);
}

- (void)_readAddedAmenities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAmenityCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddedAmenities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)addedAmenitiesCount
{
  -[GEORPAmenityCorrections _readAddedAmenities]((uint64_t)self);
  return self->_addedAmenities.count;
}

- (int)addedAmenities
{
  -[GEORPAmenityCorrections _readAddedAmenities]((uint64_t)self);
  return self->_addedAmenities.list;
}

- (void)clearAddedAmenities
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addAddedAmenities:(int)a3
{
  -[GEORPAmenityCorrections _readAddedAmenities]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (int)addedAmenitiesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_addedAmenities;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPAmenityCorrections _readAddedAmenities]((uint64_t)self);
  p_addedAmenities = &self->_addedAmenities;
  count = self->_addedAmenities.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_addedAmenities->list[a3];
}

- (void)setAddedAmenities:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Set();
}

- (id)addedAmenitiesAsString:(int)a3
{
  if (a3 < 0x3F)
    return *((id *)&off_1E1C14710 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAddedAmenities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTS_CREDIT_CARDS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WHEELCHAIR_ACCESSIBLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD_FOR_KIDS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_DELIVERY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOWS_PETS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_24_HOURS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FITNESS_CENTER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_BREAKFAST")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SPA")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SWIMMING_POOL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_WIFI")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_WIFI")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_INTERNET")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SHUTTLE_BUS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_AIRPORT_TRANSPORTATION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_PARKING")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_PARKING_GARAGE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_PARKING")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMOKING_ALLOWED")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAKES_RESERVATIONS")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTS_APPLE_PAY")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_GENDER_NEUTRAL_RESTROOM")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_TAKE_OUT")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BY_APPOINTMENT_ONLY")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD_FOR_GROUPS")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SCENIC_VIEW")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_OUTDOOR_SEATING")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_WATERFRONT")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_BEACHFRONT")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOWS_DOGS")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_DRIVE_THROUGH")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FULL_BAR")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_VEGETARIAN_OPTIONS")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_VEGAN_OPTIONS")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_GLUTENFREE_OPTIONS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SOY_FREE_OPTIONS")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_HALAL_OPTIONS")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_DAIRY_FREE_OPTIONS")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_MEETING_ROOMS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON_SMOKING_THROUGHOUT")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_NON_SMOKING_ROOMS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FAMILY_ROOMS")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_BAR_LOUNGE")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_RESTAURANT")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_LAUNDRY_SERVICE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_LARGE_TABLES")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_PRIVATE_ROOMS")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_HIGH_CHAIRS")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SELF_ORDERING_ONLINE")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_ONLINE_QUEUING")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SEATING_FOR_COUPLES")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_CHILDREN_DISCOUNT")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_IMAX")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_TRADE_IN_FOR_CREDIT")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_TODAY_AT_APPLE_SESSIONS")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMALL_BUSINESS_SOLUTIONS")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARDWARE_REPAIRS_AND_SUPPORT")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENIUS_BAR_WALK_INS")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_SERVICE_PROVIDER")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALK_IN_REPAIRS")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_DROPOFF_LOCATION")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readRemovedAmenities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPAmenityCorrectionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRemovedAmenities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)removedAmenitiesCount
{
  -[GEORPAmenityCorrections _readRemovedAmenities]((uint64_t)self);
  return self->_removedAmenities.count;
}

- (int)removedAmenities
{
  -[GEORPAmenityCorrections _readRemovedAmenities]((uint64_t)self);
  return self->_removedAmenities.list;
}

- (void)clearRemovedAmenities
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addRemovedAmenities:(int)a3
{
  -[GEORPAmenityCorrections _readRemovedAmenities]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (int)removedAmenitiesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_removedAmenities;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPAmenityCorrections _readRemovedAmenities]((uint64_t)self);
  p_removedAmenities = &self->_removedAmenities;
  count = self->_removedAmenities.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_removedAmenities->list[a3];
}

- (void)setRemovedAmenities:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Set();
}

- (id)removedAmenitiesAsString:(int)a3
{
  if (a3 < 0x3F)
    return *((id *)&off_1E1C14710 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRemovedAmenities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTS_CREDIT_CARDS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WHEELCHAIR_ACCESSIBLE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD_FOR_KIDS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_DELIVERY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOWS_PETS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_24_HOURS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FITNESS_CENTER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_BREAKFAST")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SPA")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SWIMMING_POOL")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_WIFI")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_WIFI")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_INTERNET")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SHUTTLE_BUS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_AIRPORT_TRANSPORTATION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_PARKING")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_PARKING_GARAGE")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FREE_PARKING")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMOKING_ALLOWED")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAKES_RESERVATIONS")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCEPTS_APPLE_PAY")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_GENDER_NEUTRAL_RESTROOM")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_TAKE_OUT")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BY_APPOINTMENT_ONLY")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD_FOR_GROUPS")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SCENIC_VIEW")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_OUTDOOR_SEATING")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_WATERFRONT")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_BEACHFRONT")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOWS_DOGS")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_DRIVE_THROUGH")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FULL_BAR")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_VEGETARIAN_OPTIONS")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_VEGAN_OPTIONS")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_GLUTENFREE_OPTIONS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SOY_FREE_OPTIONS")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_HALAL_OPTIONS")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_DAIRY_FREE_OPTIONS")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_MEETING_ROOMS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON_SMOKING_THROUGHOUT")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_NON_SMOKING_ROOMS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_FAMILY_ROOMS")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_BAR_LOUNGE")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_RESTAURANT")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_LAUNDRY_SERVICE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_LARGE_TABLES")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_PRIVATE_ROOMS")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_HIGH_CHAIRS")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SELF_ORDERING_ONLINE")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_ONLINE_QUEUING")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_SEATING_FOR_COUPLES")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_CHILDREN_DISCOUNT")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HAS_IMAX")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_TRADE_IN_FOR_CREDIT")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FREE_TODAY_AT_APPLE_SESSIONS")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMALL_BUSINESS_SOLUTIONS")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HARDWARE_REPAIRS_AND_SUPPORT")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENIUS_BAR_WALK_INS")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_SERVICE_PROVIDER")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALK_IN_REPAIRS")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_DROPOFF_LOCATION")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEORPAmenityCorrections;
  -[GEORPAmenityCorrections description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPAmenityCorrections dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPAmenityCorrections _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[3])
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1 + 2;
      if (a1[3])
      {
        v7 = 0;
        do
        {
          v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 0x3F)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = (void *)*((_QWORD *)&off_1E1C14710 + v8);
          }
          objc_msgSend(v5, "addObject:", v9);

          ++v7;
          v6 = a1 + 2;
        }
        while (v7 < a1[3]);
      }
      if (a2)
        v10 = CFSTR("addedAmenities");
      else
        v10 = CFSTR("added_amenities");
      objc_msgSend(v4, "setObject:forKey:", v5, v10);

    }
    if (a1[6])
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1 + 5;
      if (a1[6])
      {
        v13 = 0;
        do
        {
          v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 0x3F)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = (void *)*((_QWORD *)&off_1E1C14710 + v14);
          }
          objc_msgSend(v11, "addObject:", v15);

          ++v13;
          v12 = a1 + 5;
        }
        while (v13 < a1[6]);
      }
      if (a2)
        v16 = CFSTR("removedAmenities");
      else
        v16 = CFSTR("removed_amenities");
      objc_msgSend(v4, "setObject:forKey:", v11, v16);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPAmenityCorrections _dictionaryRepresentation:](self, 1);
}

- (GEORPAmenityCorrections)initWithDictionary:(id)a3
{
  return (GEORPAmenityCorrections *)-[GEORPAmenityCorrections _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v28;
  int v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v6 = (void *)objc_msgSend(a1, "init");
    if (v6)
    {
      if (a3)
        v7 = CFSTR("addedAmenities");
      else
        v7 = CFSTR("added_amenities");
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = a3;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v28 = v8;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (!v10)
          goto LABEL_146;
        v11 = v10;
        v12 = *(_QWORD *)v37;
        while (1)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              if ((objc_msgSend(v15, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
              {
                v16 = 0;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ACCEPTS_CREDIT_CARDS")) & 1) != 0)
              {
                v16 = 1;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WHEELCHAIR_ACCESSIBLE")) & 1) != 0)
              {
                v16 = 2;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GOOD_FOR_KIDS")) & 1) != 0)
              {
                v16 = 3;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_DELIVERY")) & 1) != 0)
              {
                v16 = 4;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ALLOWS_PETS")) & 1) != 0)
              {
                v16 = 5;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OPEN_24_HOURS")) & 1) != 0)
              {
                v16 = 6;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FITNESS_CENTER")) & 1) != 0)
              {
                v16 = 7;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FREE_BREAKFAST")) & 1) != 0)
              {
                v16 = 8;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SPA")) & 1) != 0)
              {
                v16 = 9;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SWIMMING_POOL")) & 1) != 0)
              {
                v16 = 10;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_WIFI")) & 1) != 0)
              {
                v16 = 11;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FREE_WIFI")) & 1) != 0)
              {
                v16 = 12;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FREE_INTERNET")) & 1) != 0)
              {
                v16 = 13;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SHUTTLE_BUS")) & 1) != 0)
              {
                v16 = 14;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_AIRPORT_TRANSPORTATION")) & 1) != 0)
              {
                v16 = 15;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_PARKING")) & 1) != 0)
              {
                v16 = 16;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_PARKING_GARAGE")) & 1) != 0)
              {
                v16 = 17;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FREE_PARKING")) & 1) != 0)
              {
                v16 = 18;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SMOKING_ALLOWED")) & 1) != 0)
              {
                v16 = 19;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TAKES_RESERVATIONS")) & 1) != 0)
              {
                v16 = 20;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ACCEPTS_APPLE_PAY")) & 1) != 0)
              {
                v16 = 21;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_GENDER_NEUTRAL_RESTROOM")) & 1) != 0)
              {
                v16 = 22;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_TAKE_OUT")) & 1) != 0)
              {
                v16 = 23;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("BY_APPOINTMENT_ONLY")) & 1) != 0)
              {
                v16 = 24;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GOOD_FOR_GROUPS")) & 1) != 0)
              {
                v16 = 25;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SCENIC_VIEW")) & 1) != 0)
              {
                v16 = 26;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_OUTDOOR_SEATING")) & 1) != 0)
              {
                v16 = 27;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_WATERFRONT")) & 1) != 0)
              {
                v16 = 28;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_BEACHFRONT")) & 1) != 0)
              {
                v16 = 29;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("ALLOWS_DOGS")) & 1) != 0)
              {
                v16 = 30;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_DRIVE_THROUGH")) & 1) != 0)
              {
                v16 = 31;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FULL_BAR")) & 1) != 0)
              {
                v16 = 32;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_VEGETARIAN_OPTIONS")) & 1) != 0)
              {
                v16 = 33;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_VEGAN_OPTIONS")) & 1) != 0)
              {
                v16 = 34;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_GLUTENFREE_OPTIONS")) & 1) != 0)
              {
                v16 = 35;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SOY_FREE_OPTIONS")) & 1) != 0)
              {
                v16 = 36;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_HALAL_OPTIONS")) & 1) != 0)
              {
                v16 = 37;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_DAIRY_FREE_OPTIONS")) & 1) != 0)
              {
                v16 = 38;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_MEETING_ROOMS")) & 1) != 0)
              {
                v16 = 39;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NON_SMOKING_THROUGHOUT")) & 1) != 0)
              {
                v16 = 40;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_NON_SMOKING_ROOMS")) & 1) != 0)
              {
                v16 = 41;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_FAMILY_ROOMS")) & 1) != 0)
              {
                v16 = 42;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_BAR_LOUNGE")) & 1) != 0)
              {
                v16 = 43;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_RESTAURANT")) & 1) != 0)
              {
                v16 = 44;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_LAUNDRY_SERVICE")) & 1) != 0)
              {
                v16 = 45;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_LARGE_TABLES")) & 1) != 0)
              {
                v16 = 46;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_PRIVATE_ROOMS")) & 1) != 0)
              {
                v16 = 47;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_HIGH_CHAIRS")) & 1) != 0)
              {
                v16 = 48;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SELF_ORDERING_ONLINE")) & 1) != 0)
              {
                v16 = 49;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_ONLINE_QUEUING")) & 1) != 0)
              {
                v16 = 50;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_SEATING_FOR_COUPLES")) & 1) != 0)
              {
                v16 = 51;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_CHILDREN_DISCOUNT")) & 1) != 0)
              {
                v16 = 52;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HAS_IMAX")) & 1) != 0)
              {
                v16 = 53;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("DEVICE_TRADE_IN_FOR_CREDIT")) & 1) != 0)
              {
                v16 = 54;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("FREE_TODAY_AT_APPLE_SESSIONS")) & 1) != 0)
              {
                v16 = 55;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("SMALL_BUSINESS_SOLUTIONS")) & 1) != 0)
              {
                v16 = 56;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("HARDWARE_REPAIRS_AND_SUPPORT")) & 1) != 0)
              {
                v16 = 57;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("GENIUS_BAR_WALK_INS")) & 1) != 0)
              {
                v16 = 58;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_SERVICE_PROVIDER")) & 1) != 0)
              {
                v16 = 59;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR")) & 1) != 0)
              {
                v16 = 60;
              }
              else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("WALK_IN_REPAIRS")) & 1) != 0)
              {
                v16 = 61;
              }
              else if (objc_msgSend(v15, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_DROPOFF_LOCATION")))
              {
                v16 = 62;
              }
              else
              {
                v16 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_144;
              v16 = objc_msgSend(v14, "intValue");
            }
            objc_msgSend(v6, "addAddedAmenities:", v16);
LABEL_144:
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (!v11)
          {
LABEL_146:

            v5 = v31;
            a3 = v29;
            v8 = v28;
            break;
          }
        }
      }

      if (a3)
        v17 = CFSTR("removedAmenities");
      else
        v17 = CFSTR("removed_amenities");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v30 = v18;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (!v20)
          goto LABEL_290;
        v21 = v20;
        v22 = *(_QWORD *)v33;
        while (1)
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = v24;
              if ((objc_msgSend(v25, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
              {
                v26 = 0;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ACCEPTS_CREDIT_CARDS")) & 1) != 0)
              {
                v26 = 1;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("WHEELCHAIR_ACCESSIBLE")) & 1) != 0)
              {
                v26 = 2;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("GOOD_FOR_KIDS")) & 1) != 0)
              {
                v26 = 3;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_DELIVERY")) & 1) != 0)
              {
                v26 = 4;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ALLOWS_PETS")) & 1) != 0)
              {
                v26 = 5;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("OPEN_24_HOURS")) & 1) != 0)
              {
                v26 = 6;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FITNESS_CENTER")) & 1) != 0)
              {
                v26 = 7;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FREE_BREAKFAST")) & 1) != 0)
              {
                v26 = 8;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SPA")) & 1) != 0)
              {
                v26 = 9;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SWIMMING_POOL")) & 1) != 0)
              {
                v26 = 10;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_WIFI")) & 1) != 0)
              {
                v26 = 11;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FREE_WIFI")) & 1) != 0)
              {
                v26 = 12;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FREE_INTERNET")) & 1) != 0)
              {
                v26 = 13;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SHUTTLE_BUS")) & 1) != 0)
              {
                v26 = 14;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_AIRPORT_TRANSPORTATION")) & 1) != 0)
              {
                v26 = 15;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_PARKING")) & 1) != 0)
              {
                v26 = 16;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_PARKING_GARAGE")) & 1) != 0)
              {
                v26 = 17;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FREE_PARKING")) & 1) != 0)
              {
                v26 = 18;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("SMOKING_ALLOWED")) & 1) != 0)
              {
                v26 = 19;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("TAKES_RESERVATIONS")) & 1) != 0)
              {
                v26 = 20;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ACCEPTS_APPLE_PAY")) & 1) != 0)
              {
                v26 = 21;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_GENDER_NEUTRAL_RESTROOM")) & 1) != 0)
              {
                v26 = 22;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_TAKE_OUT")) & 1) != 0)
              {
                v26 = 23;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("BY_APPOINTMENT_ONLY")) & 1) != 0)
              {
                v26 = 24;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("GOOD_FOR_GROUPS")) & 1) != 0)
              {
                v26 = 25;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SCENIC_VIEW")) & 1) != 0)
              {
                v26 = 26;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_OUTDOOR_SEATING")) & 1) != 0)
              {
                v26 = 27;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_WATERFRONT")) & 1) != 0)
              {
                v26 = 28;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_BEACHFRONT")) & 1) != 0)
              {
                v26 = 29;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("ALLOWS_DOGS")) & 1) != 0)
              {
                v26 = 30;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_DRIVE_THROUGH")) & 1) != 0)
              {
                v26 = 31;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FULL_BAR")) & 1) != 0)
              {
                v26 = 32;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_VEGETARIAN_OPTIONS")) & 1) != 0)
              {
                v26 = 33;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_VEGAN_OPTIONS")) & 1) != 0)
              {
                v26 = 34;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_GLUTENFREE_OPTIONS")) & 1) != 0)
              {
                v26 = 35;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SOY_FREE_OPTIONS")) & 1) != 0)
              {
                v26 = 36;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_HALAL_OPTIONS")) & 1) != 0)
              {
                v26 = 37;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_DAIRY_FREE_OPTIONS")) & 1) != 0)
              {
                v26 = 38;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_MEETING_ROOMS")) & 1) != 0)
              {
                v26 = 39;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("NON_SMOKING_THROUGHOUT")) & 1) != 0)
              {
                v26 = 40;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_NON_SMOKING_ROOMS")) & 1) != 0)
              {
                v26 = 41;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_FAMILY_ROOMS")) & 1) != 0)
              {
                v26 = 42;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_BAR_LOUNGE")) & 1) != 0)
              {
                v26 = 43;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_RESTAURANT")) & 1) != 0)
              {
                v26 = 44;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_LAUNDRY_SERVICE")) & 1) != 0)
              {
                v26 = 45;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_LARGE_TABLES")) & 1) != 0)
              {
                v26 = 46;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_PRIVATE_ROOMS")) & 1) != 0)
              {
                v26 = 47;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_HIGH_CHAIRS")) & 1) != 0)
              {
                v26 = 48;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SELF_ORDERING_ONLINE")) & 1) != 0)
              {
                v26 = 49;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_ONLINE_QUEUING")) & 1) != 0)
              {
                v26 = 50;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_SEATING_FOR_COUPLES")) & 1) != 0)
              {
                v26 = 51;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_CHILDREN_DISCOUNT")) & 1) != 0)
              {
                v26 = 52;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HAS_IMAX")) & 1) != 0)
              {
                v26 = 53;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("DEVICE_TRADE_IN_FOR_CREDIT")) & 1) != 0)
              {
                v26 = 54;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("FREE_TODAY_AT_APPLE_SESSIONS")) & 1) != 0)
              {
                v26 = 55;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("SMALL_BUSINESS_SOLUTIONS")) & 1) != 0)
              {
                v26 = 56;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("HARDWARE_REPAIRS_AND_SUPPORT")) & 1) != 0)
              {
                v26 = 57;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("GENIUS_BAR_WALK_INS")) & 1) != 0)
              {
                v26 = 58;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_SERVICE_PROVIDER")) & 1) != 0)
              {
                v26 = 59;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("OFFERS_SAME_DAY_IPHONE_SCREEN_REPAIR")) & 1) != 0)
              {
                v26 = 60;
              }
              else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("WALK_IN_REPAIRS")) & 1) != 0)
              {
                v26 = 61;
              }
              else if (objc_msgSend(v25, "isEqualToString:", CFSTR("APPLE_AUTHORIZED_DROPOFF_LOCATION")))
              {
                v26 = 62;
              }
              else
              {
                v26 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_288;
              v26 = objc_msgSend(v24, "intValue");
            }
            objc_msgSend(v6, "addRemovedAmenities:", v26);
LABEL_288:
            ++v23;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (!v21)
          {
LABEL_290:

            v18 = v30;
            v5 = v31;
            break;
          }
        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEORPAmenityCorrections)initWithJSON:(id)a3
{
  return (GEORPAmenityCorrections *)-[GEORPAmenityCorrections _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_74;
    else
      v8 = (int *)&readAll__nonRecursiveTag_74;
    GEORPAmenityCorrectionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPAmenityCorrectionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPAmenityCorrectionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_removedAmenities;
  unint64_t v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "writeData:", v10);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    v5 = v11;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPAmenityCorrections readAll:](self, "readAll:", 0);
    v5 = v11;
    if (self->_addedAmenities.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v11;
        ++v6;
      }
      while (v6 < self->_addedAmenities.count);
    }
    p_removedAmenities = &self->_removedAmenities;
    if (p_removedAmenities->count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v11;
        ++v8;
      }
      while (v8 < p_removedAmenities->count);
    }
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  id *v10;

  v10 = (id *)a3;
  -[GEORPAmenityCorrections readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 16) = self->_readerMarkPos;
  *((_DWORD *)v10 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPAmenityCorrections addedAmenitiesCount](self, "addedAmenitiesCount"))
  {
    objc_msgSend(v10, "clearAddedAmenities");
    v4 = -[GEORPAmenityCorrections addedAmenitiesCount](self, "addedAmenitiesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v10, "addAddedAmenities:", -[GEORPAmenityCorrections addedAmenitiesAtIndex:](self, "addedAmenitiesAtIndex:", i));
    }
  }
  if (-[GEORPAmenityCorrections removedAmenitiesCount](self, "removedAmenitiesCount"))
  {
    objc_msgSend(v10, "clearRemovedAmenities");
    v7 = -[GEORPAmenityCorrections removedAmenitiesCount](self, "removedAmenitiesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v10, "addRemovedAmenities:", -[GEORPAmenityCorrections removedAmenitiesAtIndex:](self, "removedAmenitiesAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  PBDataReader *reader;
  PBDataReader *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v6 = reader;
  objc_sync_enter(v6);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v6);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPAmenityCorrections readAll:](self, "readAll:", 0);
    PBRepeatedInt32Copy();
    PBRepeatedInt32Copy();
    return v4;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPAmenityCorrectionsReadAllFrom((uint64_t)v4, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEORPAmenityCorrections readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual()))
  {
    IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2;

  -[GEORPAmenityCorrections readAll:](self, "readAll:", 1);
  v2 = PBRepeatedInt32Hash();
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = objc_msgSend(v10, "addedAmenitiesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPAmenityCorrections addAddedAmenities:](self, "addAddedAmenities:", objc_msgSend(v10, "addedAmenitiesAtIndex:", i));
  }
  v7 = objc_msgSend(v10, "removedAmenitiesCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[GEORPAmenityCorrections addRemovedAmenities:](self, "addRemovedAmenities:", objc_msgSend(v10, "removedAmenitiesAtIndex:", j));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
