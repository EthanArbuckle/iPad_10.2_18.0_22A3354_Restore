@implementation GEOComposedTrafficSignal

- (GEOComposedTrafficSignal)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 trafficSignal:(id)a6 onRoute:(id)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  GEOComposedTrafficSignal *v17;
  objc_super v19;

  v13 = a6;
  v14 = a7;
  v15 = a3;
  objc_msgSend(v13, "position");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedTrafficSignal;
  v17 = -[GEOComposedEnrouteNotice initWithEnrouteNotice:enrouteNoticeIndex:legIndex:onRoute:withPosition:](&v19, sel_initWithEnrouteNotice_enrouteNoticeIndex_legIndex_onRoute_withPosition_, v15, a4, a5, v14, v16);

  if (v17)
    objc_storeStrong((id *)&v17->_trafficSignal, a6);

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
      v6 = off_1E1C0CA90[(int)v5];
    }
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[GEOTrafficSignal hasType](self->_trafficSignal, "hasType"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = -[GEOTrafficSignal type](self->_trafficSignal, "type");
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C0CAB0[(int)v9];
    }
    objc_msgSend(v8, "stringWithFormat:", CFSTR("[%@]"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (-[GEOTrafficSignal hasIdentifier](self->_trafficSignal, "hasIdentifier"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[GEOTrafficSignal identifier](self->_trafficSignal, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@)"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  if (-[GEOTrafficSignal hasPosition](self->_trafficSignal, "hasPosition"))
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[GEOTrafficSignal position](self->_trafficSignal, "position");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lat");
    v18 = v17;
    -[GEOTrafficSignal position](self->_trafficSignal, "position");
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
  return -[GEOTrafficSignal position](self->_trafficSignal, "position");
}

- (int)type
{
  return -[GEOTrafficSignal type](self->_trafficSignal, "type");
}

- (BOOL)hasCountryCode
{
  return -[GEOTrafficSignal hasCountryCodeStyleId](self->_trafficSignal, "hasCountryCodeStyleId");
}

- (unsigned)countryCode
{
  return -[GEOTrafficSignal countryCodeStyleId](self->_trafficSignal, "countryCodeStyleId");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTrafficSignal)initWithCoder:(id)a3
{
  id v4;
  GEOComposedTrafficSignal *v5;
  uint64_t v6;
  GEOTrafficSignal *trafficSignal;
  GEOComposedTrafficSignal *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedTrafficSignal;
  v5 = -[GEOComposedEnrouteNotice initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trafficSignal"));
    v6 = objc_claimAutoreleasedReturnValue();
    trafficSignal = v5->_trafficSignal;
    v5->_trafficSignal = (GEOTrafficSignal *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTrafficSignal;
  v4 = a3;
  -[GEOComposedEnrouteNotice encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_trafficSignal, CFSTR("_trafficSignal"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficSignal, 0);
}

@end
