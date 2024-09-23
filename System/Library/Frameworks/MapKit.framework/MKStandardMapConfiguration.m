@implementation MKStandardMapConfiguration

- (MKStandardMapEmphasisStyle)emphasisStyle
{
  return self->_emphasisStyle;
}

- (BOOL)_allowsTerrainModePromotion
{
  return (unint64_t)(self->_emphasisStyle - 103) < 0xFFFFFFFFFFFFFFFELL;
}

+ (BOOL)_overlaysRequireModernMap:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(a1, "_overlayRequiresModernMap:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)_removeObserver:(id)a3 context:(void *)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKStandardMapConfiguration;
  v6 = a3;
  -[MKMapConfiguration _removeObserver:context:](&v7, sel__removeObserver_context_, v6, a4);
  -[MKStandardMapConfiguration removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", v6, CFSTR("emphasisStyle"), a4, v7.receiver, v7.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKStandardMapConfiguration;
  result = -[MKMapConfiguration copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_emphasisStyle;
  return result;
}

- (MKStandardMapConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKStandardMapConfiguration;
  return -[MKMapConfiguration initWithElevationStyle:](&v3, sel_initWithElevationStyle_, 0);
}

- (void)_addObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKStandardMapConfiguration;
  v8 = a3;
  -[MKMapConfiguration _addObserver:options:context:](&v9, sel__addObserver_options_context_, v8, a4, a5);
  -[MKStandardMapConfiguration addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", v8, CFSTR("emphasisStyle"), a4, a5, v9.receiver, v9.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKStandardMapConfiguration)initWithCoder:(id)a3
{
  id v4;
  MKStandardMapConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MKStandardMapConfiguration;
  v5 = -[MKMapConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_emphasisStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MKStandardMapConfigurationEmphasisStyle"));

  return v5;
}

- (MKStandardMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle
{
  MKStandardMapConfiguration *v4;
  MKStandardMapConfiguration *v5;

  v4 = -[MKStandardMapConfiguration init](self, "init");
  v5 = v4;
  if (v4)
    -[MKMapConfiguration setElevationStyle:](v4, "setElevationStyle:", elevationStyle);
  return v5;
}

- (MKStandardMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle emphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle
{
  MKStandardMapConfiguration *v6;
  MKStandardMapConfiguration *v7;

  v6 = -[MKStandardMapConfiguration init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_emphasisStyle = emphasisStyle;
    -[MKMapConfiguration setElevationStyle:](v6, "setElevationStyle:", elevationStyle);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKStandardMapConfiguration;
  v4 = a3;
  -[MKMapConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_emphasisStyle, CFSTR("MKStandardMapConfigurationEmphasisStyle"), v5.receiver, v5.super_class);

}

- (MKStandardMapConfiguration)initWithEmphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle
{
  MKStandardMapConfiguration *result;

  result = -[MKStandardMapConfiguration init](self, "init");
  if (result)
    result->_emphasisStyle = emphasisStyle;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MKStandardMapConfiguration isEqualToStandardMapConfiguration:](self, "isEqualToStandardMapConfiguration:", v4);

  return v5;
}

- (BOOL)isEqualToStandardMapConfiguration:(id)a3
{
  id v4;
  int64_t emphasisStyle;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  _BOOL4 v11;
  int v12;
  objc_super v14;

  v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)MKStandardMapConfiguration,
        -[MKMapConfiguration isEqual:](&v14, sel_isEqual_, v4))
    && (emphasisStyle = self->_emphasisStyle, emphasisStyle == objc_msgSend(v4, "emphasisStyle")))
  {
    -[MKStandardMapConfiguration pointOfInterestFilter](self, "pointOfInterestFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pointOfInterestFilter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      v11 = -[MKStandardMapConfiguration showsTraffic](self, "showsTraffic");
      v12 = v11 ^ objc_msgSend(v4, "showsTraffic") ^ 1;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (BOOL)_overlayRequiresModernMap:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_requiresModernMap");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)_overlaySupportsElevation:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_msgSend(a1, "_overlayRequiresModernMap:", v4) & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v4, "elevations") != 0;

  return v5;
}

+ (BOOL)_overlaysSupportElevation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(a1, "_overlaySupportsElevation:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)setEmphasisStyle:(MKStandardMapEmphasisStyle)emphasisStyle
{
  self->_emphasisStyle = emphasisStyle;
}

@end
