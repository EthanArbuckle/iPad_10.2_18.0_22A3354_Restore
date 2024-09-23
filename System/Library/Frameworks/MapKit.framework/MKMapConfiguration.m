@implementation MKMapConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointOfInterestFilter, 0);
}

- (BOOL)_showsTraffic
{
  return self->_showsTraffic;
}

- (MKPointOfInterestFilter)_pointOfInterestFilter
{
  return self->_pointOfInterestFilter;
}

+ ($F9C4767691F2EDF2F3162F5FE7B1523A)_cartographicConfigurationForMapConfiguration:(SEL)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  $F9C4767691F2EDF2F3162F5FE7B1523A *result;
  id v10;

  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v10;
    v6 = objc_msgSend(v5, "emphasisStyle");
    if (!v6)
    {
LABEL_21:
      _MKCartographicConfigurationForMapType(v6, (uint64_t)retstr);

      goto LABEL_22;
    }
    if (objc_msgSend(v5, "emphasisStyle") == 1)
    {
      v6 = 5;
      goto LABEL_21;
    }
    if (objc_msgSend(v5, "emphasisStyle") == 101)
    {
      v6 = 109;
      goto LABEL_21;
    }
    if (objc_msgSend(v5, "emphasisStyle") == 102)
    {
      v6 = 110;
      goto LABEL_21;
    }

LABEL_25:
    *(_OWORD *)&retstr->var0 = xmmword_18B2A9800;
    retstr->var2 = 0;
    retstr->var3 = 0;
    *(_OWORD *)&retstr->var4 = xmmword_18B2A9880;
    retstr->var6 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "elevationStyle"))
      v7 = 4;
    else
      v7 = 2;
LABEL_13:
    _MKCartographicConfigurationForMapType(v7, (uint64_t)retstr);
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "elevationStyle"))
      v7 = 3;
    else
      v7 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_25;
  v8 = v10;
  if (!v10)
  {
    *(_QWORD *)&retstr->var6 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    goto LABEL_23;
  }
  objc_msgSend(v10, "cartographicConfiguration");
LABEL_22:
  v8 = v10;
LABEL_23:

  return result;
}

- (MKMapElevationStyle)elevationStyle
{
  return self->_elevationStyle;
}

- (void)_removeObserver:(id)a3 context:(void *)a4
{
  id v6;

  v6 = a3;
  -[MKMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("elevationStyle"), a4);
  -[MKMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("_showsTraffic"), a4);
  -[MKMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("_pointOfInterestFilter"), a4);
  -[MKMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("_showsHiking"), a4);
  -[MKMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("_showsTopographicFeatures"), a4);

}

- (void)set_showsTraffic:(BOOL)a3
{
  self->_showsTraffic = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 24) = self->_elevationStyle;
  *(_BYTE *)(v5 + 8) = self->_showsTraffic;
  *(_BYTE *)(v5 + 9) = self->_showsHiking;
  *(_BYTE *)(v5 + 10) = self->_showsTopographicFeatures;
  v6 = -[MKPointOfInterestFilter copyWithZone:](self->_pointOfInterestFilter, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (MKMapConfiguration)initWithElevationStyle:(int64_t)a3
{
  MKMapConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKMapConfiguration;
  result = -[MKMapConfiguration init](&v5, sel_init);
  if (result)
    result->_elevationStyle = a3;
  return result;
}

- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8;

  v8 = a3;
  -[MKMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("elevationStyle"), a4, a5);
  -[MKMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("_showsTraffic"), a4, a5);
  -[MKMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("_pointOfInterestFilter"), a4, a5);
  -[MKMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("_showsHiking"), a4, a5);
  -[MKMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("_showsTopographicFeatures"), a4, a5);

}

- (MKMapConfiguration)initWithCoder:(id)a3
{
  id v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  MKPointOfInterestFilter *v8;
  MKPointOfInterestFilter *pointOfInterestFilter;
  MKMapConfiguration *v10;

  v4 = a3;
  self->_elevationStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MKMapConfigurationElevationStyle"));
  v5 = CFSTR("MKMapConfigurationShowsTraffic");
  if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("MKMapConfigurationShowsTraffic")) & 1) != 0
    || (v5 = CFSTR("MKHybridMapConfigurationShowsTraffic"),
        (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKHybridMapConfigurationShowsTraffic")) & 1) != 0)
    || (v5 = CFSTR("MKStandardMapConfigurationShowsTraffic"),
        objc_msgSend(v4, "containsValueForKey:", CFSTR("MKStandardMapConfigurationShowsTraffic"))))
  {
    self->_showsTraffic = objc_msgSend(v4, "decodeBoolForKey:", v5);
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKMapConfigurationPointOfInterestFilter")))
  {
    v6 = objc_opt_class();
    v7 = CFSTR("MKMapConfigurationPointOfInterestFilter");
LABEL_11:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (MKPointOfInterestFilter *)objc_claimAutoreleasedReturnValue();
    pointOfInterestFilter = self->_pointOfInterestFilter;
    self->_pointOfInterestFilter = v8;

    goto LABEL_12;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKHybridMapConfigurationPointOfInterestFilter")))
  {
    v6 = objc_opt_class();
    v7 = CFSTR("MKHybridMapConfigurationPointOfInterestFilter");
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("MKStandardMapConfigurationPointOfInterestFilter")))
  {
    v6 = objc_opt_class();
    v7 = CFSTR("MKStandardMapConfigurationPointOfInterestFilter");
    goto LABEL_11;
  }
LABEL_12:
  self->_showsHiking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MKMapConfigurationShowsHiking"));
  self->_showsTopographicFeatures = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MKMapConfigurationShowsTopographicFeatures"));
  v10 = -[MKMapConfiguration initWithElevationStyle:](self, "initWithElevationStyle:", self->_elevationStyle);

  return v10;
}

- (void)setElevationStyle:(MKMapElevationStyle)elevationStyle
{
  self->_elevationStyle = elevationStyle;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t elevationStyle;
  id v5;

  elevationStyle = self->_elevationStyle;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", elevationStyle, CFSTR("MKMapConfigurationElevationStyle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsTraffic, CFSTR("MKMapConfigurationShowsTraffic"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsHiking, CFSTR("MKMapConfigurationShowsHiking"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_showsTopographicFeatures, CFSTR("MKMapConfigurationShowsTopographicFeatures"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pointOfInterestFilter, CFSTR("MKMapConfigurationPointOfInterestFilter"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t elevationStyle;
  int showsHiking;
  int showsTopographicFeatures;
  BOOL v9;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    elevationStyle = self->_elevationStyle;
    if (elevationStyle == objc_msgSend(v5, "elevationStyle")
      && (showsHiking = self->_showsHiking, showsHiking == objc_msgSend(v5, "_showsHiking")))
    {
      showsTopographicFeatures = self->_showsTopographicFeatures;
      v9 = showsTopographicFeatures == objc_msgSend(v5, "_showsTopographicFeatures");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setInternalStateFromMapConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKMapConfiguration set_showsTraffic:](self, "set_showsTraffic:", objc_msgSend(v4, "_showsTraffic"));
  -[MKMapConfiguration set_showsHiking:](self, "set_showsHiking:", objc_msgSend(v4, "_showsHiking"));
  -[MKMapConfiguration set_showsTopographicFeatures:](self, "set_showsTopographicFeatures:", objc_msgSend(v4, "_showsTopographicFeatures"));
  objc_msgSend(v4, "_pointOfInterestFilter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MKMapConfiguration set_pointOfInterestFilter:](self, "set_pointOfInterestFilter:", v5);
}

+ (id)_mapConfigurationWithCartographicConfiguration:(id *)a3
{
  __int128 v5;
  void *v6;
  _MKCartographicMapConfiguration *v7;
  _MKCartographicMapConfiguration *v8;
  __int128 v9;
  _MKCartographicMapConfiguration *v10;
  _OWORD v12[3];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v5 = *(_OWORD *)&a3->var2;
  v14 = *(_OWORD *)&a3->var0;
  v15 = v5;
  v16 = *(_OWORD *)&a3->var4;
  v17 = *(_QWORD *)&a3->var6;
  objc_msgSend(a1, "_potentiallyLossy_mapConfigurationWithCartographicConfiguration:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v17 = 0,
        v15 = 0u,
        v16 = 0u,
        v14 = 0u,
        objc_msgSend(a1, "_cartographicConfigurationForMapConfiguration:", v6),
        _MKCartographicConfigurationEquals((uint64_t)&v14, (uint64_t)a3)))
  {
    v7 = v6;
  }
  else
  {
    v8 = [_MKCartographicMapConfiguration alloc];
    v9 = *(_OWORD *)&a3->var2;
    v12[0] = *(_OWORD *)&a3->var0;
    v12[1] = v9;
    v12[2] = *(_OWORD *)&a3->var4;
    v13 = *(_QWORD *)&a3->var6;
    v7 = -[_MKCartographicMapConfiguration initWithCartographicConfiguration:](v8, "initWithCartographicConfiguration:", v12);
  }
  v10 = v7;

  return v10;
}

+ (id)_potentiallyLossy_mapConfigurationWithCartographicConfiguration:(id *)a3
{
  unint64_t v4;
  uint64_t v5;
  _MKCartographicMapConfiguration *v6;
  __int128 v7;
  id result;
  MKStandardMapConfiguration *v9;
  _BOOL8 v10;
  MKStandardMapConfiguration *v11;
  _BOOL8 v12;
  uint64_t v13;
  __objc2_class *v14;
  __objc2_class *v15;
  _OWORD v16[3];
  uint64_t v17;

  v4 = a3->var3 - 1;
  v5 = _MKMapTypeForCartographicConfiguration(&a3->var0);
  switch(v5)
  {
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
LABEL_2:
      v6 = [_MKCartographicMapConfiguration alloc];
      v7 = *(_OWORD *)&a3->var2;
      v16[0] = *(_OWORD *)&a3->var0;
      v16[1] = v7;
      v16[2] = *(_OWORD *)&a3->var4;
      v17 = *(_QWORD *)&a3->var6;
      result = -[_MKCartographicMapConfiguration initWithCartographicConfiguration:](v6, "initWithCartographicConfiguration:", v16);
      break;
    case 'm':
      v11 = [MKStandardMapConfiguration alloc];
      v12 = v4 < 2;
      v13 = 101;
      goto LABEL_15;
    case 'n':
      v11 = [MKStandardMapConfiguration alloc];
      v12 = v4 < 2;
      v13 = 102;
LABEL_15:
      result = -[MKStandardMapConfiguration initWithElevationStyle:emphasisStyle:](v11, "initWithElevationStyle:emphasisStyle:", v12, v13);
      break;
    default:
      switch(v5)
      {
        case 0:
          v9 = [MKStandardMapConfiguration alloc];
          v10 = v4 < 2;
          goto LABEL_13;
        case 1:
          v14 = MKImageryMapConfiguration;
          goto LABEL_9;
        case 2:
          v14 = MKHybridMapConfiguration;
LABEL_9:
          v9 = (MKStandardMapConfiguration *)[v14 alloc];
          v10 = 0;
          goto LABEL_13;
        case 3:
          v15 = MKImageryMapConfiguration;
          goto LABEL_12;
        case 4:
          v15 = MKHybridMapConfiguration;
LABEL_12:
          v9 = (MKStandardMapConfiguration *)[v15 alloc];
          v10 = 1;
LABEL_13:
          result = -[MKStandardMapConfiguration initWithElevationStyle:](v9, "initWithElevationStyle:", v10);
          break;
        case 5:
          v11 = [MKStandardMapConfiguration alloc];
          v12 = v4 < 2;
          v13 = 1;
          goto LABEL_15;
        default:
          goto LABEL_2;
      }
      break;
  }
  return result;
}

- (BOOL)_showsHiking
{
  return self->_showsHiking;
}

- (void)set_showsHiking:(BOOL)a3
{
  self->_showsHiking = a3;
}

- (BOOL)_showsTopographicFeatures
{
  return self->_showsTopographicFeatures;
}

- (void)set_showsTopographicFeatures:(BOOL)a3
{
  self->_showsTopographicFeatures = a3;
}

- (void)set_pointOfInterestFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
