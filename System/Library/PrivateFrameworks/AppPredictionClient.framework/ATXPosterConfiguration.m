@implementation ATXPosterConfiguration

- (ATXPosterConfiguration)initWithExtensionBundleIdentifier:(id)a3 active:(BOOL)a4 selected:(BOOL)a5 inlineComplication:(id)a6 complications:(id)a7 modeUUID:(id)a8 font:(id)a9 color:(id)a10 numberingSystem:(id)a11 posterUUID:(id)a12 galleryItem:(id)a13
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  ATXPosterConfiguration *v27;
  _BOOL4 v30;
  _BOOL4 v31;

  v30 = a4;
  v31 = a5;
  v17 = (void *)MEMORY[0x1E0CB3A28];
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a3;
  objc_msgSend(v17, "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[ATXPosterConfiguration initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:](self, "initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:", v24, v30, v31, v23, v22, MEMORY[0x1E0C9AA60], v21, v20, v19, v18, v26, 0);

  return v27;
}

- (ATXPosterConfiguration)initWithExtensionBundleIdentifier:(id)a3 active:(BOOL)a4 selected:(BOOL)a5 inlineComplication:(id)a6 complications:(id)a7 landscapeComplications:(id)a8 modeUUID:(id)a9 font:(id)a10 color:(id)a11 numberingSystem:(id)a12 posterUUID:(id)a13 galleryItem:(id)a14
{
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  ATXPosterConfiguration *v27;
  uint64_t v28;
  NSString *extensionBundleIdentifier;
  uint64_t v30;
  NSArray *complications;
  uint64_t v32;
  NSArray *landscapeComplications;
  uint64_t v34;
  NSString *font;
  uint64_t v36;
  NSString *color;
  uint64_t v38;
  NSString *numberingSystem;
  uint64_t v40;
  NSString *posterUUID;
  uint64_t v42;
  ATXFaceGalleryItem *galleryItem;
  id obj;
  id v49;
  id v50;
  objc_super v51;

  v17 = a3;
  obj = a6;
  v50 = a6;
  v18 = a7;
  v19 = a8;
  v49 = a9;
  v20 = v18;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v24 = a13;
  v25 = v19;
  v26 = a14;
  v51.receiver = self;
  v51.super_class = (Class)ATXPosterConfiguration;
  v27 = -[ATXPosterConfiguration init](&v51, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v17, "copy");
    extensionBundleIdentifier = v27->_extensionBundleIdentifier;
    v27->_extensionBundleIdentifier = (NSString *)v28;

    v27->_active = a4;
    v27->_selected = a5;
    objc_storeStrong((id *)&v27->_inlineComplication, obj);
    v30 = objc_msgSend(v20, "copy");
    complications = v27->_complications;
    v27->_complications = (NSArray *)v30;

    v32 = objc_msgSend(v25, "copy");
    landscapeComplications = v27->_landscapeComplications;
    v27->_landscapeComplications = (NSArray *)v32;

    objc_storeStrong((id *)&v27->_modeUUID, a9);
    v34 = objc_msgSend(v21, "copy");
    font = v27->_font;
    v27->_font = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    color = v27->_color;
    v27->_color = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    numberingSystem = v27->_numberingSystem;
    v27->_numberingSystem = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    posterUUID = v27->_posterUUID;
    v27->_posterUUID = (NSString *)v40;

    v42 = objc_msgSend(v26, "copy");
    galleryItem = v27->_galleryItem;
    v27->_galleryItem = (ATXFaceGalleryItem *)v42;

  }
  return v27;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@; "), v5);

  -[ATXPosterConfiguration extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("extensionBundleIdentifier: %@; "), v6);

  if (-[ATXPosterConfiguration isActive](self, "isActive"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("active: %@; "), v7);
  if (-[ATXPosterConfiguration isSelected](self, "isSelected"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("selected: %@; "), v8);
  -[ATXPosterConfiguration inlineComplication](self, "inlineComplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("inlineComplication: %@; "), v9);

  -[ATXPosterConfiguration complications](self, "complications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("complications: %@; "), v10);

  -[ATXPosterConfiguration landscapeComplications](self, "landscapeComplications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("landscapeComplications: %@; "), v11);

  -[ATXPosterConfiguration modeUUID](self, "modeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("modeUUID: %@; "), v13);

  -[ATXPosterConfiguration font](self, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("font: %@; "), v14);

  -[ATXPosterConfiguration color](self, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("color: %@; "), v15);

  -[ATXPosterConfiguration numberingSystem](self, "numberingSystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("numberingSystem: %@; "), v16);

  -[ATXPosterConfiguration posterUUID](self, "posterUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("posterUUID: %@; "), v17);

  -[ATXPosterConfiguration galleryItem](self, "galleryItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("galleryItem: %@; "), v18);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  __CFString *v26;
  __CFString *v27;
  int v28;
  __CFString *v29;
  void *v30;
  void *v31;
  ATXPosterConfiguration *v32;
  ATXPosterConfiguration *v33;
  NSObject *v34;
  id v36;
  id v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  void *v41;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeUUID"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selected"));
    v38 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("active"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inlineComplication"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1A85A4F90]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("complications"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E0C9AA60];
    if (v10)
      v13 = (void *)v10;
    else
      v13 = (void *)MEMORY[0x1E0C9AA60];
    v37 = v13;

    v14 = (void *)MEMORY[0x1A85A4F90]();
    v15 = objc_alloc(MEMORY[0x1E0C99E60]);
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("landscapeComplications"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v12;
    v36 = v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("font"));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v22 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCustomFont"));
      v23 = CFSTR("isDefault");
      if (v22)
        v23 = CFSTR("isCustom");
      v21 = v23;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v25 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCustomColor"));
      v26 = CFSTR("isDefault");
      if (v25)
        v26 = CFSTR("isCustom");
      v24 = v26;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberingSystem"));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      v28 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCustomNumberingSystem"));
      v29 = CFSTR("isDefault");
      if (v28)
        v29 = CFSTR("isCustom");
      v27 = v29;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("posterUUID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("galleryItem"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[ATXPosterConfiguration initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:](self, "initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:", v5, v38, v39, v40, v37, v36, v41, v21, v24, v27, v30, v31);

    self = v32;
    v33 = self;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[ATXPosterConfiguration initWithCoder:].cold.1(v34);

    v33 = 0;
  }

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[ATXPosterConfiguration extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("extensionBundleIdentifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ATXPosterConfiguration isSelected](self, "isSelected"), CFSTR("selected"));
  -[ATXPosterConfiguration inlineComplication](self, "inlineComplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("inlineComplication"));

  -[ATXPosterConfiguration complications](self, "complications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("complications"));

  -[ATXPosterConfiguration landscapeComplications](self, "landscapeComplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("landscapeComplications"));

  -[ATXPosterConfiguration modeUUID](self, "modeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("modeUUID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ATXPosterConfiguration isActive](self, "isActive"), CFSTR("active"));
  -[ATXPosterConfiguration font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("font"));

  -[ATXPosterConfiguration color](self, "color");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("color"));

  -[ATXPosterConfiguration numberingSystem](self, "numberingSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("numberingSystem"));

  -[ATXPosterConfiguration posterUUID](self, "posterUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("posterUUID"));

  -[ATXPosterConfiguration galleryItem](self, "galleryItem");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("galleryItem"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXPosterConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  ATXPosterConfiguration *v17;

  v3 = self;
  -[ATXPosterConfiguration extensionBundleIdentifier](v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXPosterConfiguration isActive](v3, "isActive");
  v15 = -[ATXPosterConfiguration isSelected](v3, "isSelected");
  -[ATXPosterConfiguration inlineComplication](v3, "inlineComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration complications](v3, "complications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration landscapeComplications](v3, "landscapeComplications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration modeUUID](v3, "modeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration font](v3, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration color](v3, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration numberingSystem](v3, "numberingSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration posterUUID](v3, "posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterConfiguration galleryItem](v3, "galleryItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ATXPosterConfiguration initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:](v3, "initWithExtensionBundleIdentifier:active:selected:inlineComplication:complications:landscapeComplications:modeUUID:font:color:numberingSystem:posterUUID:galleryItem:", v4, v16, v15, v5, v6, v14, v7, v8, v9, v10, v11, v12);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  ATXPosterConfiguration *v4;
  ATXPosterConfiguration *v5;
  BOOL v6;

  v4 = (ATXPosterConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPosterConfiguration isEqualToATXPosterConfiguration:](self, "isEqualToATXPosterConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToATXPosterConfiguration:(id)a3
{
  id *v4;
  NSString *extensionBundleIdentifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  int selected;
  ATXComplication *inlineComplication;
  ATXComplication *v12;
  ATXComplication *v13;
  ATXComplication *v14;
  BOOL v15;
  NSArray *complications;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  NSArray *landscapeComplications;
  NSArray *v22;
  NSArray *v23;
  NSArray *v24;
  char v25;
  NSUUID *modeUUID;
  NSUUID *v27;
  NSUUID *v28;
  NSUUID *v29;
  char v30;
  int active;
  NSString *font;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  NSString *color;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  NSString *numberingSystem;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  char v46;
  NSString *posterUUID;
  NSString *v48;
  NSString *v49;
  NSString *v50;
  char v51;
  char v52;
  ATXFaceGalleryItem *v54;
  ATXFaceGalleryItem *v55;

  v4 = (id *)a3;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v6 = (NSString *)v4[2];
  if (extensionBundleIdentifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = extensionBundleIdentifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_37;
  }
  selected = self->_selected;
  if (selected != objc_msgSend(v4, "isSelected"))
    goto LABEL_37;
  inlineComplication = self->_inlineComplication;
  v12 = (ATXComplication *)v4[3];
  if (inlineComplication == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = inlineComplication;
    v15 = -[ATXComplication isEqual:](v14, "isEqual:", v13);

    if (!v15)
      goto LABEL_37;
  }
  complications = self->_complications;
  v17 = (NSArray *)v4[4];
  if (complications == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = complications;
    v20 = -[NSArray isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_37;
  }
  landscapeComplications = self->_landscapeComplications;
  v22 = (NSArray *)v4[5];
  if (landscapeComplications == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = landscapeComplications;
    v25 = -[NSArray isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_37;
  }
  modeUUID = self->_modeUUID;
  v27 = (NSUUID *)v4[6];
  if (modeUUID == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = modeUUID;
    v30 = -[NSUUID isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_37;
  }
  active = self->_active;
  if (active != objc_msgSend(v4, "isActive"))
  {
LABEL_37:
    v52 = 0;
    goto LABEL_38;
  }
  font = self->_font;
  v33 = (NSString *)v4[7];
  if (font == v33)
  {

  }
  else
  {
    v34 = v33;
    v35 = font;
    v36 = -[NSString isEqual:](v35, "isEqual:", v34);

    if ((v36 & 1) == 0)
      goto LABEL_37;
  }
  color = self->_color;
  v38 = (NSString *)v4[8];
  if (color == v38)
  {

  }
  else
  {
    v39 = v38;
    v40 = color;
    v41 = -[NSString isEqual:](v40, "isEqual:", v39);

    if ((v41 & 1) == 0)
      goto LABEL_37;
  }
  numberingSystem = self->_numberingSystem;
  v43 = (NSString *)v4[9];
  if (numberingSystem == v43)
  {

  }
  else
  {
    v44 = v43;
    v45 = numberingSystem;
    v46 = -[NSString isEqual:](v45, "isEqual:", v44);

    if ((v46 & 1) == 0)
      goto LABEL_37;
  }
  posterUUID = self->_posterUUID;
  v48 = (NSString *)v4[10];
  if (posterUUID == v48)
  {

  }
  else
  {
    v49 = v48;
    v50 = posterUUID;
    v51 = -[NSString isEqual:](v50, "isEqual:", v49);

    if ((v51 & 1) == 0)
      goto LABEL_37;
  }
  v54 = self->_galleryItem;
  v55 = v54;
  if (v54 == v4[11])
    v52 = 1;
  else
    v52 = -[ATXFaceGalleryItem isEqual:](v54, "isEqual:");

LABEL_38:
  return v52;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;

  -[ATXPosterConfiguration extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = 31 * v4 + -[ATXPosterConfiguration isSelected](self, "isSelected");
  -[ATXPosterConfiguration inlineComplication](self, "inlineComplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  -[ATXPosterConfiguration complications](self, "complications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7;

  -[ATXPosterConfiguration landscapeComplications](self, "landscapeComplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") - v9 + 32 * v9;

  -[ATXPosterConfiguration modeUUID](self, "modeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") - v11 + 32 * v11;

  v14 = 31 * v13 + -[ATXPosterConfiguration isActive](self, "isActive");
  -[ATXPosterConfiguration font](self, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash") - v14 + 32 * v14;

  -[ATXPosterConfiguration color](self, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash") - v16 + 32 * v16;

  -[ATXPosterConfiguration numberingSystem](self, "numberingSystem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash") - v18 + 32 * v18;

  -[ATXPosterConfiguration posterUUID](self, "posterUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash") - v20 + 32 * v20;

  -[ATXPosterConfiguration galleryItem](self, "galleryItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash") - v22 + 32 * v22;

  return v24;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (ATXComplication)inlineComplication
{
  return self->_inlineComplication;
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSArray)landscapeComplications
{
  return self->_landscapeComplications;
}

- (NSUUID)modeUUID
{
  return self->_modeUUID;
}

- (NSString)font
{
  return self->_font;
}

- (NSString)color
{
  return self->_color;
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (NSString)posterUUID
{
  return self->_posterUUID;
}

- (ATXFaceGalleryItem)galleryItem
{
  return self->_galleryItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryItem, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_landscapeComplications, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[ATXPosterConfiguration initWithCoder:]";
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%s: error decoding extensionBundleIdentifier", (uint8_t *)&v1, 0xCu);
}

@end
