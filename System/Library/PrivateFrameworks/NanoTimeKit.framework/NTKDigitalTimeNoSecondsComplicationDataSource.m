@implementation NTKDigitalTimeNoSecondsComplicationDataSource

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 57;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return *MEMORY[0x1E0C93EA8] == a3;
}

- (id)_templateWithShouldDisplayIdealizeState:(BOOL)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("NTKTimerComplicationMetadataShouldDisplayIdealizedStateKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CLKCComplicationDataSource family](self, "family");
  if (v6 == *MEMORY[0x1E0C93EA8])
  {
    objc_msgSend(MEMORY[0x1E0C941E8], "templateWithMetadata:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
