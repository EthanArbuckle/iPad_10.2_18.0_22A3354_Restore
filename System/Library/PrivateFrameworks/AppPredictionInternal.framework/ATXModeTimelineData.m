@implementation ATXModeTimelineData

- (ATXModeTimelineData)init
{
  ATXModeTimelineData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXModeTimelineData;
  v2 = -[ATXModeTimelineData init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[ATXModeTimelineData setModeTimeline:](v2, "setModeTimeline:", v3);

  }
  return v2;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("modeTimeline");
  -[ATXModeTimelineData modeTimeline](self, "modeTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)modeTimeline
{
  return self->_modeTimeline;
}

- (void)setModeTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_modeTimeline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeTimeline, 0);
}

@end
