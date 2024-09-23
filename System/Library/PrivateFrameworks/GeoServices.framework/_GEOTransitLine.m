@implementation _GEOTransitLine

- (_GEOTransitLine)initWithLine:(id)a3 system:(id)a4 locationHint:(id)a5
{
  double var1;
  double var0;
  id v10;
  id v11;
  _GEOTransitLine *v12;
  _GEOTransitLine *v13;
  objc_super v15;

  var1 = a5.var1;
  var0 = a5.var0;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_GEOTransitLine;
  v12 = -[_GEOTransitLine init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_line, a3);
    objc_storeStrong((id *)&v13->_system, a4);
    v13->_locationHint.latitude = var0;
    v13->_locationHint.longitude = var1;
  }

  return v13;
}

- (unint64_t)muid
{
  return -[GEOPBTransitLine muid](self->_line, "muid");
}

- (GEOMapItemIdentifier)identifier
{
  return (GEOMapItemIdentifier *)-[GEOPBTransitLine identifierWithLocationHint:](self->_line, "identifierWithLocationHint:", self->_locationHint.latitude, self->_locationHint.longitude);
}

- (NSString)name
{
  return -[GEOPBTransitLine nameDisplayString](self->_line, "nameDisplayString");
}

- (GEOTransitSystem)system
{
  return self->_system;
}

- (unint64_t)departureTimeDisplayStyle
{
  uint64_t v3;

  if (-[GEOPBTransitLine hasPreferredDepartureTimeStyle](self->_line, "hasPreferredDepartureTimeStyle")
    && (v3 = -[GEOPBTransitLine preferredDepartureTimeStyle](self->_line, "preferredDepartureTimeStyle")
           - 1,
        v3 <= 3))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)departuresAreVehicleSpecific
{
  return -[_GEOTransitLine departureTimeDisplayStyle](self, "departureTimeDisplayStyle") == 2;
}

- (BOOL)isBus
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[GEOPBTransitLine styleAttributes](self->_line, "styleAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "key", (_QWORD)v10) == 37)
        {
          LOBYTE(v5) = objc_msgSend(v8, "value") == 700;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)-[GEOPBTransitLine artwork](self->_line, "artwork");
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOPBTransitLine modeArtwork](self->_line, "modeArtwork");
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOPBTransitLine alternateArtwork](self->_line, "alternateArtwork");
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)-[GEOPBTransitLine headerArtwork](self->_line, "headerArtwork");
}

- (BOOL)hasLineColorString
{
  return -[GEOPBTransitLine hasLineColor](self->_line, "hasLineColor");
}

- (NSString)lineColorString
{
  return -[GEOPBTransitLine lineColor](self->_line, "lineColor");
}

- (BOOL)showVehicleNumber
{
  void *v2;
  char v3;

  -[GEOPBTransitLine displayHints](self->_line, "displayHints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showVehicleNumber");

  return v3;
}

- (GEOStyleAttributes)styleAttributes
{
  return -[GEOPBTransitLine styleAttributes](self->_line, "styleAttributes");
}

- (NSArray)operatingHours
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  unsigned int v9;
  _GEOTimeRange *v10;

  v4 = -[GEOPBTransitLine operatingHoursCount](self->_line, "operatingHoursCount");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v5; ++i)
    {
      v8 = -[GEOPBTransitLine operatingHoursAtIndex:](self->_line, "operatingHoursAtIndex:", i);
      if ((~v9 & 3) == 0)
      {
        v2 = v2 & 0xFFFFFFFF00000000 | v9;
        v10 = -[_GEOTimeRange initWithPBTimeRange:]([_GEOTimeRange alloc], "initWithPBTimeRange:", v8, v2);
        objc_msgSend(v6, "addObject:", v10);

      }
    }
  }
  else
  {
    v6 = 0;
  }
  return (NSArray *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitLine)initWithCoder:(id)a3
{
  id v4;
  _GEOTransitLine *v5;
  uint64_t v6;
  GEOPBTransitLine *line;
  uint64_t v8;
  GEOTransitSystem *system;
  double v10;
  double v11;
  _GEOTransitLine *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOTransitLine;
  v5 = -[_GEOTransitLine init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_line"));
    v6 = objc_claimAutoreleasedReturnValue();
    line = v5->_line;
    v5->_line = (GEOPBTransitLine *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_system"));
    v8 = objc_claimAutoreleasedReturnValue();
    system = v5->_system;
    v5->_system = (GEOTransitSystem *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_locationHint.latitude"));
    v5->_locationHint.latitude = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_locationHint.longitude"));
    v5->_locationHint.longitude = v11;
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOPBTransitLine *line;
  id v5;

  line = self->_line;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", line, CFSTR("_line"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_system, CFSTR("_system"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_locationHint.latitude"), self->_locationHint.latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_locationHint.longitude"), self->_locationHint.longitude);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_line, 0);
}

@end
