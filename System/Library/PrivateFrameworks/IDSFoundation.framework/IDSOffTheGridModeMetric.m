@implementation IDSOffTheGridModeMetric

- (IDSOffTheGridModeMetric)initWithPreviousMode:(id)a3 currentMode:(id)a4 previouslyConnected:(BOOL)a5 currentlyConnected:(BOOL)a6 duration:(id)a7
{
  id v13;
  id v14;
  id v15;
  IDSOffTheGridModeMetric *v16;
  IDSOffTheGridModeMetric *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)IDSOffTheGridModeMetric;
  v16 = -[IDSOffTheGridModeMetric init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_previousMode, a3);
    objc_storeStrong((id *)&v17->_currentMode, a4);
    v17->_previouslyConnected = a5;
    v17->_currentlyConnected = a6;
    objc_storeStrong((id *)&v17->_duration, a7);
  }

  return v17;
}

- (NSString)name
{
  return (NSString *)CFSTR("OffTheGridMode");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  double v5;
  __CFDictionary *v6;
  NSNumber *previousMode;
  NSNumber *currentMode;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  NSNumber *duration;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v3;
  previousMode = self->_previousMode;
  if (previousMode)
    CFDictionarySetValue(v3, CFSTR("previousMode"), previousMode);
  currentMode = self->_currentMode;
  if (currentMode)
    CFDictionarySetValue(v6, CFSTR("currentMode"), currentMode);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_previouslyConnected, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v6, CFSTR("previouslyConnected"), v9);

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v10, self->_currentlyConnected, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    CFDictionarySetValue(v6, CFSTR("currentlyConnected"), v12);

  duration = self->_duration;
  if (duration)
    CFDictionarySetValue(v6, CFSTR("duration"), duration);
  return (NSDictionary *)v6;
}

- (NSNumber)previousMode
{
  return self->_previousMode;
}

- (NSNumber)currentMode
{
  return self->_currentMode;
}

- (BOOL)previouslyConnected
{
  return self->_previouslyConnected;
}

- (BOOL)currentlyConnected
{
  return self->_currentlyConnected;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_currentMode, 0);
  objc_storeStrong((id *)&self->_previousMode, 0);
}

@end
