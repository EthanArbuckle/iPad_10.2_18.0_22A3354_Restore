@implementation GEOComposedTrafficCamera

- (GEOComposedTrafficCamera)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 trafficCamera:(id)a6 onRoute:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  GEOComposedTrafficCamera *v17;
  objc_super v19;

  v13 = a6;
  v14 = a7;
  v15 = a3;
  objc_msgSend(v13, "position");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedTrafficCamera;
  v17 = -[GEOComposedEnrouteNotice initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:withPosition:](&v19, sel_initWithEnrouteNotice_enrouteNoticeIndex_legIndex_onRoute_withPosition_, v15, a4, a5, v14, v16);

  if (v17)
    objc_storeStrong((id *)&v17->_trafficCamera, a6);

  return v17;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[GEOEnrouteNotice hasType](self->super._enrouteNotice, "hasType"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = -[GEOEnrouteNotice type](self->super._enrouteNotice, "type");
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C03768[(int)v5];
    }
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[GEOTrafficCamera hasType](self->_trafficCamera, "hasType"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = -[GEOTrafficCamera type](self->_trafficCamera, "type");
    if (v9 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C03788[(int)v9];
    }
    objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@]"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (-[GEOTrafficCamera hasIdentifier](self->_trafficCamera, "hasIdentifier"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[GEOTrafficCamera identifier](self->_trafficCamera, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@)"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  if (-[GEOTrafficCamera hasPosition](self->_trafficCamera, "hasPosition"))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[GEOTrafficCamera position](self->_trafficCamera, "position");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lat");
    v18 = v17;
    -[GEOTrafficCamera position](self->_trafficCamera, "position");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lng");
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%f, %f"), v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)position
{
  return -[GEOTrafficCamera position](self->_trafficCamera, "position");
}

- (int)type
{
  return -[GEOTrafficCamera type](self->_trafficCamera, "type");
}

- (unsigned)highlightDistance
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTrafficCamera;
  if (!-[GEOComposedEnrouteNotice hasHighlightDistance](&v5, sel_hasHighlightDistance))
    return -[GEOTrafficCamera highlightDistance](self->_trafficCamera, "highlightDistance");
  v4.receiver = self;
  v4.super_class = (Class)GEOComposedTrafficCamera;
  return -[GEOComposedEnrouteNotice highlightDistance](&v4, sel_highlightDistance);
}

- (BOOL)hasSpeedLimitText
{
  return -[GEOTrafficCamera hasSpeedLimitText](self->_trafficCamera, "hasSpeedLimitText");
}

- (NSString)speedLimitText
{
  return -[GEOTrafficCamera speedLimitText](self->_trafficCamera, "speedLimitText");
}

- (BOOL)hasSpeedThreshold
{
  return -[GEOTrafficCamera hasSpeedThreshold](self->_trafficCamera, "hasSpeedThreshold");
}

- (double)speedThreshold
{
  double result;

  -[GEOTrafficCamera speedThreshold](self->_trafficCamera, "speedThreshold");
  return result;
}

- (BOOL)hasCameraPriority
{
  if (-[GEOComposedEnrouteNotice hasPriority](self, "hasPriority"))
    return -[GEOComposedEnrouteNotice hasPriority](self, "hasPriority");
  else
    return -[GEOTrafficCamera hasCameraPriority](self->_trafficCamera, "hasCameraPriority");
}

- (unsigned)cameraPriority
{
  if (-[GEOComposedEnrouteNotice hasPriority](self, "hasPriority"))
    return -[GEOComposedEnrouteNotice priority](self, "priority");
  else
    return -[GEOTrafficCamera cameraPriority](self->_trafficCamera, "cameraPriority");
}

- (BOOL)hasCountryCode
{
  return -[GEOTrafficCamera hasCountryCodeStyleId](self->_trafficCamera, "hasCountryCodeStyleId");
}

- (unsigned)countryCode
{
  return -[GEOTrafficCamera countryCodeStyleId](self->_trafficCamera, "countryCodeStyleId");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTrafficCamera)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTrafficCamera *v5;
  uint64_t v6;
  GEOTrafficCamera *trafficCamera;
  GEOComposedTrafficCamera *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedTrafficCamera;
  v5 = -[GEOComposedEnrouteNotice initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trafficCamera"));
    v6 = objc_claimAutoreleasedReturnValue();
    trafficCamera = v5->_trafficCamera;
    v5->_trafficCamera = (GEOTrafficCamera *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTrafficCamera;
  v4 = a3;
  -[GEOComposedEnrouteNotice encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_trafficCamera, CFSTR("_trafficCamera"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficCamera, 0);
}

@end
