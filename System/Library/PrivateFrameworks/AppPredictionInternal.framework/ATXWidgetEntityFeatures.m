@implementation ATXWidgetEntityFeatures

- (ATXWidgetEntityFeatures)init
{
  ATXWidgetEntityFeatures *v2;
  ATXWidgetEntityFeatures *v3;
  NSNumber *parentAppScore;
  NSNumber *parentAppGlobalPrior;
  NSNumber *widgetGlobalPrior;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXWidgetEntityFeatures;
  v2 = -[ATXWidgetEntityFeatures init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    parentAppScore = v2->_parentAppScore;
    v2->_parentAppScore = (NSNumber *)&unk_1E83CD300;

    parentAppGlobalPrior = v3->_parentAppGlobalPrior;
    v3->_parentAppGlobalPrior = (NSNumber *)&unk_1E83CD300;

    widgetGlobalPrior = v3->_widgetGlobalPrior;
    v3->_widgetGlobalPrior = (NSNumber *)&unk_1E83CD300;

  }
  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXWidgetEntityFeatures *v5;
  uint64_t v6;
  NSNumber *parentAppScore;
  uint64_t v8;
  NSNumber *parentAppGlobalPrior;
  uint64_t v10;
  NSNumber *widgetGlobalPrior;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetEntityFeatures;
  v5 = -[ATXWidgetEntityFeatures init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentAppScore"));
    v6 = objc_claimAutoreleasedReturnValue();
    parentAppScore = v5->_parentAppScore;
    v5->_parentAppScore = (NSNumber *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("parentAppGlobalPrior"));
    v8 = objc_claimAutoreleasedReturnValue();
    parentAppGlobalPrior = v5->_parentAppGlobalPrior;
    v5->_parentAppGlobalPrior = (NSNumber *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("widgetGlobalPrior"));
    v10 = objc_claimAutoreleasedReturnValue();
    widgetGlobalPrior = v5->_widgetGlobalPrior;
    v5->_widgetGlobalPrior = (NSNumber *)v10;

  }
  return v5;
}

- (id)jsonRepresentation
{
  __int128 v2;
  _QWORD v4[3];
  __int128 v5;
  NSNumber *widgetGlobalPrior;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)&self->_parentAppScore;
  v4[0] = CFSTR("parentAppScore");
  v4[1] = CFSTR("parentAppGlobalPrior");
  v5 = v2;
  v4[2] = CFSTR("widgetGlobalPrior");
  widgetGlobalPrior = self->_widgetGlobalPrior;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)parentAppScore
{
  return self->_parentAppScore;
}

- (void)setParentAppScore:(id)a3
{
  objc_storeStrong((id *)&self->_parentAppScore, a3);
}

- (NSNumber)parentAppGlobalPrior
{
  return self->_parentAppGlobalPrior;
}

- (void)setParentAppGlobalPrior:(id)a3
{
  objc_storeStrong((id *)&self->_parentAppGlobalPrior, a3);
}

- (NSNumber)widgetGlobalPrior
{
  return self->_widgetGlobalPrior;
}

- (void)setWidgetGlobalPrior:(id)a3
{
  objc_storeStrong((id *)&self->_widgetGlobalPrior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetGlobalPrior, 0);
  objc_storeStrong((id *)&self->_parentAppGlobalPrior, 0);
  objc_storeStrong((id *)&self->_parentAppScore, 0);
}

@end
