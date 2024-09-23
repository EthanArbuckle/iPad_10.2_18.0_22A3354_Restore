@implementation CNCustomCardAction

- (CNCustomCardAction)initWithTitle:(id)a3 targetActionWrapper:(id)a4 contactIdentifier:(id)a5 placement:(int64_t)a6 isDestructive:(BOOL)a7 menuProvider:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  CNCustomCardAction *v19;
  CNCustomCardAction *v20;
  void *v21;
  id menuProvider;
  CNCustomCardAction *v23;
  void *v25;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNCustomCardAction.m"), 42, CFSTR("placement should not be undefined"));

  }
  v27.receiver = self;
  v27.super_class = (Class)CNCustomCardAction;
  v19 = -[CNCustomCardAction init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_targetActionWrapper, a4);
    objc_storeStrong((id *)&v20->_contactIdentifier, a5);
    v20->_placement = a6;
    v20->_destructive = a7;
    v21 = _Block_copy(v18);
    menuProvider = v20->_menuProvider;
    v20->_menuProvider = v21;

    v23 = v20;
  }

  return v20;
}

- (BOOL)isValidForContact:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCustomCardAction contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)matchesTarget:(id)a3 selector:(SEL)a4 group:(id)a5 inContactContentViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = objc_msgSend((id)objc_opt_class(), "placementForGroup:inContactContentViewController:", v12, v11);

  if (v13 == -[CNCustomCardAction placement](self, "placement"))
  {
    -[CNCustomCardAction targetActionWrapper](self, "targetActionWrapper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "target");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 == v10)
    {
      -[CNCustomCardAction targetActionWrapper](self, "targetActionWrapper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "action") == (_QWORD)a4;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (CNContactTargetActionWrapper)targetActionWrapper
{
  return self->_targetActionWrapper;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (int64_t)placement
{
  return self->_placement;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (id)menuProvider
{
  return self->_menuProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_menuProvider, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_targetActionWrapper, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (int64_t)placementForGroup:(id)a3 inContactContentViewController:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  int64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "cardTopGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v6, "cardBottomGroup");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v5)
    {
      v10 = 2;
    }
    else
    {
      objc_msgSend(v6, "cardFooterGroup");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v5)
        v10 = 3;
      else
        v10 = 0;
    }
  }

  return v10;
}

+ (id)groupForActionGivenPlacement:(int64_t)a3 inContactContentViewController:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 3:
      objc_msgSend(v5, "cardFooterGroup");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v5, "cardBottomGroup");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(v5, "cardTopGroup");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v8 = 0;
      goto LABEL_9;
  }
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

@end
