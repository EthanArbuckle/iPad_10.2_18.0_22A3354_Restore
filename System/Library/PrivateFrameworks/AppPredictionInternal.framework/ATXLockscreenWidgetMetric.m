@implementation ATXLockscreenWidgetMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.Widget");
}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("lockscreenId");
  -[ATXLockscreenWidgetMetric lockscreenId](self, "lockscreenId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v4;
  v14[1] = CFSTR("extensionBundleId");
  -[ATXLockscreenWidgetMetric extensionBundleId](self, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v6;
  v14[2] = CFSTR("kind");
  -[ATXLockscreenWidgetMetric kind](self, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[2] = v8;
  v14[3] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenWidgetMetric source](self, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("family");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenWidgetMetric family](self, "family"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v10;
  v14[5] = CFSTR("isLandscape");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenWidgetMetric isLandscape](self, "isLandscape"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  if (!v5)

  if (!v3)
  return v12;
}

- (NSString)lockscreenId
{
  return self->_lockscreenId;
}

- (void)setLockscreenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)family
{
  return self->_family;
}

- (void)setFamily:(unint64_t)a3
{
  self->_family = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)isLandscape
{
  return self->_isLandscape;
}

- (void)setIsLandscape:(BOOL)a3
{
  self->_isLandscape = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end
