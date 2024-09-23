@implementation CSAdjunctListItem

- (CSAdjunctListItem)initWithIdentifier:(id)a3
{
  id v4;
  CSAdjunctListItem *v5;
  uint64_t v6;
  NSMutableSet *actions;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSAdjunctListItem;
  v5 = -[CSAdjunctListItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSMutableSet *)v6;

    v8 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    *(_WORD *)&v5->_animatePresentation = 257;
  }

  return v5;
}

- (SBSLockScreenContentAction)action
{
  return (SBSLockScreenContentAction *)-[NSMutableSet anyObject](self->_actions, "anyObject");
}

- (void)addAction:(id)a3
{
  -[NSMutableSet addObject:](self->_actions, "addObject:", a3);
}

- (void)removeAction:(id)a3
{
  -[NSMutableSet removeObject:](self->_actions, "removeObject:", a3);
}

- (BOOL)isValid
{
  return -[NSMutableSet count](self->_actions, "count") != 0;
}

- (NSString)description
{
  return (NSString *)-[CSAdjunctListItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSAdjunctListItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSAdjunctListItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  -[CSAdjunctListItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_actions, CFSTR("actions"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_animatePresentation, CFSTR("animatePresentation"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_animateDismissal, CFSTR("animateDismissal"));
  -[CSAdjunctListItem itemView](self, "itemView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("itemView"));

  -[CSAdjunctListItem contentHost](self, "contentHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("contentHost"));

  return v4;
}

- (UIView)itemView
{
  return self->itemView;
}

- (void)setItemView:(id)a3
{
  objc_storeStrong((id *)&self->itemView, a3);
}

- (CSAdjunctItemHosting)contentHost
{
  return self->contentHost;
}

- (void)setContentHost:(id)a3
{
  objc_storeStrong((id *)&self->contentHost, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)animatePresentation
{
  return self->_animatePresentation;
}

- (void)setAnimatePresentation:(BOOL)a3
{
  self->_animatePresentation = a3;
}

- (BOOL)animateDismissal
{
  return self->_animateDismissal;
}

- (void)setAnimateDismissal:(BOOL)a3
{
  self->_animateDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->contentHost, 0);
  objc_storeStrong((id *)&self->itemView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
