@implementation AVTCoreModel

- (AVTCoreModel)initWithGroups:(id)a3 colors:(id)a4 colorDefaultsProvider:(id)a5 forPlatform:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  AVTCoreModel *v13;
  uint64_t v14;
  NSArray *groups;
  uint64_t v16;
  AVTEditingModelColors *colors;
  uint64_t v18;
  AVTAvatarEditorColorDefaultsProvider *colorDefaultsProvider;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AVTCoreModel;
  v13 = -[AVTCoreModel init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    groups = v13->_groups;
    v13->_groups = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    colors = v13->_colors;
    v13->_colors = (AVTEditingModelColors *)v16;

    v18 = objc_msgSend(v12, "copy");
    colorDefaultsProvider = v13->_colorDefaultsProvider;
    v13->_colorDefaultsProvider = (AVTAvatarEditorColorDefaultsProvider *)v18;

    v13->_platform = a6;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVTCoreModel;
  -[AVTCoreModel description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModel groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avt_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" groups: %@\n"), v6);

  -[AVTCoreModel colors](self, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" colors: %p\n"), v7);

  -[AVTCoreModel colorDefaultsProvider](self, "colorDefaultsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" colorDefaultsProvider: %p\n"), v8);

  objc_msgSend(v4, "appendFormat:", CFSTR(" platform: %lu\n"), -[AVTCoreModel platform](self, "platform"));
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (NSArray)groups
{
  return self->_groups;
}

- (AVTEditingModelColors)colors
{
  return self->_colors;
}

- (AVTAvatarEditorColorDefaultsProvider)colorDefaultsProvider
{
  return self->_colorDefaultsProvider;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorDefaultsProvider, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
