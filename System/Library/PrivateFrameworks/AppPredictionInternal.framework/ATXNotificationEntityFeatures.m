@implementation ATXNotificationEntityFeatures

- (ATXNotificationEntityFeatures)init
{
  ATXNotificationEntityFeatures *v2;
  uint64_t v3;
  NSMutableArray *secondsToEngagement;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXNotificationEntityFeatures;
  v2 = -[ATXNotificationEntityFeatures init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    secondsToEngagement = v2->_secondsToEngagement;
    v2->_secondsToEngagement = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXNotificationEntityFeatures *v5;
  uint64_t v6;
  NSMutableArray *secondsToEngagement;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationEntityFeatures;
  v5 = -[ATXNotificationEntityFeatures init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("secondsToEngagement"));
    v6 = objc_claimAutoreleasedReturnValue();
    secondsToEngagement = v5->_secondsToEngagement;
    v5->_secondsToEngagement = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)jsonRepresentation
{
  NSMutableArray *secondsToEngagement;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  secondsToEngagement = self->_secondsToEngagement;
  v4 = CFSTR("secondsToEngagement");
  v5[0] = secondsToEngagement;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSMutableArray)secondsToEngagement
{
  return self->_secondsToEngagement;
}

- (void)setSecondsToEngagement:(id)a3
{
  objc_storeStrong((id *)&self->_secondsToEngagement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsToEngagement, 0);
}

@end
