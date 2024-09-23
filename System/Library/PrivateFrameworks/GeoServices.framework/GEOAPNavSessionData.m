@implementation GEOAPNavSessionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOAPNavSessionData)init
{
  GEOAPNavSessionData *v2;
  GEOAPNavSessionData *v3;
  NSUUID *routeId;
  NSUUID *sessionId;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAPNavSessionData;
  v2 = -[GEOAPNavSessionData init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isEV = 257;
    v2->_startTime = 0.0;
    v2->_accumulatedNavTime = 0.0;
    routeId = v2->_routeId;
    v2->_routeId = 0;

    sessionId = v3->_sessionId;
    v3->_sessionId = 0;

  }
  return v3;
}

- (GEOAPNavSessionData)initWithCoder:(id)a3
{
  id v4;
  GEOAPNavSessionData *v5;
  double v6;
  uint64_t v7;
  NSUUID *routeId;
  uint64_t v9;
  NSUUID *sessionId;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOAPNavSessionData;
  v5 = -[GEOAPNavSessionData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("a"));
    v5->_accumulatedNavTime = v6;
    v5->_isEV = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("e"));
    v5->_isPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("p"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("r"));
    v7 = objc_claimAutoreleasedReturnValue();
    routeId = v5->_routeId;
    v5->_routeId = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSUUID *)v9;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    v5->_startTime = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double accumulatedNavTime;
  id v5;

  accumulatedNavTime = self->_accumulatedNavTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("a"), accumulatedNavTime);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isEV, CFSTR("e"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPaused, CFSTR("p"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeId, CFSTR("r"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionId, CFSTR("s"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("t"), self->_startTime);

}

- (BOOL)isActive
{
  return self->_routeId && !self->_isPaused;
}

- (double)legStartTime
{
  double result;
  _BOOL4 v4;
  uint8_t v5[16];

  if (-[GEOAPNavSessionData isActive](self, "isActive"))
    return self->_startTime;
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
  result = 0.0;
  if (v4)
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [self isActive]", v5, 2u);
    return 0.0;
  }
  return result;
}

- (double)accumulatedSessionDurationAt:(double)a3
{
  double v3;

  v3 = 0.0;
  if (!self->_isPaused)
    v3 = a3 - self->_startTime;
  return v3 + self->_accumulatedNavTime;
}

- (void)startNavWithRouteId:(id)a3 isEV:(BOOL)a4 at:(double)a5
{
  NSUUID *v9;
  NSUUID *sessionId;
  id v11;

  objc_storeStrong((id *)&self->_routeId, a3);
  v11 = a3;
  self->_isEV = a4;
  self->_startTime = a5;
  self->_accumulatedNavTime = 0.0;
  self->_isPaused = 0;
  v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  sessionId = self->_sessionId;
  self->_sessionId = v9;

}

- (void)pauseNavWithRouteId:(id)a3 at:(double)a4
{
  self->_isPaused = 1;
  self->_accumulatedNavTime = self->_accumulatedNavTime + a4 - self->_startTime;
  self->_startTime = 0.0;
}

- (void)resumeNavWithRouteId:(id)a3 at:(double)a4
{
  NSUUID *v5;
  NSUUID *sessionId;

  self->_isPaused = 0;
  self->_startTime = a4;
  v5 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  sessionId = self->_sessionId;
  self->_sessionId = v5;

}

- (void)endNavWithRouteId:(id)a3 at:(double)a4
{
  NSUUID *routeId;

  routeId = self->_routeId;
  self->_routeId = 0;

  self->_accumulatedNavTime = self->_accumulatedNavTime + a4 - self->_startTime;
  self->_startTime = 0.0;
}

- (void)clearNavSession
{
  NSUUID *routeId;
  NSUUID *sessionId;

  self->_isEV = 1;
  routeId = self->_routeId;
  self->_routeId = 0;

  sessionId = self->_sessionId;
  self->_sessionId = 0;

  self->_startTime = 0.0;
}

- (BOOL)isCurrentRouteId:(id)a3
{
  return -[NSUUID isEqual:](self->_routeId, "isEqual:", a3);
}

- (void)rerollAt:(double)a3
{
  NSUUID *v5;
  NSUUID *sessionId;

  v5 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
  sessionId = self->_sessionId;
  self->_sessionId = v5;

  self->_startTime = a3;
}

- (NSUUID)routeId
{
  return self->_routeId;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (BOOL)isEV
{
  return self->_isEV;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_routeId, 0);
}

@end
