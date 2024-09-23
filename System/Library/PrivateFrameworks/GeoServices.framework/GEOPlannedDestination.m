@implementation GEOPlannedDestination

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPlannedDestination)init
{
  GEOPlannedDestination *v2;
  GEOPlannedDestination *v3;
  uint64_t v4;
  NSDate *expirationDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlannedDestination;
  v2 = -[GEOPlannedDestination init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_transportType = 4;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = objc_claimAutoreleasedReturnValue();
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v4;

  }
  return v3;
}

- (GEOPlannedDestination)initWithMapItemHandle:(id)a3
{
  id v5;
  GEOPlannedDestination *v6;
  GEOPlannedDestination *v7;

  v5 = a3;
  v6 = -[GEOPlannedDestination init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (GEOPlannedDestination)initWithMapItem:(id)a3
{
  id v4;
  GEOPlannedDestination *v5;
  void *v6;
  uint64_t v7;
  NSData *handle;

  v4 = a3;
  v5 = -[GEOPlannedDestination init](self, "init");
  if (v5)
  {
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleForMapItem:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSData *)v7;

  }
  return v5;
}

- (GEOPlannedDestination)initWithCoordinate:(id)a3
{
  GEOPlace *v4;
  void *v5;
  GEOPlannedDestination *v6;

  v4 = -[GEOPlace initWithLatitude:longitude:]([GEOPlace alloc], "initWithLatitude:longitude:", a3.var0, a3.var1);
  +[GEOMapItemStorage mapItemStorageForPlace:](GEOMapItemStorage, "mapItemStorageForPlace:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOPlannedDestination initWithMapItem:](self, "initWithMapItem:", v5);

  return v6;
}

- (GEOPlannedDestination)initWithCoder:(id)a3
{
  id v4;
  GEOPlannedDestination *v5;
  uint64_t v6;
  NSDate *arrivalDate;
  uint64_t v8;
  NSData *handle;
  uint64_t v10;
  NSDate *expirationDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOPlannedDestination;
  v5 = -[GEOPlannedDestination init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPlannedDestinationArrivalDateKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    arrivalDate = v5->_arrivalDate;
    v5->_arrivalDate = (NSDate *)v6;

    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GEOPlannedDestinationTransportTypeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPlannedDestinationHandleKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GEOPlannedDestinationExpirationDateKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[GEOPlannedDestination arrivalDate](self, "arrivalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("GEOPlannedDestinationArrivalDateKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[GEOPlannedDestination transportType](self, "transportType"), CFSTR("GEOPlannedDestinationTransportTypeKey"));
  -[GEOPlannedDestination handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("GEOPlannedDestinationHandleKey"));

  -[GEOPlannedDestination expirationDate](self, "expirationDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("GEOPlannedDestinationExpirationDateKey"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB3578];
  -[GEOPlannedDestination arrivalDate](self, "arrivalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v5, 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GEOPlannedDestination transportType](self, "transportType");
  if (v7 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E1C15C80[(int)v7];
  }
  v9 = (void *)MEMORY[0x1E0CB3578];
  -[GEOPlannedDestination expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v10, 1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ Arrival Date %@ | TransportType %@ | Expiration Date %@ | Handle %p }"), v6, v8, v11, self->_handle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (void)setArrivalDate:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalDate, a3);
}

- (int)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int)a3
{
  self->_transportType = a3;
}

- (NSData)handle
{
  return self->_handle;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
}

@end
