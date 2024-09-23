@implementation CNContactAddFavoriteAction

- (CNContactAddFavoriteAction)initWithContact:(id)a3 propertyItems:(id)a4 favorites:(id)a5
{
  id v9;
  CNContactAddFavoriteAction *v10;
  CNContactAddFavoriteAction *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CNContactAddFavoriteAction;
  v10 = -[CNPropertyAction initWithContact:propertyItems:](&v13, sel_initWithContact_propertyItems_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_favorites, a5);

  return v11;
}

- (BOOL)canPerformAction
{
  return 1;
}

- (id)menuProviderForContextMenuInteraction:(id)a3
{
  id v4;
  CNUIFavoritesEntryPicker *v5;
  void *v6;
  CNUIFavoritesEntryPicker *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = [CNUIFavoritesEntryPicker alloc];
  -[CNContactAction contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNUIFavoritesEntryPicker initWithContact:](v5, "initWithContact:", v6);
  -[CNContactAddFavoriteAction setFavoritesEntryPicker:](self, "setFavoritesEntryPicker:", v7);

  -[CNContactAddFavoriteAction favoritesEntryPicker](self, "favoritesEntryPicker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[CNContactAddFavoriteAction favoritesEntryPicker](self, "favoritesEntryPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "menuProviderForContextMenuInteraction:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNUIFavoritesEntryPicker)favoritesEntryPicker
{
  return self->_favoritesEntryPicker;
}

- (void)setFavoritesEntryPicker:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesEntryPicker, a3);
}

- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4
{
  id v5;

  v5 = a4;
  -[CNContactAddFavoriteAction setFavoritesEntryPicker:](self, "setFavoritesEntryPicker:", 0);
  -[CNContactAddFavoriteAction _saveFavorite:](self, "_saveFavorite:", v5);

}

- (void)_saveFavorite:(id)a3
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  CNContactAddFavoriteAction *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  CNContactAddFavoriteAction *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49 = self;
  -[CNContactAddFavoriteAction favorites](self, "favorites");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactProperty");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "contact");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactProperty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entriesForContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:", v50, v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = v5;
  if (v13)
    goto LABEL_30;
  objc_msgSend(v5, "addEntry:", v4);
  objc_msgSend(v5, "save");
  objc_msgSend(v4, "actionType");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0C965F8];
  v17 = v15 | *MEMORY[0x1E0C965F8];
  v18 = v17 != 0;
  if (v17)
  {
    objc_msgSend(v4, "actionType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", v16) & 1) == 0)
    {

      goto LABEL_13;
    }
  }
  objc_msgSend(v4, "bundleIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0C965E8];
  if (!(v19 | *MEMORY[0x1E0C965E8]))
  {
    if (v18)
    {

    }
    goto LABEL_12;
  }
  v21 = (void *)v19;
  objc_msgSend(v4, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqual:", v20);

  if (!v18)
  {
    if (v23)
      goto LABEL_12;
LABEL_13:
    objc_msgSend(v4, "actionType");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0C96658];
    v27 = (uint64_t *)MEMORY[0x1E0C965C0];
    v28 = v25 | *MEMORY[0x1E0C96658];
    v29 = v28 != 0;
    if (v28
      && (objc_msgSend(v4, "actionType"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          (objc_msgSend(v6, "isEqual:", v26) & 1) == 0))
    {

    }
    else
    {
      objc_msgSend(v4, "bundleIdentifier");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *v27;
      if (!(v30 | *v27))
      {
        if (v29)
        {

        }
        goto LABEL_23;
      }
      v32 = (void *)v30;
      objc_msgSend(v4, "bundleIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqual:", v31);

      if (v29)
      {

        if ((v34 & 1) == 0)
          goto LABEL_31;
LABEL_23:
        v24 = (void *)CNUIContactActionDestinationTypeFaceTime;
        goto LABEL_24;
      }
      if (v34)
        goto LABEL_23;
    }
LABEL_31:
    objc_msgSend(v4, "actionType");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (v42 | v16) != 0;
    if (v42 | v16)
    {
      objc_msgSend(v4, "actionType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", v16) & 1) == 0)
      {

        v35 = 0;
        goto LABEL_25;
      }
    }
    objc_msgSend(v4, "bundleIdentifier");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = *v27;
    if (!(v44 | *v27))
    {
      v36 = v49;
      if (v42 | v16)
      {

      }
      goto LABEL_41;
    }
    v46 = (void *)v44;
    objc_msgSend(v4, "bundleIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqual:", v45);

    v36 = v49;
    if (v43)
    {

      if ((v48 & 1) == 0)
      {
LABEL_38:
        v35 = 0;
        goto LABEL_26;
      }
    }
    else if (!v48)
    {
      goto LABEL_38;
    }
LABEL_41:
    v35 = (id)CNUIContactActionDestinationTypeFaceTimeAudio;
    goto LABEL_26;
  }

  if ((v23 & 1) == 0)
    goto LABEL_13;
LABEL_12:
  v24 = (void *)CNUIContactActionDestinationTypePhoneNumber;
LABEL_24:
  v35 = v24;
LABEL_25:
  v36 = v49;
LABEL_26:
  +[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  v39 = CNUIContactActionTypeAddToFavorites;
  if (v35)
  {
    v52 = CNUIContactActionDestinationType;
    v53[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "logContactActionType:attributes:", v39, v40);

  }
  else
  {
    objc_msgSend(v37, "logContactActionType:attributes:", CNUIContactActionTypeAddToFavorites, 0);
  }

  -[CNContactAction delegate](v36, "delegate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "actionDidFinish:", v36);

LABEL_30:
}

- (CNFavorites)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_favoritesEntryPicker, 0);
}

@end
