@implementation GEOFactoid

- (GEOFactoid)initWithFactoid:(id)a3
{
  _WORD *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  GEOFactoid *v10;
  BOOL v11;
  GEOFactoid *v12;
  GEOFactoid *v13;
  objc_super v15;

  v5 = a3;
  v6 = (uint64_t)v5;
  if (v5)
  {
    if ((v5[56] & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      -[GEOPDFactoid _readText]((uint64_t)v5);
      v7 = *(_QWORD *)(v6 + 72) == 0;
    }
  }
  else
  {
    v7 = 1;
  }
  -[GEOPDFactoid placeNames]((id *)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0;
  if (v9)
    v11 = 0;
  else
    v11 = v7;
  if (v6 && !v11)
  {
    -[GEOPDFactoid _readTitle](v6);
    if (*(_QWORD *)(v6 + 80))
    {
      v15.receiver = self;
      v15.super_class = (Class)GEOFactoid;
      v12 = -[GEOFactoid init](&v15, sel_init);
      v13 = v12;
      if (v12)
        objc_storeStrong((id *)&v12->_factoid, a3);
      self = v13;
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)title
{
  return -[GEOPDFactoid title]((id *)&self->_factoid->super.super.isa);
}

- (double)value
{
  GEOPDFactoid *factoid;

  factoid = self->_factoid;
  if (factoid && (*(_WORD *)&factoid->_flags & 1) != 0)
    return factoid->_number;
  else
    return 1.79769313e308;
}

- (GEOMapItemIdentifier)placeIdentifier
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDFactoid placeId]((id *)&self->_factoid->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);

  return v5;
}

- (NSString)unstructuredValue
{
  void *v3;
  id v4;
  void *v5;

  -[GEOPDFactoid text]((id *)&self->_factoid->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    -[GEOPDFactoid bestLocalizedPlaceName](self->_factoid, "bestLocalizedPlaceName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (int)semantic
{
  int result;

  result = -[GEOPDFactoid entryType]((uint64_t)self->_factoid);
  if ((result - 1) >= 5)
    return 0;
  return result;
}

- (int)unitType
{
  unsigned int v2;

  v2 = -[GEOPDFactoid unit]((uint64_t)self->_factoid) - 1;
  if (v2 > 7)
    return 0;
  else
    return dword_189CCE7D0[v2];
}

- (NSString)symbolName
{
  return -[GEOPDFactoid icon]((id *)&self->_factoid->super.super.isa);
}

- (BOOL)shouldUseStructuredData
{
  double v2;

  -[GEOFactoid value](self, "value");
  return v2 != 1.79769313e308;
}

- (BOOL)canBeDisplayedInPlaceSummary
{
  GEOPDFactoid *factoid;

  factoid = self->_factoid;
  return factoid && factoid->_canBeDisplayedInPlaceSummary;
}

- (GEOColor)color
{
  void *v3;
  GEOColor *v4;
  void *v5;
  GEOColor *v6;

  -[GEOPDFactoid color]((id *)&self->_factoid->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [GEOColor alloc];
    -[GEOPDFactoid color]((id *)&self->_factoid->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOColor initWithColor:](v4, "initWithColor:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)description
{
  return (NSString *)-[GEOPDFactoid description](self->_factoid, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoid, 0);
}

@end
