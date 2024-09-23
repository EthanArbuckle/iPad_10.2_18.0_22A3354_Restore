@implementation ATXLockscreenSummaryMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.Summary");
}

- (id)coreAnalyticsDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("editingUiExperienced");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenSummaryMetric editingUiExperienced](self, "editingUiExperienced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)editingUiExperienced
{
  return self->_editingUiExperienced;
}

- (void)setEditingUiExperienced:(unint64_t)a3
{
  self->_editingUiExperienced = a3;
}

@end
