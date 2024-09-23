@implementation NTKCompanionRemoteComplication

+ (id)complicationWithApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "complicationClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "watchApplicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "complicationWithClientIdentifier:appBundleIdentifier:complicationDescriptor:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setApp:", v4);
  return v9;
}

- (id)localizedDetailText
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[NTKCompanionRemoteComplication app](self, "app");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NTKCompanionRemoteComplication app](self, "app");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKCompanionRemoteComplication;
    -[NTKRemoteComplication localizedDetailText](&v7, sel_localizedDetailText);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NTKCompanion3rdPartyApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
  objc_storeStrong((id *)&self->_app, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
}

@end
