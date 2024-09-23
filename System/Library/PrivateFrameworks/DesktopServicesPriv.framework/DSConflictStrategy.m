@implementation DSConflictStrategy

- (DSConflictStrategy)init
{
  DSConflictStrategy *v2;
  uint64_t v3;
  NSMutableDictionary *localizedTitlesByResolution;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSConflictStrategy;
  v2 = -[DSConflictStrategy init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    localizedTitlesByResolution = v2->_localizedTitlesByResolution;
    v2->_localizedTitlesByResolution = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setLocalizedTitle:(id)a3 forResolution:(unint64_t)a4
{
  NSMutableDictionary *localizedTitlesByResolution;
  void *v7;
  id v8;

  v8 = a3;
  localizedTitlesByResolution = self->_localizedTitlesByResolution;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](localizedTitlesByResolution, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)localizedTitleForResolution:(unint64_t)a3
{
  NSMutableDictionary *localizedTitlesByResolution;
  void *v4;
  void *v5;

  localizedTitlesByResolution = self->_localizedTitlesByResolution;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](localizedTitlesByResolution, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedAlertMessageForSourceFileURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v4 = a3;
  -[DSConflictStrategy localizedAlertMessageFormat](self, "localizedAlertMessageFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E8752DF8;
  }

  return v7;
}

- (void)validate
{
  if (-[DSConflictStrategy type](self, "type") != 2)
    -[DSConflictStrategy type](self, "type");
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (id)conflictHandler
{
  return self->_conflictHandler;
}

- (void)setConflictHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedAlertTitle
{
  return self->_localizedAlertTitle;
}

- (void)setLocalizedAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedAlertMessageFormat
{
  return self->_localizedAlertMessageFormat;
}

- (void)setLocalizedAlertMessageFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)localizedTitlesByResolution
{
  return self->_localizedTitlesByResolution;
}

- (void)setLocalizedTitlesByResolution:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitlesByResolution, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitlesByResolution, 0);
  objc_storeStrong((id *)&self->_localizedAlertMessageFormat, 0);
  objc_storeStrong((id *)&self->_localizedAlertTitle, 0);
  objc_storeStrong(&self->_conflictHandler, 0);
}

@end
