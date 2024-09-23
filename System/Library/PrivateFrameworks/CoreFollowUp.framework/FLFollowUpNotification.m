@implementation FLFollowUpNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FLFollowUpNotification)init
{
  FLFollowUpNotification *v2;
  uint64_t v3;
  NSDate *creationDate;
  uint64_t v5;
  NSSet *options;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FLFollowUpNotification;
  v2 = -[FLFollowUpNotification init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    +[FLFollowUpNotification defaultOptions](FLFollowUpNotification, "defaultOptions");
    v5 = objc_claimAutoreleasedReturnValue();
    options = v2->_options;
    v2->_options = (NSSet *)v5;

  }
  return v2;
}

+ (NSSet)defaultOptions
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("bannerAlert"), CFSTR("lockScreen"), CFSTR("notificationCenter"), 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_informativeText, CFSTR("_informativeText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleText, CFSTR("_subtitleText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unlockActionLabel, CFSTR("_unlockActionLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previousNotificationActionDate, CFSTR("_previousNotificationActionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("_creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activateAction, CFSTR("_activateAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dismissAction, CFSTR("_dismissAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clearAction, CFSTR("_clearAction"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_frequency"), self->_frequency);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sqlID, CFSTR("_sqlID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_firstNotificationDelay"), self->_firstNotificationDelay);
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("_options"));

}

- (FLFollowUpNotification)initWithCoder:(id)a3
{
  id v4;
  FLFollowUpNotification *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *informativeText;
  uint64_t v10;
  NSString *subtitleText;
  uint64_t v12;
  NSString *unlockActionLabel;
  uint64_t v14;
  NSDate *previousNotificationActionDate;
  uint64_t v16;
  NSDate *creationDate;
  uint64_t v18;
  FLFollowUpAction *activateAction;
  uint64_t v20;
  FLFollowUpAction *dismissAction;
  uint64_t v22;
  FLFollowUpAction *clearAction;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSSet *options;

  v4 = a3;
  v5 = -[FLFollowUpNotification init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_informativeText"));
    v8 = objc_claimAutoreleasedReturnValue();
    informativeText = v5->_informativeText;
    v5->_informativeText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subtitleText"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitleText = v5->_subtitleText;
    v5->_subtitleText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_unlockActionLabel"));
    v12 = objc_claimAutoreleasedReturnValue();
    unlockActionLabel = v5->_unlockActionLabel;
    v5->_unlockActionLabel = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previousNotificationActionDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    previousNotificationActionDate = v5->_previousNotificationActionDate;
    v5->_previousNotificationActionDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_creationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activateAction"));
    v18 = objc_claimAutoreleasedReturnValue();
    activateAction = v5->_activateAction;
    v5->_activateAction = (FLFollowUpAction *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dismissAction"));
    v20 = objc_claimAutoreleasedReturnValue();
    dismissAction = v5->_dismissAction;
    v5->_dismissAction = (FLFollowUpAction *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clearAction"));
    v22 = objc_claimAutoreleasedReturnValue();
    clearAction = v5->_clearAction;
    v5->_clearAction = (FLFollowUpAction *)v22;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_frequency"));
    v5->_frequency = v24;
    v5->_sqlID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sqlID"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_firstNotificationDelay"));
    v5->_firstNotificationDelay = v25;
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("_options"));
    v29 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSSet *)v29;

  }
  return v5;
}

- (BOOL)shouldDeliverNotification
{
  return -[FLFollowUpNotification _shouldDeliverNotificationWithStringOut:](self, "_shouldDeliverNotificationWithStringOut:", 0);
}

- (BOOL)_shouldDeliverNotificationWithStringOut:(id *)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[FLFollowUpNotification _frequencyDelta](self, "_frequencyDelta");
  v6 = v5;
  -[FLFollowUpNotification _creationDateAugmentedRepeatTimer](self, "_creationDateAugmentedRepeatTimer");
  v8 = v7;
  if (v7 <= 0.0)
    v9 = 0;
  else
    v9 = v6 >= v7 || self->_previousNotificationActionDate == 0;
  v10 = v7 == 0.0 && self->_previousNotificationActionDate == 0;
  if (-[NSSet containsObject:](self->_options, "containsObject:", CFSTR("force")))
    v11 = 1;
  else
    v11 = v10 | v9;
  if (a3)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSSet containsObject:](self->_options, "containsObject:", CFSTR("force")));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_firstNotificationDelay);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Delivery State: %@ (force = %@, delta = %@, repeat = %@, delay = %@"), v13, v14, v15, v16, v17);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)setForceDelivery:(BOOL)a3
{
  NSSet *options;
  NSSet *v5;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;
  NSObject *v9;
  NSSet *v10;
  int v11;
  NSSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  options = self->_options;
  if (a3)
  {
    -[NSSet setByAddingObject:](options, "setByAddingObject:", CFSTR("force"));
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_options;
    self->_options = v5;
  }
  else
  {
    v6 = (NSSet *)-[NSSet mutableCopy](options, "mutableCopy");
    -[NSSet removeObject:](v6, "removeObject:", CFSTR("force"));
    v7 = (NSSet *)-[NSSet copy](v6, "copy");
    v8 = self->_options;
    self->_options = v7;

  }
  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_options;
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Updated options: %@", (uint8_t *)&v11, 0xCu);
  }

}

- (BOOL)forceDelivery
{
  return -[NSSet containsObject:](self->_options, "containsObject:", CFSTR("force"));
}

- (id)_optionsData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  -[FLFollowUpNotification options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB38B0];
    -[FLFollowUpNotification options](self, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "dataWithPropertyList:format:options:error:", v6, 200, 0, &v10);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;

    if (!v3)
    {
      _FLLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FLFollowUpNotification _optionsData].cold.1();

    }
  }
  return v3;
}

- (void)set_optionsData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;

  if (a3)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLFollowUpNotification setOptions:](self, "setOptions:", v6);

    -[FLFollowUpNotification options](self, "options");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      _FLLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FLFollowUpNotification set_optionsData:].cold.1();

    }
  }
}

- (double)_frequencyDelta
{
  void *v3;
  double v4;
  double v5;

  if (!self->_previousNotificationActionDate)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_previousNotificationActionDate);
  v5 = v4;

  return v5;
}

- (double)_creationDateAugmentedRepeatTimer
{
  double v3;

  -[NSDate timeIntervalSinceNow](self->_creationDate, "timeIntervalSinceNow");
  if (fabs(v3) >= 259200.0)
    return self->_frequency * 3.0;
  else
    return self->_frequency;
}

- (void)recalculateActionDateToAccountForDelay
{
  double firstNotificationDelay;
  double frequency;
  NSDate *v5;
  NSDate *previousNotificationActionDate;
  NSObject *v7;
  NSDate *v8;
  int v9;
  NSDate *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_previousNotificationActionDate)
  {
    firstNotificationDelay = self->_firstNotificationDelay;
    if (firstNotificationDelay > 0.0)
    {
      frequency = self->_frequency;
      if (frequency > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", firstNotificationDelay - frequency);
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
        previousNotificationActionDate = self->_previousNotificationActionDate;
        self->_previousNotificationActionDate = v5;

        _FLLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = self->_previousNotificationActionDate;
          v9 = 138412290;
          v10 = v8;
          _os_log_impl(&dword_1B8D53000, v7, OS_LOG_TYPE_DEFAULT, "Adjusted the target notification eligibility date to %@", (uint8_t *)&v9, 0xCu);
        }

      }
    }
  }
}

- (BOOL)shouldBackgroundDefaultAction
{
  return -[NSSet containsObject:](self->_options, "containsObject:", CFSTR("extensionForNotification"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v8 = 0;
  -[FLFollowUpNotification _shouldDeliverNotificationWithStringOut:](self, "_shouldDeliverNotificationWithStringOut:", &v8);
  v3 = v8;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p - title: %@ subtitle: %@ activate: %@ clear: %@ dismiss: %@ previous: %@ created: %@ %@ options: %@>"), v5, self, self->_title, self->_subtitleText, self->_activateAction, self->_clearAction, self->_dismissAction, self->_previousNotificationActionDate, self->_creationDate, v3, self->_options);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)informativeText
{
  return self->_informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (FLFollowUpAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
  objc_storeStrong((id *)&self->_activateAction, a3);
}

- (FLFollowUpAction)clearAction
{
  return self->_clearAction;
}

- (void)setClearAction:(id)a3
{
  objc_storeStrong((id *)&self->_clearAction, a3);
}

- (NSString)unlockActionLabel
{
  return self->_unlockActionLabel;
}

- (void)setUnlockActionLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (double)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(double)a3
{
  self->_frequency = a3;
}

- (double)firstNotificationDelay
{
  return self->_firstNotificationDelay;
}

- (void)setFirstNotificationDelay:(double)a3
{
  self->_firstNotificationDelay = a3;
}

- (NSSet)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)sqlID
{
  return self->_sqlID;
}

- (void)setSqlID:(unint64_t)a3
{
  self->_sqlID = a3;
}

- (NSDate)previousNotificationActionDate
{
  return self->_previousNotificationActionDate;
}

- (void)setPreviousNotificationActionDate:(id)a3
{
  objc_storeStrong((id *)&self->_previousNotificationActionDate, a3);
}

- (FLFollowUpAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_previousNotificationActionDate, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_unlockActionLabel, 0);
  objc_storeStrong((id *)&self->_clearAction, 0);
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_informativeText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_optionsData
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B8D53000, v0, v1, "%@: Failed to serialize options for notification %@ with error %@");
}

- (void)set_optionsData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B8D53000, v0, v1, "%@: Failed to deserialize options for notification %@ with error %@");
}

@end
