@implementation MNAnnouncementPlanEvent

- (MNAnnouncementPlanEvent)initWithEvent:(id)a3 distance:(double)a4 speed:(double)a5 durations:(id)a6
{
  id v10;
  id v11;
  MNAnnouncementPlanEvent *v12;
  MNAnnouncementPlanEvent *v13;
  MNAnnouncementPlanEvent *v14;
  double v15;
  _QWORD v17[4];
  MNAnnouncementPlanEvent *v18;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MNAnnouncementPlanEvent;
  v12 = -[MNAnnouncementPlanEvent init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    -[MNAnnouncementPlanEvent setEvent:](v12, "setEvent:", v10);
    -[MNAnnouncementPlanEvent setDistance:](v13, "setDistance:", a4);
    -[MNAnnouncementPlanEvent setSpeed:](v13, "setSpeed:", a5);
    -[MNAnnouncementPlanEvent setDurations:](v13, "setDurations:", v11);
    -[MNAnnouncementPlanEvent setVariantIndex:](v13, "setVariantIndex:", 0);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__MNAnnouncementPlanEvent_initWithEvent_distance_speed_durations___block_invoke;
    v17[3] = &unk_1E61D2750;
    v14 = v13;
    v18 = v14;
    objc_msgSend(v10, "triggerDistanceForSpeed:andDuration:", v17, a5);
    -[MNAnnouncementPlanEvent setTriggerDistance:](v14, "setTriggerDistance:");
    -[MNAnnouncementPlanEvent triggerDistance](v14, "triggerDistance");
    -[MNAnnouncementPlanEvent setIncludeInPlan:](v14, "setIncludeInPlan:", v15 > 0.0);

  }
  return v13;
}

double __66__MNAnnouncementPlanEvent_initWithEvent_distance_speed_durations___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "durations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MNAnnouncementPlanEvent includeInPlan](self, "includeInPlan");
  v5 = -[MNAnnouncementPlanEvent variantIndex](self, "variantIndex");
  -[MNAnnouncementPlanEvent triggerDistance](self, "triggerDistance");
  v6 = -1.0;
  if (v7 > 0.0)
  {
    -[MNAnnouncementPlanEvent triggerDistance](self, "triggerDistance");
    v6 = v8;
  }
  if (v4)
    v9 = "YES";
  else
    v9 = "NO";
  -[MNAnnouncementPlanEvent completionDistance](self, "completionDistance");
  v11 = v10;
  -[MNAnnouncementPlanEvent event](self, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("in plan:%s variant:%lu trigger:%.2f complete:%.2f %@"), v9, v5, *(_QWORD *)&v6, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setTriggerDistance:(double)a3
{
  double v5;

  -[MNAnnouncementPlanEvent triggerDistance](self, "triggerDistance");
  if (v5 != a3)
    self->_triggerDistance = a3;
}

- (void)setVariantIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MNAnnouncementPlanEvent event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "announcements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 <= a3)
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315906;
      v10 = "-[MNAnnouncementPlanEvent setVariantIndex:]";
      v11 = 2080;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Guidance/MNAnnouncementPlanEvent.m";
      v13 = 1024;
      v14 = 73;
      v15 = 2080;
      v16 = "variantIndex < self.event.announcements.count";
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v9, 0x26u);
    }

  }
  self->_variantIndex = a3;
}

- (double)completionDistance
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[MNAnnouncementPlanEvent triggerDistance](self, "triggerDistance");
  v4 = v3;
  -[MNAnnouncementPlanEvent announcementDurations](self, "announcementDurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[MNAnnouncementPlanEvent variantIndex](self, "variantIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  -[MNAnnouncementPlanEvent speed](self, "speed");
  v10 = v4 - v8 * v9;

  return v10;
}

- (GEOComposedGuidanceEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void)setAnnouncementDurations:(id)a3
{
  objc_storeStrong((id *)&self->_announcementDurations, a3);
}

- (BOOL)includeInPlan
{
  return self->_includeInPlan;
}

- (void)setIncludeInPlan:(BOOL)a3
{
  self->_includeInPlan = a3;
}

- (unint64_t)variantIndex
{
  return self->_variantIndex;
}

- (double)triggerDistance
{
  return self->_triggerDistance;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (NSArray)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
  objc_storeStrong((id *)&self->_durations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_announcementDurations, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
