@implementation AXFavoritesEntryCell

- (AXFavoritesEntryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  AXFavoritesEntryCell *v9;
  AXFavoritesEntryCell *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a5;
  v28.receiver = self;
  v28.super_class = (Class)AXFavoritesEntryCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v28, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[AXFavoritesEntryCell _favoritesEntryForSpecifier:](v9, "_favoritesEntryForSpecifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", CFSTR("favoritesController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AXFavoritesEntryCell _shouldShowDetailForActionType:](v10, "_shouldShowDetailForActionType:", v13))
    {
      v14 = (void *)objc_opt_new();
      -[AXFavoritesEntryCell _imageForActionType:](v10, "_imageForActionType:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXFavoritesEntryCell detailTextLabel](v10, "detailTextLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithTintColor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImage:", v18);

      objc_msgSend(MEMORY[0x1E0CB3778], "attributedStringWithAttachment:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      objc_msgSend(v12, "transportNameForFavoritesEntry:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        v22 = objc_alloc(MEMORY[0x1E0CB3498]);
        AXUILocalizedStringForKey(CFSTR("FAVORITES_TRANSPORT_SEPARATOR"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithString:", v23);
        objc_msgSend(v20, "appendAttributedString:", v24);

        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v21);
        objc_msgSend(v20, "appendAttributedString:", v25);

      }
      -[AXFavoritesEntryCell detailTextLabel](v10, "detailTextLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAttributedText:", v20);

    }
  }

  return v10;
}

- (id)_favoritesEntryForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", CFSTR("favoritesEntry"));
}

- (BOOL)_shouldShowDetailForActionType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C96628]) ^ 1;
}

- (id)_imageForActionType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend((id)*MEMORY[0x1E0C96600], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "favoritesAudioGlyphImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend((id)*MEMORY[0x1E0C96640], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "favoritesTTYDirectGlyphImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend((id)*MEMORY[0x1E0C96650], "isEqualToString:", v3))
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "favoritesTTYRelayGlyphImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend((id)*MEMORY[0x1E0C96660], "isEqualToString:", v3))
    {
      v5 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "favoritesVideoGlyphImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_10:

  return v5;
}

@end
