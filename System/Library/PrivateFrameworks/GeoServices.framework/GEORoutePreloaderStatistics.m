@implementation GEORoutePreloaderStatistics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORoutePreloaderStatistics)initWithDateInterval:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  id v12;
  GEORoutePreloaderStatistics *v13;
  uint64_t v14;
  NSDateInterval *dateInterval;
  GEORoutePreloaderStatistics *v16;
  objc_super v18;

  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEORoutePreloaderStatistics;
  v13 = -[GEORoutePreloaderStatistics init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    dateInterval = v13->_dateInterval;
    v13->_dateInterval = (NSDateInterval *)v14;

    v13->_transportType = a4;
    v13->_tilesPreloaded = a5;
    v13->_tilesUsed = a6;
    v13->_tilesMissed = a7;
    v16 = v13;
  }

  return v13;
}

- (GEORoutePreloaderStatistics)initWithCoder:(id)a3
{
  id v4;
  GEORoutePreloaderStatistics *v5;
  uint64_t v6;
  NSDateInterval *dateInterval;
  GEORoutePreloaderStatistics *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORoutePreloaderStatistics;
  v5 = -[GEORoutePreloaderStatistics init](&v10, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval")),
        v6 = objc_claimAutoreleasedReturnValue(),
        dateInterval = v5->_dateInterval,
        v5->_dateInterval = (NSDateInterval *)v6,
        dateInterval,
        v5->_dateInterval))
  {
    v5->_transportType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transportType"));
    v5->_tilesPreloaded = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tilesPreloaded"));
    v5->_tilesUsed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tilesUsed"));
    v5->_tilesMissed = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tilesMissed"));
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transportType, CFSTR("transportType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tilesPreloaded, CFSTR("tilesPreloaded"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tilesUsed, CFSTR("tilesUsed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tilesMissed, CFSTR("tilesMissed"));

}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (unint64_t)tilesPreloaded
{
  return self->_tilesPreloaded;
}

- (void)setTilesPreloaded:(unint64_t)a3
{
  self->_tilesPreloaded = a3;
}

- (unint64_t)tilesUsed
{
  return self->_tilesUsed;
}

- (void)setTilesUsed:(unint64_t)a3
{
  self->_tilesUsed = a3;
}

- (unint64_t)tilesMissed
{
  return self->_tilesMissed;
}

- (void)setTilesMissed:(unint64_t)a3
{
  self->_tilesMissed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
