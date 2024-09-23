@implementation MOSettingsGroup

- (MOSettingsGroup)initWithReader:(id)a3 writer:(id)a4
{
  id v5;
  id v6;
  MOSettingsGroup *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MOSettingsGroup;
  v5 = a4;
  v6 = a3;
  v7 = -[MOSettingsGroup init](&v9, sel_init);
  objc_storeWeak((id *)&v7->_settingsReader, v6);

  objc_storeWeak((id *)&v7->_settingsWriter, v5);
  return v7;
}

- (id)valueForSetting:(id)a3
{
  id v4;
  void *v5;
  MOSettingsReader **p_settingsReader;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_settingsReader = &self->_settingsReader;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsReader);

  if (WeakRetained
    && (-[MOSettingsGroup metadataForSetting:](self, "metadataForSetting:", v4),
        (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = objc_loadWeakRetained((id *)p_settingsReader);
    objc_msgSend(v10, "valueForSetting:inGroup:", v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "valueFromPersistableValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)metadataForSetting:(id)a3
{
  NSString *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), a3, CFSTR("Metadata"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  NSSelectorFromString(v3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_4;
  objc_msgSend((id)objc_opt_class(), "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsWriter);
  objc_destroyWeak((id *)&self->_settingsReader);
}

- (void)setValue:(id)a3 forSetting:(id)a4
{
  id v6;
  void *v7;
  MOSettingsWriter **p_settingsWriter;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "groupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_settingsWriter = &self->_settingsWriter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsWriter);

  if (WeakRetained)
  {
    -[MOSettingsGroup metadataForSetting:](self, "metadataForSetting:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (v14)
      {
        objc_msgSend(v10, "persistableValueFromValue:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_loadWeakRetained((id *)p_settingsWriter);
        objc_msgSend(v13, "setValue:forSetting:inGroup:", v12, v6, v7);

      }
      else
      {
        v12 = objc_loadWeakRetained((id *)p_settingsWriter);
        objc_msgSend(v12, "removeValueForSetting:inGroup:", v6, v7);
      }

    }
  }

}

- (MOSettingsReader)settingsReader
{
  return (MOSettingsReader *)objc_loadWeakRetained((id *)&self->_settingsReader);
}

- (void)setSettingsReader:(id)a3
{
  objc_storeWeak((id *)&self->_settingsReader, a3);
}

- (MOSettingsWriter)settingsWriter
{
  return (MOSettingsWriter *)objc_loadWeakRetained((id *)&self->_settingsWriter);
}

- (void)setSettingsWriter:(id)a3
{
  objc_storeWeak((id *)&self->_settingsWriter, a3);
}

+ (NSString)groupName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_1E675F8A0;
}

@end
