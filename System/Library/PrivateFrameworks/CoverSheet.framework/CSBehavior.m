@implementation CSBehavior

- (void)setIdleWarnMode:(int64_t)a3
{
  self->_idleWarnMode = a3;
}

- (void)setIdleTimerDuration:(int64_t)a3
{
  self->_idleTimerDuration = a3;
}

- (void)setIdleTimerMode:(int64_t)a3
{
  self->_idleTimerMode = a3;
}

- (void)addRestrictedCapabilities:(unint64_t)a3
{
  self->_restrictedCapabilities |= a3;
}

- (void)setScrollingStrategy:(int64_t)a3
{
  self->_scrollingStrategy = a3;
}

+ (id)behavior
{
  return objc_alloc_init((Class)a1);
}

- (void)unionBehavior:(id)a3
{
  id v4;
  int64_t notificationBehavior;
  uint64_t v6;
  int64_t v7;
  unint64_t restrictedCapabilities;
  int64_t scrollingStrategy;
  uint64_t v10;
  int64_t v11;
  int64_t proximityDetectionMode;
  uint64_t v13;
  int64_t v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v19;
  int64_t idleTimerDuration;
  int64_t idleTimerMode;
  uint64_t v22;
  int64_t v23;
  int64_t idleWarnMode;
  uint64_t v25;
  int64_t v26;
  id v27;

  v4 = a3;
  if (v4)
  {
    notificationBehavior = self->_notificationBehavior;
    v27 = v4;
    v6 = objc_msgSend(v4, "notificationBehavior");
    if (notificationBehavior <= v6)
      v7 = v6;
    else
      v7 = notificationBehavior;
    self->_notificationBehavior = v7;
    restrictedCapabilities = self->_restrictedCapabilities;
    self->_restrictedCapabilities = objc_msgSend(v27, "restrictedCapabilities") | restrictedCapabilities;
    scrollingStrategy = self->_scrollingStrategy;
    v10 = objc_msgSend(v27, "scrollingStrategy");
    if (scrollingStrategy <= v10)
      v11 = v10;
    else
      v11 = scrollingStrategy;
    self->_scrollingStrategy = v11;
    proximityDetectionMode = self->_proximityDetectionMode;
    v13 = objc_msgSend(v27, "proximityDetectionMode");
    if (proximityDetectionMode <= v13)
      v14 = v13;
    else
      v14 = proximityDetectionMode;
    self->_proximityDetectionMode = v14;
    v15 = v27;
    v16 = objc_opt_respondsToSelector();
    if ((v16 & 1) != 0)
      v17 = v15;
    else
      v17 = 0;
    v18 = v17;

    if ((v16 & 1) != 0)
    {
      v19 = objc_msgSend(v15, "idleTimerDuration");
      idleTimerDuration = self->_idleTimerDuration;
      idleTimerMode = self->_idleTimerMode;
      if (idleTimerDuration <= v19)
        idleTimerDuration = v19;
      self->_idleTimerDuration = idleTimerDuration;
      v22 = objc_msgSend(v15, "idleTimerMode");
      if (idleTimerMode <= v22)
        v23 = v22;
      else
        v23 = idleTimerMode;
      self->_idleTimerMode = v23;
      idleWarnMode = self->_idleWarnMode;
      v25 = objc_msgSend(v15, "idleWarnMode");
      if (idleWarnMode <= v25)
        v26 = v25;
      else
        v26 = idleWarnMode;
      self->_idleWarnMode = v26;
    }

    v4 = v27;
  }

}

- (int64_t)scrollingStrategy
{
  return self->_scrollingStrategy;
}

- (unint64_t)restrictedCapabilities
{
  return self->_restrictedCapabilities;
}

- (int64_t)proximityDetectionMode
{
  return self->_proximityDetectionMode;
}

- (int64_t)idleWarnMode
{
  return self->_idleWarnMode;
}

- (int64_t)idleTimerMode
{
  return self->_idleTimerMode;
}

- (BOOL)isEqualToBehavior:(id)a3
{
  CSBehavior *v4;
  int64_t notificationBehavior;
  int64_t idleTimerDuration;
  int64_t idleTimerMode;
  int64_t idleWarnMode;
  int64_t scrollingStrategy;
  unint64_t restrictedCapabilities;
  int64_t proximityDetectionMode;
  BOOL v12;

  v4 = (CSBehavior *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (-[CSBehavior isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (notificationBehavior = self->_notificationBehavior,
             notificationBehavior == -[CSBehavior notificationBehavior](v4, "notificationBehavior"))
         && (idleTimerDuration = self->_idleTimerDuration,
             idleTimerDuration == -[CSBehavior idleTimerDuration](v4, "idleTimerDuration"))
         && (idleTimerMode = self->_idleTimerMode, idleTimerMode == -[CSBehavior idleTimerMode](v4, "idleTimerMode"))
         && (idleWarnMode = self->_idleWarnMode, idleWarnMode == -[CSBehavior idleWarnMode](v4, "idleWarnMode"))
         && (scrollingStrategy = self->_scrollingStrategy,
             scrollingStrategy == -[CSBehavior scrollingStrategy](v4, "scrollingStrategy"))
         && (restrictedCapabilities = self->_restrictedCapabilities,
             restrictedCapabilities == -[CSBehavior restrictedCapabilities](v4, "restrictedCapabilities")))
  {
    proximityDetectionMode = self->_proximityDetectionMode;
    v12 = proximityDetectionMode == -[CSBehavior proximityDetectionMode](v4, "proximityDetectionMode");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (int64_t)notificationBehavior
{
  return self->_notificationBehavior;
}

- (void)setNotificationBehavior:(int64_t)a3
{
  self->_notificationBehavior = a3;
}

+ (id)behaviorForProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNotificationBehavior:", objc_msgSend(v4, "notificationBehavior"));
  objc_msgSend(v5, "setRestrictedCapabilities:", objc_msgSend(v4, "restrictedCapabilities"));
  objc_msgSend(v5, "setScrollingStrategy:", objc_msgSend(v4, "scrollingStrategy"));
  objc_msgSend(v5, "setProximityDetectionMode:", objc_msgSend(v4, "proximityDetectionMode"));
  v6 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v5, "setIdleTimerDuration:", objc_msgSend(v8, "idleTimerDuration"));
    objc_msgSend(v5, "setIdleTimerMode:", objc_msgSend(v8, "idleTimerMode"));
    v9 = objc_msgSend(v8, "idleWarnMode");
  }
  else
  {
    objc_msgSend(v5, "setIdleTimerDuration:", 0);
    objc_msgSend(v5, "setIdleTimerMode:", 0);
    v9 = 0;
  }
  objc_msgSend(v5, "setIdleWarnMode:", v9);

  return v5;
}

- (void)reset
{
  self->_proximityDetectionMode = 0;
  *(_OWORD *)&self->_restrictedCapabilities = 0u;
  *(_OWORD *)&self->_idleWarnMode = 0u;
  *(_OWORD *)&self->_idleTimerDuration = 0u;
}

- (BOOL)areRestrictedCapabilities:(unint64_t)a3
{
  return (a3 & ~-[CSBehavior restrictedCapabilities](self, "restrictedCapabilities")) == 0;
}

- (void)removeRestrictedCapabilities:(unint64_t)a3
{
  self->_restrictedCapabilities &= ~a3;
}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[CSBehavior descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend((id)objc_opt_class(), "behaviorForProvider:", self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSBehavior succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t scrollingStrategy;
  const __CFString *v11;
  id v12;
  unint64_t notificationBehavior;
  const __CFString *v14;
  id v15;
  void *v16;
  id v17;
  unint64_t proximityDetectionMode;
  const __CFString *v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromIdleTimerDuration();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("idleTimerDuration"));

  NSStringFromSBFIdleTimerMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("idleTimerMode"));

  NSStringFromIdleWarnMode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("idleWarnMode"));

  scrollingStrategy = self->_scrollingStrategy;
  if (scrollingStrategy > 3)
    v11 = CFSTR("(none)");
  else
    v11 = off_1E8E2F1C8[scrollingStrategy];
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("scrollingStrategy"));
  notificationBehavior = self->_notificationBehavior;
  if (notificationBehavior > 4)
    v14 = CFSTR("(none)");
  else
    v14 = off_1E8E2F1E8[notificationBehavior];
  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("notificationBehavior"));
  NSStringFromCoverSheetCapability(self->_restrictedCapabilities);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:withName:", v16, CFSTR("restrictedCapabilities"));

  proximityDetectionMode = self->_proximityDetectionMode;
  if (proximityDetectionMode > 2)
    v19 = CFSTR("(none)");
  else
    v19 = off_1E8E2F210[proximityDetectionMode];
  v20 = (id)objc_msgSend(v3, "appendObject:withName:", v19, CFSTR("proxMode"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSBehavior descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setRestrictedCapabilities:(unint64_t)a3
{
  self->_restrictedCapabilities = a3;
}

- (void)setProximityDetectionMode:(int64_t)a3
{
  self->_proximityDetectionMode = a3;
}

@end
