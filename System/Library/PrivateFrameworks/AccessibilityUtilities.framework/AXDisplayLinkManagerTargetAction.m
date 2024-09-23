@implementation AXDisplayLinkManagerTargetAction

- (AXDisplayLinkManagerTargetAction)initWithTarget:(id)a3 actionSelector:(SEL)a4
{
  id v6;
  AXDisplayLinkManagerTargetAction *v7;
  AXDisplayLinkManagerTargetAction *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDisplayLinkManagerTargetAction;
  v7 = -[AXDisplayLinkManagerTargetAction init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[AXDisplayLinkManagerTargetAction setTarget:](v7, "setTarget:", v6);
    -[AXDisplayLinkManagerTargetAction setActionSelector:](v8, "setActionSelector:", a4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[AXDisplayLinkManagerTargetAction actionSelector](self, "actionSelector");
    if (v6 == (const char *)objc_msgSend(v5, "actionSelector"))
    {
      -[AXDisplayLinkManagerTargetAction target](self, "target");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "target");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[AXDisplayLinkManagerTargetAction target](self, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = (unint64_t)sel_getName(-[AXDisplayLinkManagerTargetAction actionSelector](self, "actionSelector"))
     % 0x2710
     + v4;

  return v5;
}

- (void)displayDidRefresh:(id)a3
{
  unint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void (*v8)(void *, SEL, id);
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[AXDisplayLinkManagerTargetAction displayDidRefreshCount](self, "displayDidRefreshCount");
  -[AXDisplayLinkManagerTargetAction target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDisplayLinkManagerTargetAction actionSelector](self, "actionSelector");
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[AXDisplayLinkManagerTargetAction target](self, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void (*)(void *, SEL, id))objc_msgSend(v7, "methodForSelector:", -[AXDisplayLinkManagerTargetAction actionSelector](self, "actionSelector"));

    -[AXDisplayLinkManagerTargetAction target](self, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8(v9, -[AXDisplayLinkManagerTargetAction actionSelector](self, "actionSelector"), v10);

    -[AXDisplayLinkManagerTargetAction setDisplayDidRefreshCount:](self, "setDisplayDidRefreshCount:", v4 + 1);
  }

}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong(&self->_target, a3);
}

- (SEL)actionSelector
{
  return self->_actionSelector;
}

- (void)setActionSelector:(SEL)a3
{
  self->_actionSelector = a3;
}

- (unint64_t)displayDidRefreshCount
{
  return self->_displayDidRefreshCount;
}

- (void)setDisplayDidRefreshCount:(unint64_t)a3
{
  self->_displayDidRefreshCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
}

@end
