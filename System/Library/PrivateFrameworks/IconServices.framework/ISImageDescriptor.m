@implementation ISImageDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_preferedResourceName, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ISImageDescriptor *v4;
  void *v5;

  v4 = objc_alloc_init(ISImageDescriptor);
  -[ISImageDescriptor setSize:](v4, "setSize:", self->_size.width, self->_size.height);
  -[ISImageDescriptor setScale:](v4, "setScale:", self->_scale);
  -[ISImageDescriptor setVariantOptions:](v4, "setVariantOptions:", self->_variantOptions);
  v5 = (void *)-[NSString copy](self->_preferedResourceName, "copy");
  -[ISImageDescriptor setPreferedResourceName:](v4, "setPreferedResourceName:", v5);

  -[ISImageDescriptor setTintColor:](v4, "setTintColor:", self->_tintColor);
  -[ISImageDescriptor setIgnoreCache:](v4, "setIgnoreCache:", self->_ignoreCache);
  -[ISImageDescriptor setGraphicVariant:](v4, "setGraphicVariant:", self->_graphicVariant);
  -[ISImageDescriptor setAppearance:](v4, "setAppearance:", self->_appearance);
  -[ISImageDescriptor setContrast:](v4, "setContrast:", self->_contrast);
  -[ISImageDescriptor setVibrancy:](v4, "setVibrancy:", self->_vibrancy);
  -[ISImageDescriptor setBackground:](v4, "setBackground:", self->_background);
  -[ISImageDescriptor setSpecialIconOptions:](v4, "setSpecialIconOptions:", self->_specialIconOptions);
  -[ISImageDescriptor setPlatformStyle:](v4, "setPlatformStyle:", self->_platformStyle);
  -[ISImageDescriptor setLanguageDirection:](v4, "setLanguageDirection:", self->_languageDirection);
  -[ISImageDescriptor setLayoutDirection:](v4, "setLayoutDirection:", self->_layoutDirection);
  return v4;
}

- (ISImageDescriptor)initWithSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height;
  CGFloat width;
  ISImageDescriptor *v7;
  ISImageDescriptor *v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)ISImageDescriptor;
  v7 = -[ISImageDescriptor init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_size.width = width;
    v7->_size.height = height;
    v7->_scale = a4;
    v9 = MGGetBoolAnswer();
    v8->_appearance = 0;
    v8->_preferExtendedColorResources = v9;
    v8->_contrast = 0;
    v8->_vibrancy = 0;
    v8->_languageDirection = objc_msgSend(MEMORY[0x1E0C99DC8], "_IS_currentLanguageDirection");
    +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      _ISDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ISImageDescriptor initWithSize:scale:].cold.1(v11, v12);

      objc_storeStrong((id *)&v8->_tintColor, v11);
      v8->_appearance = 2;
    }
    else
    {
      +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_appearance = objc_msgSend(v13, "forceApperance");

    }
    v8->_background = 0;
    *(_OWORD *)&v8->_specialIconOptions = xmmword_1AA9774A0;

  }
  return v8;
}

- (void)setLanguageDirection:(unint64_t)a3
{
  self->_languageDirection = a3;
}

- (void)setContrast:(int64_t)a3
{
  self->_contrast = a3;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (void)setVibrancy:(int64_t)a3
{
  self->_vibrancy = a3;
}

- (void)setVariantOptions:(unint64_t)a3
{
  self->_variantOptions = a3;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setPreferedResourceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setIgnoreCache:(BOOL)a3
{
  self->_ignoreCache = a3;
}

- (void)setGraphicVariant:(BOOL)a3
{
  self->_graphicVariant = a3;
}

- (ISImageDescriptor)init
{
  float v3;

  MGGetFloat32Answer();
  return -[ISImageDescriptor initWithSize:scale:](self, "initWithSize:scale:", 60.0, 60.0, v3);
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  objc_super v27;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld:%ld"), -[ISImageDescriptor appearance](self, "appearance"), -[ISImageDescriptor contrast](self, "contrast"), -[ISImageDescriptor vibrancy](self, "vibrancy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ISImageDescriptor tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ciColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E5801B98;
  if (v7)
    v9 = (const __CFString *)v7;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(%@)"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[ISImageDescriptor background](self, "background"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[ISImageDescriptor specialIconOptions](self, "specialIconOptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[ISImageDescriptor platformStyle](self, "platformStyle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  v27.receiver = self;
  v27.super_class = (Class)ISImageDescriptor;
  -[ISImageDescriptor description](&v27, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISImageDescriptor size](self, "size");
  v17 = v16;
  -[ISImageDescriptor size](self, "size");
  v19 = v18;
  -[ISImageDescriptor scale](self, "scale");
  v21 = v20;
  v22 = -[ISImageDescriptor variantOptions](self, "variantOptions");
  v23 = -[ISImageDescriptor layoutDirection](self, "layoutDirection");
  -[ISImageDescriptor digest](self, "digest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ - (%0.2f, %0.2f)@%.0fx v:%lx l:%lu a:%@ t:%@ b:%@ s:%@ ps:%@ digest: %@"), v15, v17, v19, v21, v22, v23, v3, v10, v11, v12, v13, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v25;
}

- (NSUUID)digest
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld:%ld"), -[ISImageDescriptor appearance](self, "appearance"), -[ISImageDescriptor contrast](self, "contrast"), -[ISImageDescriptor vibrancy](self, "vibrancy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISImageDescriptor tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ciColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRepresentation");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E5801B98;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[ISImageDescriptor background](self, "background"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[ISImageDescriptor specialIconOptions](self, "specialIconOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), -[ISImageDescriptor platformStyle](self, "platformStyle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[ISImageDescriptor scale](self, "scale");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%.0f:%ld:%@:%lu:%@:%@:%@:%@:%@"), v14, -[ISImageDescriptor variantOptions](self, "variantOptions"), 0, -[ISImageDescriptor layoutDirection](self, "layoutDirection"), v3, v9, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v16;
}

- (double)scale
{
  return self->_scale;
}

- (int64_t)vibrancy
{
  return self->_vibrancy;
}

- (unint64_t)variantOptions
{
  return self->_variantOptions;
}

- (int64_t)layoutDirection
{
  unint64_t v2;

  v2 = -[ISImageDescriptor languageDirection](self, "languageDirection");
  if (v2 == 1)
    return 5;
  else
    return 4 * (v2 == 2);
}

- (unint64_t)languageDirection
{
  return self->_languageDirection;
}

- (int64_t)contrast
{
  return self->_contrast;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (ISImageDescriptor)imageDescriptorWithIconVariant:(int)a3 options:(int)a4
{
  uint64_t v5;
  double v6;
  double v7;
  ISImageDescriptor *v8;
  NSObject *v9;
  int v11;
  ISImageDescriptor *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  LIIconOutputSizeForVariant();
  v8 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", v6, v7, MEMORY[0x1AF422E44](v5));
  if (+[ISIcon variant:isMemberOfSet:](ISIcon, "variant:isMemberOfSet:", v5, 4))
  {
    -[ISImageDescriptor setShape:](v8, "setShape:", 4);
    if ((a4 & 0x10000) != 0)
      goto LABEL_8;
LABEL_7:
    -[ISImageDescriptor setDrawBorder:](v8, "setDrawBorder:", 1);
    goto LABEL_8;
  }
  if (+[ISIcon variant:isMemberOfSet:](ISIcon, "variant:isMemberOfSet:", v5, 3))
  {
    -[ISImageDescriptor setShape:](v8, "setShape:", 2);
    goto LABEL_8;
  }
  if (+[ISIcon variant:isMemberOfSet:](ISIcon, "variant:isMemberOfSet:", v5, 1))
    goto LABEL_7;
LABEL_8:
  _ISDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138412802;
    v12 = v8;
    v13 = 1024;
    v14 = v5;
    v15 = 1024;
    v16 = a4;
    _os_log_debug_impl(&dword_1AA928000, v9, OS_LOG_TYPE_DEBUG, "Created image descriptor: %@ from variant: %d options: %x", (uint8_t *)&v11, 0x18u);
  }

  return v8;
}

- (void)setDrawBorder:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (double)continuousCornerRadius
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  double result;

  +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ideom");

  v5 = -[ISImageDescriptor shape](self, "shape");
  v6 = v4 < 4;
  if (v5)
    v6 = v5 == 1;
  if (!v6)
    return 0.0;
  -[ISImageDescriptor size](self, "size");
  +[ISShapeCompositorResource continuousCornerRadiusForSize:](ISShapeCompositorResource, "continuousCornerRadiusForSize:");
  return result;
}

+ (id)imageDescriptorNamed:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  ISImageDescriptor *v17;
  NSObject *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;

  v3 = a3;
  +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ideom");

  +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenScale");
  v8 = v7;

  v9 = 29.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.TableUIName")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.Spotlight")) & 1) != 0)
  {
    v10 = 0;
    *(double *)&v12 = 40.0;
LABEL_5:
    v9 = *(double *)&v12;
LABEL_6:
    v11 = v9;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.HomeScreen")))
  {
    +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeScreenIconSize");
LABEL_11:
    v11 = v14;
    v9 = v15;

    v10 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.LargeHomeScreen")))
  {
    +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "largeHomeScreenIconSize");
    goto LABEL_11;
  }
  v11 = 37.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CustomDocumentSize")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.BadgedDocumentSize")) & 1) != 0)
  {
    *(double *)&v16 = 48.0;
LABEL_15:
    v9 = *(double *)&v16;
LABEL_16:
    v10 = 3;
    goto LABEL_17;
  }
  v11 = 20.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.Notification")) & 1) != 0)
  {
    v10 = 0;
LABEL_22:
    v9 = 20.0;
    goto LABEL_17;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CustomDocumentScalableSize")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.BadgedDocumentScalableSize")))
  {
    if (v5 == 2)
      v9 = 320.0;
    else
      v9 = 48.0;
    v11 = dbl_1AA9774B0[v5 == 2];
    goto LABEL_16;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CarLauncher")) & 1) != 0)
  {
LABEL_30:
    v10 = 0;
    *(double *)&v12 = 60.0;
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CarNotification")) & 1) != 0)
  {
LABEL_2:
    v10 = 0;
    v11 = 29.0;
    goto LABEL_17;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.Activity")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CustomDocumentCompact")) & 1) != 0)
    {
      v11 = 64.0;
      *(double *)&v16 = 84.0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CustomDocumentRegular")) & 1) != 0)
    {
      v11 = 96.0;
      *(double *)&v16 = 128.0;
      goto LABEL_15;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.CustomDocumentTable")) & 1) != 0)
    {
      v11 = 34.0;
      *(double *)&v16 = 44.0;
      goto LABEL_15;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.MessagesExtensionLauncher")))
    {
      +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "messagesLauncherIconSize");
      v11 = v23;
      v9 = v24;

    }
    else
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.MessagesExtensionBadge")) & 1) == 0)
      {
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.MessagesExtensionStatus")) & 1) != 0)
        {
          v11 = 27.0;
          v10 = 4;
          goto LABEL_22;
        }
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.IconServices.ImageDescriptor.WidgetAddGallery")))
        {
          v9 = 24.0;
          v10 = 1;
          v11 = 24.0;
        }
        else
        {
          v10 = 0;
          v11 = *MEMORY[0x1E0C9D820];
          v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        }
        goto LABEL_17;
      }
      v9 = 24.0;
      v11 = 32.0;
    }
    v10 = 4;
    goto LABEL_17;
  }
  if (v5 == 2)
  {
    v10 = 0;
    *(double *)&v12 = 76.0;
    goto LABEL_5;
  }
  if (v5 != 1)
    goto LABEL_30;
  +[ISDeviceInfo sharedInstance](ISDeviceInfo, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "deviceSubtype");

  v10 = 0;
  v9 = 64.0;
  if (v21 == 1792 || v21 == 2688)
    goto LABEL_6;
  v11 = 64.0;
  if (v21 != 2778)
    goto LABEL_30;
LABEL_17:
  v17 = -[ISImageDescriptor initWithSize:scale:]([ISImageDescriptor alloc], "initWithSize:scale:", v11, v9, v8);
  -[ISImageDescriptor setShape:](v17, "setShape:", v10);
  _ISDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    +[ISImageDescriptor(iOSConvenience) imageDescriptorNamed:].cold.1((uint64_t)v3, (uint64_t)v17, v18);

  return v17;
}

- (void)setShape:(unint64_t)a3
{
  unint64_t v3;

  switch(a3)
  {
    case 0uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF96FFFDLL;
      goto LABEL_9;
    case 1uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x10000;
      goto LABEL_9;
    case 2uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 2;
      goto LABEL_9;
    case 3uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x40000;
      goto LABEL_9;
    case 4uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x80000;
      goto LABEL_9;
    case 5uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x200000;
      goto LABEL_9;
    case 6uLL:
      v3 = self->_variantOptions & 0xFFFFFFFFFF92FFFDLL | 0x400000;
LABEL_9:
      self->_variantOptions = v3;
      break;
    default:
      return;
  }
}

- (unint64_t)shape
{
  unint64_t result;

  result = self->_variantOptions & 0x6D0002;
  if (result >= 0x80000)
  {
    switch(result)
    {
      case 0x80000uLL:
        return 4;
      case 0x200000uLL:
        return 5;
      case 0x400000uLL:
        return 6;
    }
  }
  else
  {
    switch(result)
    {
      case 2uLL:
        return result;
      case 0x10000uLL:
        return 1;
      case 0x40000uLL:
        return 3;
    }
  }
  return 0;
}

- (id)_recipe
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  ISMessagesAppRecipe *v7;

  switch(-[ISImageDescriptor shape](self, "shape"))
  {
    case 1uLL:
      v3 = 4;
      goto LABEL_5;
    case 2uLL:
      v3 = 8;
LABEL_5:
      +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", v3, self);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3uLL:
      +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISRecipeInfo documentRecipeForPlatform:descriptor:](ISRecipeInfo, "documentRecipeForPlatform:descriptor:", objc_msgSend(v4, "nativePlatform"), self);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      v7 = objc_alloc_init(ISMessagesAppRecipe);
      -[ISMessagesAppRecipe setShouldDrawBorder:](v7, "setShouldDrawBorder:", -[ISImageDescriptor drawBorder](self, "drawBorder"));
      return v7;
    case 5uLL:
      v6 = objc_opt_new();
LABEL_10:
      v7 = (ISMessagesAppRecipe *)v6;
      break;
    case 6uLL:
      v7 = (ISMessagesAppRecipe *)objc_opt_new();
      -[ISMessagesAppRecipe setShouldOnlyDrawBorder:](v7, "setShouldOnlyDrawBorder:", 1);
      break;
    default:
      +[ISPlatformInfo sharedInstance](ISPlatformInfo, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[ISRecipeInfo appRecipeForPlatform:descriptor:](ISRecipeInfo, "appRecipeForPlatform:descriptor:", objc_msgSend(v4, "nativePlatform"), self);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (ISMessagesAppRecipe *)v5;

      break;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISImageDescriptor)initWithCoder:(id)a3
{
  id v4;
  ISImageDescriptor *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  uint64_t v10;
  NSString *preferedResourceName;
  uint64_t v12;
  IFColor *tintColor;

  v4 = a3;
  v5 = -[ISImageDescriptor init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("size.width"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("size.height"));
    v5->_size.width = v7;
    v5->_size.height = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
    v5->_scale = v9;
    v5->_variantOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variantOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferedResourceName"));
    v10 = objc_claimAutoreleasedReturnValue();
    preferedResourceName = v5->_preferedResourceName;
    v5->_preferedResourceName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (IFColor *)v12;

    v5->_ignoreCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ignoreCache"));
    v5->_graphicVariant = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("graphicVariant"));
    v5->_appearance = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appearance"));
    v5->_contrast = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contrast"));
    v5->_vibrancy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vibrancy"));
    v5->_background = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("background"));
    v5->_specialIconOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("specialIconOptions"));
    v5->_platformStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("platformStyle"));
    v5->_languageDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("languageDirection"));
    v5->_layoutDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutDirection"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double width;
  id v5;

  width = self->_size.width;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("size.width"), width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("size.height"), self->_size.height);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scale"), self->_scale);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_variantOptions, CFSTR("variantOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferedResourceName, CFSTR("preferedResourceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tintColor, CFSTR("tintColor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ignoreCache, CFSTR("ignoreCache"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_graphicVariant, CFSTR("graphicVariant"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_appearance, CFSTR("appearance"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contrast, CFSTR("contrast"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vibrancy, CFSTR("vibrancy"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_background, CFSTR("background"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_specialIconOptions, CFSTR("specialIconOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_platformStyle, CFSTR("platformStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_languageDirection, CFSTR("languageDirection"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_layoutDirection, CFSTR("layoutDirection"));

}

- (BOOL)templateVariant
{
  return (LOBYTE(self->_variantOptions) >> 3) & 1;
}

- (void)setTemplateVariant:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)selectedVariant
{
  return (LOBYTE(self->_variantOptions) >> 4) & 1;
}

- (void)setSelectedVariant:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)shouldApplyMask
{
  return (self->_variantOptions & 0x20000) == 0;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (a3)
    v3 = 0;
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)drawBorder
{
  return (LOBYTE(self->_variantOptions) >> 2) & 1;
}

- (BOOL)drawBadge
{
  return (self->_variantOptions & 0x100000) == 0;
}

- (void)setDrawBadge:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (a3)
    v3 = 0;
  self->_variantOptions = self->_variantOptions & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (CGSize)sanitizedSize
{
  double width;
  double height;
  double v4;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  if (height <= width)
    v4 = self->_size.width;
  else
    v4 = self->_size.height;
  if (v4 < 20.0)
  {
    height = 20.0;
    width = 20.0;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (double)sanitizedScale
{
  double result;
  double v3;
  _BOOL4 v4;
  _BOOL4 v5;

  result = ceil(self->_scale);
  v3 = 1.0;
  v4 = result < 1.0;
  v5 = result < 3.0 || result < 1.0;
  if (result >= 3.0)
    v4 = 1;
  if (!v5)
    v3 = 3.0;
  if (v4)
    return v3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ISImageDescriptor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (ISImageDescriptor *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[ISImageDescriptor digest](self, "digest");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISImageDescriptor digest](v4, "digest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ISImageDescriptor digest](self, "digest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)preferedResourceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (unint64_t)specialIconOptions
{
  return self->_specialIconOptions;
}

- (void)setSpecialIconOptions:(unint64_t)a3
{
  self->_specialIconOptions = a3;
}

- (unint64_t)badgeOptions
{
  return self->_badgeOptions;
}

- (void)setBadgeOptions:(unint64_t)a3
{
  self->_badgeOptions = a3;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (unint64_t)platformStyle
{
  return self->_platformStyle;
}

- (void)setPlatformStyle:(unint64_t)a3
{
  self->_platformStyle = a3;
}

- (IFColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)graphicVariant
{
  return self->_graphicVariant;
}

- (unint64_t)background
{
  return self->_background;
}

- (void)setBackground:(unint64_t)a3
{
  self->_background = a3;
}

- (BOOL)preferExtendedColorResources
{
  return self->_preferExtendedColorResources;
}

- (void)setPreferExtendedColorResources:(BOOL)a3
{
  self->_preferExtendedColorResources = a3;
}

+ (id)icnsImageDescriptors
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)initWithSize:(void *)a1 scale:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ciColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Defaults set to enable tint color: %@", (uint8_t *)&v4, 0xCu);

}

@end
