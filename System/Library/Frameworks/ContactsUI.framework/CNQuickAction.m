@implementation CNQuickAction

- (CNQuickAction)init
{
  CNQuickAction *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNQuickAction;
  v2 = -[CNQuickAction init](&v5, sel_init);
  -[CNQuickAction setEnabled:](v2, "setEnabled:", 1);
  -[CNQuickAction setDismissesWithAnimation:](v2, "setDismissesWithAnimation:", 1);
  +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickAction setImageTintColor:](v2, "setImageTintColor:", v3);

  return v2;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CNQuickAction globalIdentifier](self, "globalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CNQuickAction globalIdentifier](self, "globalIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "globalIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)globalIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CNQuickAction category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_coreDuetValue
{
  return 0;
}

- (id)_coreDuetInteractionMechanisms
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  int v12;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickAction category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CNQuickActionCategoryAudioCall);

  if ((v5 & 1) != 0)
  {
    v6 = 16;
LABEL_9:
    objc_msgSend(v3, "addIndex:", v6);
    return v3;
  }
  -[CNQuickAction category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CNQuickActionCategoryVideoCall);

  if ((v8 & 1) != 0)
  {
    v6 = 17;
    goto LABEL_9;
  }
  -[CNQuickAction category](self, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CNQuickActionCategoryInstantMessage);

  if (v10)
  {
    objc_msgSend(v3, "addIndex:", 2);
    objc_msgSend(v3, "addIndex:", 3);
    v6 = 4;
    goto LABEL_9;
  }
  -[CNQuickAction category](self, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CNQuickActionCategoryMail);

  if (v12)
  {
    v6 = 1;
    goto LABEL_9;
  }
  return v3;
}

- (BOOL)matchesDuetInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  -[CNQuickAction _coreDuetInteractionMechanisms](self, "_coreDuetInteractionMechanisms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsIndex:", objc_msgSend(v4, "mechanism")))
  {
    objc_msgSend(v4, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNQuickAction _coreDuetValue](self, "_coreDuetValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v7, "compare:options:", v8, 385) == 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = (void *)MEMORY[0x1E0C97398];
          v11 = v8;
          objc_msgSend(v10, "phoneNumberWithStringValue:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v11, "isLikePhoneNumber:", v12);

        }
        else
        {
          v9 = 0;
        }
      }
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIImage)image
{
  UIImage *image;
  UIImage *v3;
  void *v5;
  void *v6;
  void *v7;

  image = self->_image;
  if (image)
  {
    v3 = image;
  }
  else
  {
    -[CNQuickAction userActionType](self, "userActionType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3870];
      -[CNQuickAction imageTintColor](self, "imageTintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cnui_userActionSymbolImageForActionType:scale:withColor:", v5, 3, v7);
      v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CNQuickAction imageForContext:](self, "imageForContext:", 0);
      v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v3;
}

- (id)outlinedImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CNQuickAction userActionType](self, "userActionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    -[CNQuickAction imageTintColor](self, "imageTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cnui_userActionOutlinedSymbolImageForActionType:scale:withColor:", v3, 3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageForContext:(int64_t)a3
{
  void *v4;
  char v5;
  id *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  const __CFString *v21;
  void *v23;
  int v24;
  void *v25;
  int v26;

  -[CNQuickAction category](self, "category", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CNQuickActionCategoryAudioCall);

  if ((v5 & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0C965F8];
  }
  else
  {
    -[CNQuickAction category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CNQuickActionCategoryVideoCall);

    if ((v8 & 1) != 0)
    {
      v6 = (id *)MEMORY[0x1E0C96658];
    }
    else
    {
      -[CNQuickAction category](self, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CNQuickActionCategoryInstantMessage);

      if ((v10 & 1) != 0)
      {
        v6 = (id *)MEMORY[0x1E0C96620];
      }
      else
      {
        -[CNQuickAction category](self, "category");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CNQuickActionCategoryMail);

        if (!v12)
          goto LABEL_11;
        v6 = (id *)MEMORY[0x1E0C96618];
      }
    }
  }
  v13 = *v6;
  if (v13)
  {
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0DC3870];
    -[CNQuickAction imageTintColor](self, "imageTintColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cnui_userActionSymbolImageForActionType:scale:withColor:", v14, 3, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
LABEL_11:
  -[CNQuickAction category](self, "category");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CNQuickActionCategoryInfo);

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0DC3870];
    -[CNQuickAction imageTintColor](self, "imageTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("info.circle.fill");
  }
  else
  {
    -[CNQuickAction category](self, "category");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CNQuickActionCategoryAddToContacts);

    if (!v24)
    {
      v17 = 0;
      return v17;
    }
    -[CNQuickAction identifier](self, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("create-new"));

    v20 = (void *)MEMORY[0x1E0DC3870];
    -[CNQuickAction imageTintColor](self, "imageTintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      v21 = CFSTR("person.crop.circle");
    else
      v21 = CFSTR("person.crop.circle.badge.plus");
  }
  objc_msgSend(v20, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", v21, 3, v14, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v17;
}

- (id)defaultTitleForContext:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[CNQuickAction category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultTitleForActionInCategory:context:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)titleForContext:(int64_t)a3
{
  void *v5;

  -[CNQuickAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CNQuickAction defaultTitleForContext:](self, "defaultTitleForContext:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)subtitleForContext:(int64_t)a3
{
  return 0;
}

- (void)perform
{
  -[CNQuickAction performWithCompletionBlock:](self, "performWithCompletionBlock:", 0);
}

- (void)performWithCompletionBlock:(id)a3
{
  void *v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNQuickAction performBlock](self, "performBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNQuickAction performBlock](self, "performBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();
  }
  else
  {
    -[CNQuickAction globalIdentifier](self, "globalIdentifier");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Perform action %@"), v5);
  }

  -[CNQuickAction manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNQuickAction manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actionPerformed:", self);

  }
  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNQuickAction title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNQuickAction globalIdentifier](self, "globalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ - %@ - score: %lu"), v4, self, v5, v6, -[CNQuickAction score](self, "score"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (BOOL)useDuetIfAvailable
{
  return self->_useDuetIfAvailable;
}

- (void)setUseDuetIfAvailable:(BOOL)a3
{
  self->_useDuetIfAvailable = a3;
}

- (BOOL)isLongPress
{
  return self->_isLongPress;
}

- (void)setIsLongPress:(BOOL)a3
{
  self->_isLongPress = a3;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_imageTintColor, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (CNQuickActionsManager)manager
{
  return (CNQuickActionsManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

- (BOOL)dismissesWithAnimation
{
  return self->_dismissesWithAnimation;
}

- (void)setDismissesWithAnimation:(BOOL)a3
{
  self->_dismissesWithAnimation = a3;
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (id)performBlock
{
  return self->_performBlock;
}

- (void)setPerformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CNContactStyle)previousStyle
{
  return self->_previousStyle;
}

- (void)setPreviousStyle:(id)a3
{
  objc_storeStrong((id *)&self->_previousStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStyle, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (BOOL)reallyPerform
{
  if (reallyPerform_onceToken != -1)
    dispatch_once(&reallyPerform_onceToken, &__block_literal_global_6898);
  return reallyPerform_enabled;
}

+ (id)possibleTitlesForActionsInCategories:(id)a3 context:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__CNQuickAction_possibleTitlesForActionsInCategories_context___block_invoke;
  v12[3] = &unk_1E2048AD8;
  v13 = v8;
  v14 = a1;
  v15 = a4;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

+ (id)defaultTitleForActionInCategory:(id)a3 context:(int64_t)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryAudioCall);
  if (a4 != 5)
  {
    if (v6)
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_AUDIO_CALL");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryVideoCall))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_VIDEO_CALL");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryInstantMessage))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_MESSAGE");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryMail))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_MAIL");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryInfo))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_INFO");
      goto LABEL_22;
    }
LABEL_24:
    v10 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryVideoCall))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_BUTTON_VIDEO_CALL");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryInstantMessage))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_BUTTON_MESSAGE");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryMail))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_BUTTON_MAIL");
      goto LABEL_22;
    }
    if (objc_msgSend(v5, "isEqualToString:", CNQuickActionCategoryInfo))
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ACTION_BUTTON_INFO");
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = CFSTR("ACTION_BUTTON_AUDIO_CALL");
LABEL_22:
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E20507A8, CFSTR("Localized"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
  return v10;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setImage:", v9);

  objc_msgSend(v11, "setTitle:", v10);
  objc_msgSend(v11, "setPerformBlock:", v8);

  return v11;
}

void __62__CNQuickAction_possibleTitlesForActionsInCategories_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultTitleForActionInCategory:context:", v8, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  if (objc_msgSend(v8, "isEqualToString:", CNQuickActionCategoryAudioCall))
  {
    v5 = *(void **)(a1 + 32);
    +[CNQuickFaceTimeAction defaultFaceTimeAudioTitle](CNQuickFaceTimeAction, "defaultFaceTimeAudioTitle");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    objc_msgSend(v5, "addObject:", v6);

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CNQuickActionCategoryVideoCall))
  {
    v5 = *(void **)(a1 + 32);
    +[CNQuickFaceTimeAction defaultFaceTimeTitle](CNQuickFaceTimeAction, "defaultFaceTimeTitle");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __30__CNQuickAction_reallyPerform__block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("CNEnablePerformQuickActions"), (CFStringRef)*MEMORY[0x1E0C9B228], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 0;
  v2 = !v1;
  reallyPerform_enabled = v2;
  return result;
}

- (BOOL)isBackAction
{
  void *v2;
  char v3;

  -[CNQuickAction identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("back"));

  return v3;
}

- (void)setBackAction:(BOOL)a3
{
  -[CNQuickAction setIdentifier:](self, "setIdentifier:", CFSTR("back"));
}

- (id)userActionType
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (userActionType_cn_once_token_1 != -1)
    dispatch_once(&userActionType_cn_once_token_1, &__block_literal_global_18352);
  v3 = (id)userActionType_cn_once_object_1;
  -[CNQuickAction category](self, "category");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = v4;
  else
    v6 = CNQuickActionCategoryMail;
  objc_msgSend(v3, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __51__CNQuickAction_CNUIUserActionItem__userActionType__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96618];
  v6[0] = CNQuickActionCategoryMail;
  v6[1] = CNQuickActionCategoryInstantMessage;
  v1 = *MEMORY[0x1E0C96620];
  v7[0] = v0;
  v7[1] = v1;
  v6[2] = CNQuickActionCategoryAudioCall;
  v6[3] = CNQuickActionCategoryVideoCall;
  v2 = *MEMORY[0x1E0C96658];
  v7[2] = *MEMORY[0x1E0C965F8];
  v7[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)userActionType_cn_once_object_1;
  userActionType_cn_once_object_1 = v4;

}

@end
