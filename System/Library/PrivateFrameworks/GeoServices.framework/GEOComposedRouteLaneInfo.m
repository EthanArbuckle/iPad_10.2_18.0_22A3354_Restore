@implementation GEOComposedRouteLaneInfo

- (GEOComposedRouteLaneInfo)initWithLaneInfo:(id)a3
{
  id v4;
  GEOComposedRouteLaneInfo *v5;
  id v6;
  unint64_t i;
  void *v8;
  GEOComposedRouteLaneDirectionInfo *v9;
  GEOComposedRouteLaneInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteLaneInfo;
  v5 = -[GEOComposedRouteLaneInfo init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i < objc_msgSend(v4, "arrowsCount"); ++i)
    {
      objc_msgSend(v4, "arrowAtIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[GEOComposedRouteLaneDirectionInfo initWithLaneArrowHead:]([GEOComposedRouteLaneDirectionInfo alloc], "initWithLaneArrowHead:", v8);
      if (v9)
        objc_msgSend(v6, "addObject:", v9);

    }
    objc_storeStrong((id *)&v5->_directions, v6);
    v5->_good = objc_msgSend(v4, "supportsManeuver");
    v5->_hov = objc_msgSend(v4, "hov");
    v5->_preferred = objc_msgSend(v4, "preferredForMultipleManeuvers");
    v10 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteLaneInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteLaneInfo *v5;
  uint64_t v6;
  NSArray *directions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedRouteLaneInfo;
  v5 = -[GEOComposedRouteLaneInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_directions"));
    v6 = objc_claimAutoreleasedReturnValue();
    directions = v5->_directions;
    v5->_directions = (NSArray *)v6;

    v5->_good = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_good"));
    v5->_hov = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hov"));
    v5->_preferred = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_preferred"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_directions, CFSTR("_directions"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_good, CFSTR("_good"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hov, CFSTR("_hov"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_preferred, CFSTR("_preferred"));

}

- (BOOL)hasDirections
{
  return -[NSArray count](self->_directions, "count") != 0;
}

- (BOOL)isLaneForManeuver
{
  return self->_good;
}

- (BOOL)isPreferredLaneForManeuver
{
  return self->_preferred;
}

- (BOOL)isHOVLane
{
  return self->_hov;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOComposedRouteLaneInfo directions](self, "directions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = ((v4 << 6)
      + (v4 >> 2)
      + -[GEOComposedRouteLaneInfo isLaneForManeuver](self, "isLaneForManeuver")
      - 0x61C8864680B583EBLL) ^ v4;
  if (-[GEOComposedRouteLaneInfo isHOVLane](self, "isHOVLane"))
    v6 = 0x9E3779B97F4A7C16;
  else
    v6 = 0x9E3779B97F4A7C15;
  v7 = (v6 + (v5 << 6) + (v5 >> 2)) ^ v5;
  if (-[GEOComposedRouteLaneInfo isPreferredLaneForManeuver](self, "isPreferredLaneForManeuver"))
    v8 = 0x9E3779B97F4A7C16;
  else
    v8 = 0x9E3779B97F4A7C15;
  return (v8 + (v7 << 6) + (v7 >> 2)) ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  GEOComposedRouteLaneInfo *v4;
  GEOComposedRouteLaneInfo *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v14;

  v4 = (GEOComposedRouteLaneInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[GEOComposedRouteLaneInfo hasDirections](self, "hasDirections");
      if (v6 != -[GEOComposedRouteLaneInfo hasDirections](v5, "hasDirections"))
        goto LABEL_8;
      if (-[GEOComposedRouteLaneInfo hasDirections](self, "hasDirections"))
      {
        -[GEOComposedRouteLaneInfo directions](self, "directions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOComposedRouteLaneInfo directions](v5, "directions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if ((v9 & 1) == 0)
          goto LABEL_8;
      }
      v10 = -[GEOComposedRouteLaneInfo isLaneForManeuver](self, "isLaneForManeuver");
      if (v10 == -[GEOComposedRouteLaneInfo isLaneForManeuver](v5, "isLaneForManeuver")
        && (v11 = -[GEOComposedRouteLaneInfo isHOVLane](self, "isHOVLane"),
            v11 == -[GEOComposedRouteLaneInfo isHOVLane](v5, "isHOVLane")))
      {
        v14 = -[GEOComposedRouteLaneInfo isPreferredLaneForManeuver](self, "isPreferredLaneForManeuver");
        v12 = v14 ^ -[GEOComposedRouteLaneInfo isPreferredLaneForManeuver](v5, "isPreferredLaneForManeuver") ^ 1;
      }
      else
      {
LABEL_8:
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (NSArray)directions
{
  return self->_directions;
}

- (void)setDirections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directions, 0);
}

@end
