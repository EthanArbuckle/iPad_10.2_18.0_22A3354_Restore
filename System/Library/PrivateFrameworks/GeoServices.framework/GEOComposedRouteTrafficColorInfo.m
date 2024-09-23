@implementation GEOComposedRouteTrafficColorInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteTrafficColorInfo)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteTrafficColorInfo *v5;
  double v6;
  const void *v7;
  size_t v8;
  unint64_t v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedRouteTrafficColorInfo;
  v5 = -[GEOComposedRouteTrafficColorInfo init](&v11, sel_init);
  if (v5)
  {
    v5->_color = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_color"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_offsetMeters"));
    v5->_offsetMeters = v6;
    v10 = 0;
    v7 = (const void *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_routeCoordinate"), &v10);
    if (v10)
    {
      if (v7)
      {
        if (v10 >= 8)
          v8 = 8;
        else
          v8 = v10;
        memcpy(&v5->_routeCoordinate, v7, v8);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t color;
  id v5;

  color = self->_color;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", color, CFSTR("_color"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_offsetMeters"), self->_offsetMeters);
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_routeCoordinate, 8, CFSTR("_routeCoordinate"));

}

- (id)description
{
  void *v2;
  uint64_t v3;
  double offsetMeters;
  uint64_t index;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (int)(float)(self->_routeCoordinate.offset * 100.0);
  offsetMeters = self->_offsetMeters;
  index = self->_routeCoordinate.index;
  -[GEOComposedRouteTrafficColorInfo _stringForColor:](self, "_stringForColor:", self->_color);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[%u.%d | %gm] %@"), index, v3, *(_QWORD *)&offsetMeters, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_stringForColor:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Black");
  else
    return off_1E1C11B60[a3 - 1];
}

- (unint64_t)color
{
  return self->_color;
}

- (void)setColor:(unint64_t)a3
{
  self->_color = a3;
}

- (double)offsetMeters
{
  return self->_offsetMeters;
}

- (void)setOffsetMeters:(double)a3
{
  self->_offsetMeters = a3;
}

- ($212C09783140BCCD23384160D545CE0D)routeCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_routeCoordinate;
}

- (void)setRouteCoordinate:(id)a3
{
  self->_routeCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

@end
