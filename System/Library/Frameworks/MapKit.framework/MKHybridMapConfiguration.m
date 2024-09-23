@implementation MKHybridMapConfiguration

- (MKHybridMapConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKHybridMapConfiguration;
  return -[MKMapConfiguration initWithElevationStyle:](&v3, sel_initWithElevationStyle_, 0);
}

- (MKHybridMapConfiguration)initWithElevationStyle:(MKMapElevationStyle)elevationStyle
{
  MKHybridMapConfiguration *v4;
  MKHybridMapConfiguration *v5;

  v4 = -[MKHybridMapConfiguration init](self, "init");
  v5 = v4;
  if (v4)
    -[MKMapConfiguration setElevationStyle:](v4, "setElevationStyle:", elevationStyle);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[MKHybridMapConfiguration isEqualToHybridMapConfiguration:](self, "isEqualToHybridMapConfiguration:", v4);

  return v5;
}

- (BOOL)isEqualToHybridMapConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  _BOOL4 v10;
  int v11;
  objc_super v13;

  v4 = a3;
  if (v4
    && (v13.receiver = self,
        v13.super_class = (Class)MKHybridMapConfiguration,
        -[MKMapConfiguration isEqual:](&v13, sel_isEqual_, v4)))
  {
    -[MKHybridMapConfiguration pointOfInterestFilter](self, "pointOfInterestFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pointOfInterestFilter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      v10 = -[MKHybridMapConfiguration showsTraffic](self, "showsTraffic");
      v11 = v10 ^ objc_msgSend(v4, "showsTraffic") ^ 1;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

@end
