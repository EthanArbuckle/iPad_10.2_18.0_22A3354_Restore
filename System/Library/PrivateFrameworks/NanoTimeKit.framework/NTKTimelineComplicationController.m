@implementation NTKTimelineComplicationController

+ (BOOL)_isLegacy
{
  return 0;
}

- (unint64_t)_animationForTimelineEntryTransitionFrom:(id)a3 to:(id)a4 withAnimationBehavior:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  if (a5 == 1)
  {
    objc_msgSend(v7, "timelineAnimationGroup");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v8, "timelineAnimationGroup");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(v7, "timelineAnimationGroup");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timelineAnimationGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
          goto LABEL_3;
      }
      else
      {

      }
    }
LABEL_9:
    objc_msgSend(v7, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = NTKComplicationAnimationForDates(v17, v18);

    goto LABEL_10;
  }
  if (a5 == 2)
    goto LABEL_9;
LABEL_3:
  v9 = 0;
LABEL_10:

  return v9;
}

- (void)_analyticsAppLaunchForTimeTravelDate:(id)a3 timelineEntryDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "timeIntervalSinceNow");
  v18[0] = CFSTR("eventName");
  v18[1] = CFSTR("value");
  v19[0] = CFSTR("launchtimetraveloffset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceNow");
    v16[1] = CFSTR("value");
    v17[0] = CFSTR("launchtimetravelentryoffset");
    v16[0] = CFSTR("eventName");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  -[NTKComplicationController complicationApplicationIdentifier](self, "complicationApplicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("timetravel.launch."), "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = CFSTR("eventName");
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)activeDisplayTemplateForDisplayWrapper:(id)a3
{
  NSObject *v4;

  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[NTKTimelineComplicationController activeDisplayTemplateForDisplayWrapper:].cold.1((uint64_t)self, v4);

  return 0;
}

- (CLKComplicationTemplate)alwaysOnTemplate
{
  return self->_alwaysOnTemplate;
}

- (BOOL)ignoreNewTemplates
{
  return self->_ignoreNewTemplates;
}

- (void)setIgnoreNewTemplates:(BOOL)a3
{
  self->_ignoreNewTemplates = a3;
}

- (CLKComplicationTemplate)lockedTemplate
{
  return self->_lockedTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedTemplate, 0);
  objc_storeStrong((id *)&self->_alwaysOnTemplate, 0);
}

- (void)activeDisplayTemplateForDisplayWrapper:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%@: returning nil for activeDisplayTemplate. THIS SHOULD NOT BE CALLED!", (uint8_t *)&v5, 0xCu);

}

@end
