@implementation GEOResultRefinementTime

- (GEOResultRefinementTime)initWithDisplayName:(id)a3 timeStamp:(double)a4 metadata:(id)a5 isSelected:(BOOL)a6 isNextDay:(BOOL)a7
{
  id v13;
  id v14;
  GEOResultRefinementTime *v15;
  GEOResultRefinementTime *v16;
  objc_super v18;

  v13 = a3;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GEOResultRefinementTime;
  v15 = -[GEOResultRefinementTime init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    v16->_timeStamp = a4;
    objc_storeStrong((id *)&v16->_metadata, a5);
    v16->_isSelected = a6;
    v16->_isNextDay = a7;
  }

  return v16;
}

- (GEOResultRefinementTime)initWithResultRefinementTime:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  GEOResultRefinementTime *v10;

  v4 = a3;
  -[GEOPDResultRefinementTime displayName]((id *)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = *((double *)v4 + 5);
    -[GEOPDResultRefinementTime metadata]((id *)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *((_BYTE *)v4 + 60) != 0;
    v9 = *((_BYTE *)v4 + 61) != 0;
  }
  else
  {
    -[GEOPDResultRefinementTime metadata](0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = 0;
    v6 = 0.0;
  }

  v10 = -[GEOResultRefinementTime initWithDisplayName:timeStamp:metadata:isSelected:isNextDay:](self, "initWithDisplayName:timeStamp:metadata:isSelected:isNextDay:", v5, v7, v8, v9, v6);
  return v10;
}

- (id)convertToGEOPDResultRefinementTime
{
  GEOPDResultRefinementTime *v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = objc_alloc_init(GEOPDResultRefinementTime);
  v4 = -[GEOResultRefinementTime isSelected](self, "isSelected");
  if (v3)
  {
    *(_BYTE *)&v3->_flags |= 0x40u;
    *(_BYTE *)&v3->_flags |= 2u;
    v3->_isSelected = v4;
  }
  -[GEOResultRefinementTime displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementTime setDisplayName:]((uint64_t)v3, v5);

  -[GEOResultRefinementTime metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementTime setMetadata:]((uint64_t)v3, v6);

  -[GEOResultRefinementTime timeStamp](self, "timeStamp");
  if (v3)
  {
    *(_BYTE *)&v3->_flags |= 0x40u;
    *(_BYTE *)&v3->_flags |= 1u;
    v3->_timestamp = v7;
    v8 = -[GEOResultRefinementTime isNextDay](self, "isNextDay");
    *(_BYTE *)&v3->_flags |= 0x40u;
    *(_BYTE *)&v3->_flags |= 4u;
    v3->_usedNextDayForFilteration = v8;
  }
  else
  {
    -[GEOResultRefinementTime isNextDay](self, "isNextDay");
  }
  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (BOOL)isNextDay
{
  return self->_isNextDay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
