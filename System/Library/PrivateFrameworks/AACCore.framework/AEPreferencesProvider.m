@implementation AEPreferencesProvider

- (AEPreferencesProvider)init
{
  AEPreferencesProvider *v2;
  uint64_t v3;
  AEOSGestalt *OSGestalt;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEPreferencesProvider;
  v2 = -[AEPreferencesProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    OSGestalt = v2->_OSGestalt;
    v2->_OSGestalt = (AEOSGestalt *)v3;

  }
  return v2;
}

- (id)makePreferences
{
  void *v2;

  if (self)
    self = (AEPreferencesProvider *)self->_OSGestalt;
  if (-[AEPreferencesProvider isInternalOS](self, "isInternalOS"))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ae_isBeingTested");

  }
  return (id)objc_opt_new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OSGestalt, 0);
}

@end
