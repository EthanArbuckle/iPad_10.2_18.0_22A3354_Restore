@implementation GKSupplementaryViewMetrics

+ (id)supplementaryMetrics
{
  return objc_alloc_init(GKSupplementaryViewMetrics);
}

- (GKSupplementaryViewMetrics)init
{
  GKSupplementaryViewMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKSupplementaryViewMetrics;
  result = -[GKSupplementaryViewMetrics init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_desiredWidth = xmmword_1AB7F7E80;
    result->_animateWithSection = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setDesiredWidth:", self->_desiredWidth);
    objc_msgSend(v5, "setDesiredHeight:", self->_desiredHeight);
    objc_msgSend(v5, "setShouldPin:", self->_shouldPin);
    objc_msgSend(v5, "setShouldPinGlobal:", self->_shouldPinGlobal);
    objc_msgSend(v5, "setKind:", self->_kind);
    objc_msgSend(v5, "setReusableViewClass:", self->_reusableViewClass);
    objc_msgSend(v5, "setConfigurator:", self->_configurator);
    objc_msgSend(v5, "setTarget:", self->_target);
    objc_msgSend(v5, "setHidden:", self->_hidden);
    objc_msgSend(v5, "setGlobalSectionRange:", self->_globalSectionRange.location, self->_globalSectionRange.length);
    objc_msgSend(v5, "setAnimateWithSection:", self->_animateWithSection);
    objc_msgSend(v5, "setShouldUseGlobalIndexing:", self->_shouldUseGlobalIndexing);
  }
  return v5;
}

- (id)localDescription
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  const char *configurator;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  if (self->_desiredWidth == 1.79769313e308)
  {
    v3 = CFSTR("*");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_desiredHeight == 1.79769313e308)
  {
    v4 = CFSTR("*");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_target)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" <%@:%p>"), objc_opt_class(), self->_target);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E59EB978;
  }
  if (self->_reusableViewClass)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), self->_reusableViewClass);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E59EB978;
  }
  configurator = self->_configurator;
  if (configurator)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %s"), sel_getName(configurator));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E59EB978;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = objc_opt_class();
  _gkRangeFromToDescription(CFSTR(" sect:"), self->_globalSectionRange.location, self->_globalSectionRange.length);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (self->_shouldPin)
    v13 = CFSTR(" pin");
  else
    v13 = &stru_1E59EB978;
  if (self->_hidden)
    v14 = CFSTR(" hidden");
  else
    v14 = &stru_1E59EB978;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@:%p%@ %@%@ size:{%@, %@} kind:%@%@%@%@"), v10, self, v11, v13, v14, v3, v4, self->_kind, v6, v5, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (CGSize)sizeForCollectionView:(id)a3
{
  double desiredWidth;
  double desiredHeight;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  desiredWidth = self->_desiredWidth;
  desiredHeight = self->_desiredHeight;
  objc_msgSend(a3, "bounds");
  if (desiredWidth == 1.79769313e308)
    v7 = v5;
  else
    v7 = desiredWidth;
  if (desiredHeight == 1.79769313e308)
    v8 = v6;
  else
    v8 = desiredHeight;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)desiredWidth
{
  return self->_desiredWidth;
}

- (void)setDesiredWidth:(double)a3
{
  self->_desiredWidth = a3;
}

- (double)desiredHeight
{
  return self->_desiredHeight;
}

- (void)setDesiredHeight:(double)a3
{
  self->_desiredHeight = a3;
}

- (BOOL)shouldPin
{
  return self->_shouldPin;
}

- (void)setShouldPin:(BOOL)a3
{
  self->_shouldPin = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (Class)reusableViewClass
{
  return self->_reusableViewClass;
}

- (void)setReusableViewClass:(Class)a3
{
  self->_reusableViewClass = a3;
}

- (SEL)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(SEL)a3
{
  self->_configurator = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  self->_target = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)shouldUseGlobalIndexing
{
  return self->_shouldUseGlobalIndexing;
}

- (void)setShouldUseGlobalIndexing:(BOOL)a3
{
  self->_shouldUseGlobalIndexing = a3;
}

- (BOOL)shouldPinGlobal
{
  return self->_shouldPinGlobal;
}

- (void)setShouldPinGlobal:(BOOL)a3
{
  self->_shouldPinGlobal = a3;
}

- (_NSRange)globalSectionRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_globalSectionRange.length;
  location = self->_globalSectionRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setGlobalSectionRange:(_NSRange)a3
{
  self->_globalSectionRange = a3;
}

- (int64_t)animateWithSection
{
  return self->_animateWithSection;
}

- (void)setAnimateWithSection:(int64_t)a3
{
  self->_animateWithSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
