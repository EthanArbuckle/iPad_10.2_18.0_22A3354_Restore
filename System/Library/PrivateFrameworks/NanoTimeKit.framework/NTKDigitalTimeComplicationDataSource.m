@implementation NTKDigitalTimeComplicationDataSource

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  void *v4;

  if (-[CLKCComplicationDataSource family](self, "family", a3) == 9
    || -[CLKCComplicationDataSource family](self, "family") == 10)
  {
    objc_opt_class();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)supportsTapAction
{
  return 0;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  return -[NTKDigitalTimeComplicationDataSource _templateWithShouldDisplayIdealizeState:](self, "_templateWithShouldDisplayIdealizeState:", 1);
}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, void *))a3;
  -[NTKDigitalTimeComplicationDataSource _templateWithShouldDisplayIdealizeState:](self, "_templateWithShouldDisplayIdealizeState:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C94490];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryWithDate:complicationTemplate:", v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v7);
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (id)complicationApplicationIdentifier
{
  return 0;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 45;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (unint64_t)(a3 - 9) < 2 || *MEMORY[0x1E0C93EA8] == a3;
}

- (id)_templateWithShouldDisplayIdealizeState:(BOOL)a3
{
  void *v4;
  void *v5;
  id *v6;
  int64_t v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CLKCComplicationDataSource family](self, "family") == 9)
  {
    v6 = (id *)0x1E0C94240;
  }
  else if (-[CLKCComplicationDataSource family](self, "family") == 10)
  {
    v6 = (id *)0x1E0C94268;
  }
  else
  {
    v7 = -[CLKCComplicationDataSource family](self, "family");
    if (v7 != *MEMORY[0x1E0C93EA8])
    {
      v8 = 0;
      goto LABEL_8;
    }
    v6 = (id *)0x1E0C941E0;
  }
  objc_msgSend(*v6, "templateWithMetadata:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v8;
}

@end
