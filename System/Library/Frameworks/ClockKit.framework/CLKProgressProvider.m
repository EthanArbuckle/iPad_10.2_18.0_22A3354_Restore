@implementation CLKProgressProvider

- (CLKProgressProvider)init
{
  CLKProgressProvider *v2;
  CLKProgressProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKProgressProvider;
  v2 = -[CLKProgressProvider init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CLKProgressProvider _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  NSMutableDictionary *v3;
  NSMutableDictionary *updateHandlersByToken;

  self->_paused = 1;
  self->_backgroundRingAlpha = -1.0;
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  updateHandlersByToken = self->_updateHandlersByToken;
  self->_updateHandlersByToken = v3;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_timerToken)
  {
    +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_timerToken);

  }
  v4.receiver = self;
  v4.super_class = (Class)CLKProgressProvider;
  -[CLKProgressProvider dealloc](&v4, sel_dealloc);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[CLKProgressProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
  }
}

- (id)startUpdatesWithHandler:(id)a3
{
  void *v4;
  unint64_t nextUpdateToken;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  nextUpdateToken = self->_nextUpdateToken;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", nextUpdateToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_nextUpdateToken;
  v8 = (void *)objc_msgSend(v6, "copy");

  v9 = (void *)MEMORY[0x212BDBEAC](v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updateHandlersByToken, "setObject:forKeyedSubscript:", v9, v7);

  -[CLKProgressProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
  return v7;
}

- (void)stopUpdatesForToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_updateHandlersByToken, "removeObjectForKey:", a3);
  -[CLKProgressProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
}

- (BOOL)validate
{
  return 1;
}

- (void)finalize
{
  self->_finalized = 1;
}

- (int64_t)timeTravelUpdateFrequency
{
  if (-[CLKProgressProvider _needsUpdates](self, "_needsUpdates"))
    return 2;
  else
    return 0;
}

- (void)_maybeStartOrStopUpdates
{
  void *v3;
  uint64_t v4;
  CLKClockTimerToken *v5;
  CLKClockTimerToken *timerToken;
  void *v7;
  CLKClockTimerToken *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (-[NSMutableDictionary count](self->_updateHandlersByToken, "count")
    && !self->_paused
    && -[CLKProgressProvider _needsUpdates](self, "_needsUpdates"))
  {
    if (!self->_timerToken)
    {
      objc_initWeak(&location, self);
      +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = MEMORY[0x24BDAC760];
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke;
      v11[3] = &unk_24CBF9D60;
      objc_copyWeak(&v12, &location);
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke_5;
      v9[3] = &unk_24CBF9D88;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v3, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 1, v11, v9);
      v5 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      timerToken = self->_timerToken;
      self->_timerToken = v5;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_timerToken)
  {
    +[CLKClockTimer sharedInstance](CLKClockTimer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopUpdatesForToken:", self->_timerToken);

    v8 = self->_timerToken;
    self->_timerToken = 0;

  }
}

void __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_update");

}

id __47__CLKProgressProvider__maybeStartOrStopUpdates__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_update
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_updateHandlersByToken, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_5);
  -[CLKProgressProvider _maybeStartOrStopUpdates](self, "_maybeStartOrStopUpdates");
}

uint64_t __30__CLKProgressProvider__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  if (self->_finalized)
    return self;
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTintColor:", self->_tintColor);
  objc_msgSend(v4, "setBackgroundRingAlpha:", self->_backgroundRingAlpha);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UIColor *tintColor;
  void *v6;
  double backgroundRingAlpha;
  double v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    tintColor = self->_tintColor;
    objc_msgSend(v4, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (CLKEqualObjects(tintColor, v6))
    {
      backgroundRingAlpha = self->_backgroundRingAlpha;
      objc_msgSend(v4, "backgroundRingAlpha");
      v9 = CLKFloatEqualsFloat(backgroundRingAlpha, v8);
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

- (unint64_t)hash
{
  double v3;
  void *v4;
  unint64_t v5;

  v3 = (double)(unint64_t)-[UIColor hash](self->_tintColor, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_backgroundRingAlpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)((double)(unint64_t)objc_msgSend(v4, "hash") * 100.0 + v3 * 1000.0);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *tintColor;
  id v5;
  id v6;

  tintColor = self->_tintColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tintColor, CFSTR("TintColor"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_backgroundRingAlpha);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("BackgroundRingAlpha"));

}

- (CLKProgressProvider)initWithCoder:(id)a3
{
  id v4;
  CLKProgressProvider *v5;
  CLKProgressProvider *v6;
  uint64_t v7;
  UIColor *tintColor;
  void *v9;
  float v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLKProgressProvider;
  v5 = -[CLKProgressProvider init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CLKProgressProvider _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TintColor"));
    v7 = objc_claimAutoreleasedReturnValue();
    tintColor = v6->_tintColor;
    v6->_tintColor = (UIColor *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BackgroundRingAlpha"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v6->_backgroundRingAlpha = v10;

  }
  return v6;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIColor JSONObjectRepresentation](self->_tintColor, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("tintColor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_backgroundRingAlpha);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("backgroundAlpha"));

  return v4;
}

- (BOOL)_needsUpdates
{
  return 0;
}

- (double)_progressFractionForNow:(id)a3
{
  return 0.0;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)backgroundRingAlpha
{
  return self->_backgroundRingAlpha;
}

- (void)setBackgroundRingAlpha:(double)a3
{
  self->_backgroundRingAlpha = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);
  objc_storeStrong((id *)&self->_updateHandlersByToken, 0);
}

@end
