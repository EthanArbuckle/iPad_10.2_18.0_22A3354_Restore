@implementation ATXLockscreenConfigurationMetric

- (id)metricName
{
  return CFSTR("com.apple.Proactive.Lockscreen.Configuration");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[11];
  _QWORD v30[13];

  v30[11] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("lockscreenId");
  -[ATXLockscreenConfigurationMetric lockscreenId](self, "lockscreenId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v28 = v4;
  v25 = (void *)v3;
  v30[0] = v3;
  v29[1] = CFSTR("extensionBundleId");
  -[ATXLockscreenConfigurationMetric extensionBundleId](self, "extensionBundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v5;
  v30[1] = v5;
  v29[2] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenConfigurationMetric source](self, "source"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  v29[3] = CFSTR("font");
  -[ATXLockscreenConfigurationMetric font](self, "font");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v27 = v6;
  v23 = (void *)v7;
  v30[3] = v7;
  v29[4] = CFSTR("color");
  -[ATXLockscreenConfigurationMetric color](self, "color");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v30[4] = v9;
  v29[5] = CFSTR("numberingSystem");
  -[ATXLockscreenConfigurationMetric numberingSystem](self, "numberingSystem");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v30[5] = v11;
  v29[6] = CFSTR("numWidgets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenConfigurationMetric numWidgets](self, "numWidgets", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v13;
  v29[7] = CFSTR("numLandscapeWidgets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXLockscreenConfigurationMetric numLandscapeWidgets](self, "numLandscapeWidgets"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v14;
  v29[8] = CFSTR("hasCustomInlineComplication");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenConfigurationMetric hasCustomInlineComplication](self, "hasCustomInlineComplication"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v15;
  v29[9] = CFSTR("relatedFocus");
  -[ATXLockscreenConfigurationMetric relatedFocus](self, "relatedFocus");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[9] = v17;
  v29[10] = CFSTR("isSelected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXLockscreenConfigurationMetric isSelected](self, "isSelected"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v27)
  if (!v28)

  return v19;
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

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (NSString)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)numWidgets
{
  return self->_numWidgets;
}

- (void)setNumWidgets:(unint64_t)a3
{
  self->_numWidgets = a3;
}

- (unint64_t)numLandscapeWidgets
{
  return self->_numLandscapeWidgets;
}

- (void)setNumLandscapeWidgets:(unint64_t)a3
{
  self->_numLandscapeWidgets = a3;
}

- (BOOL)hasCustomInlineComplication
{
  return self->_hasCustomInlineComplication;
}

- (void)setHasCustomInlineComplication:(BOOL)a3
{
  self->_hasCustomInlineComplication = a3;
}

- (NSString)relatedFocus
{
  return self->_relatedFocus;
}

- (void)setRelatedFocus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedFocus, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_lockscreenId, 0);
}

@end
