@implementation ATXLockscreenEditMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.Edit");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[12];
  _QWORD v25[14];

  v25[12] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("lockscreenId");
  -[ATXLockscreenEditMetric lockscreenId](self, "lockscreenId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v4;
  v20 = (void *)v3;
  v25[0] = v3;
  v24[1] = CFSTR("entryPoint");
  -[ATXLockscreenEditMetric entryPoint](self, "entryPoint");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v5;
  v25[1] = v5;
  v24[2] = CFSTR("isNew");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric isNew](self, "isNew"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v22;
  v24[3] = CFSTR("secondsSinceLastEdit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenEditMetric secondsSinceLastEdit](self, "secondsSinceLastEdit"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v21;
  v24[4] = CFSTR("outcome");
  -[ATXLockscreenEditMetric outcome](self, "outcome");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v7;
  v24[5] = CFSTR("timeSpentEditing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXLockscreenEditMetric duration](self, "duration", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v9;
  v24[6] = CFSTR("userChangedColor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric userChangedColor](self, "userChangedColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v10;
  v24[7] = CFSTR("userChangedFont");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric userChangedFont](self, "userChangedFont"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v11;
  v24[8] = CFSTR("userChangedNumberingSystem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric userChangedNumberingSystem](self, "userChangedNumberingSystem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v12;
  v24[9] = CFSTR("userChangedWidgets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric userChangedWidgets](self, "userChangedWidgets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v13;
  v24[10] = CFSTR("userChangedPosterContent");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric userChangedPosterContent](self, "userChangedPosterContent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[10] = v14;
  v24[11] = CFSTR("didLockscreenHaveWidgetsBeforeEdit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenEditMetric didLockscreenHaveWidgetsBeforeEdit](self, "didLockscreenHaveWidgetsBeforeEdit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[11] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  if (!v6)

  if (!v23)
  return v16;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (unint64_t)secondsSinceLastEdit
{
  return self->_secondsSinceLastEdit;
}

- (void)setSecondsSinceLastEdit:(unint64_t)a3
{
  self->_secondsSinceLastEdit = a3;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (BOOL)userChangedColor
{
  return self->_userChangedColor;
}

- (void)setUserChangedColor:(BOOL)a3
{
  self->_userChangedColor = a3;
}

- (BOOL)userChangedFont
{
  return self->_userChangedFont;
}

- (void)setUserChangedFont:(BOOL)a3
{
  self->_userChangedFont = a3;
}

- (BOOL)userChangedNumberingSystem
{
  return self->_userChangedNumberingSystem;
}

- (void)setUserChangedNumberingSystem:(BOOL)a3
{
  self->_userChangedNumberingSystem = a3;
}

- (BOOL)userChangedPosterContent
{
  return self->_userChangedPosterContent;
}

- (void)setUserChangedPosterContent:(BOOL)a3
{
  self->_userChangedPosterContent = a3;
}

- (BOOL)userChangedWidgets
{
  return self->_userChangedWidgets;
}

- (void)setUserChangedWidgets:(BOOL)a3
{
  self->_userChangedWidgets = a3;
}

- (BOOL)didLockscreenHaveWidgetsBeforeEdit
{
  return self->_didLockscreenHaveWidgetsBeforeEdit;
}

- (void)setDidLockscreenHaveWidgetsBeforeEdit:(BOOL)a3
{
  self->_didLockscreenHaveWidgetsBeforeEdit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end
