@implementation GCGameIntentSettings

+ (id)homeScreenSettings:(BOOL)a3
{
  _BOOL8 v3;
  GCGameIntentSettings *v4;

  v3 = a3;
  v4 = objc_alloc_init(GCGameIntentSettings);
  -[GCGameIntentSettings setType:](v4, "setType:", 0);
  -[GCGameIntentSettings setEnabled:](v4, "setEnabled:", v3);
  return v4;
}

+ (id)gameSettings:(BOOL)a3 gameBundleID:(id)a4
{
  _BOOL8 v4;
  id v5;
  GCGameIntentSettings *v6;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc_init(GCGameIntentSettings);
  -[GCGameIntentSettings setType:](v6, "setType:", 1);
  -[GCGameIntentSettings setEnabled:](v6, "setEnabled:", v4);
  -[GCGameIntentSettings setGameBundleID:](v6, "setGameBundleID:", v5);

  return v6;
}

+ (id)appLibrarySettings:(BOOL)a3 appLibraryPod:(int64_t)a4
{
  _BOOL8 v5;
  GCGameIntentSettings *v6;

  v5 = a3;
  v6 = objc_alloc_init(GCGameIntentSettings);
  -[GCGameIntentSettings setType:](v6, "setType:", 2);
  -[GCGameIntentSettings setEnabled:](v6, "setEnabled:", v5);
  -[GCGameIntentSettings setAppLibraryPod:](v6, "setAppLibraryPod:", a4);
  return v6;
}

- (GCGameIntentSettings)init
{
  GCGameIntentSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GCGameIntentSettings;
  result = -[GCGameIntentSettings init](&v3, sel_init);
  if (result)
  {
    result->_type = 2;
    result->_enabled = 0;
    result->_appLibraryPod = 0;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void)setGameBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)appLibraryPod
{
  return self->_appLibraryPod;
}

- (void)setAppLibraryPod:(int64_t)a3
{
  self->_appLibraryPod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameBundleID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGameIntentSettings)initWithCoder:(id)a3
{
  id v4;
  GCGameIntentSettings *v5;
  uint64_t v6;
  NSString *gameBundleID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCGameIntentSettings;
  v5 = -[GCGameIntentSettings init](&v9, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_type"));
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_gameBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    gameBundleID = v5->_gameBundleID;
    v5->_gameBundleID = (NSString *)v6;

    v5->_appLibraryPod = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_appLibraryPod"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("_type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("_enabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gameBundleID, CFSTR("_gameBundleID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_appLibraryPod, CFSTR("_appLibraryPod"));

}

@end
