@implementation SFUnifiedBarContentArrangement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standaloneContentViews, 0);
  objc_storeStrong((id *)&self->_inlineContentView, 0);
}

- (SFUnifiedBarContentArrangement)initWithInlineContentView:(id)a3 standaloneContentViews:(id)a4
{
  id v7;
  id v8;
  SFUnifiedBarContentArrangement *v9;
  SFUnifiedBarContentArrangement *v10;
  uint64_t v11;
  NSArray *standaloneContentViews;
  SFUnifiedBarContentArrangement *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedBarContentArrangement;
  v9 = -[SFUnifiedBarContentArrangement init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inlineContentView, a3);
    v11 = objc_msgSend(v8, "copy");
    standaloneContentViews = v10->_standaloneContentViews;
    v10->_standaloneContentViews = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (SFUnifiedBarContentArrangement)init
{
  return -[SFUnifiedBarContentArrangement initWithInlineContentView:standaloneContentViews:](self, "initWithInlineContentView:standaloneContentViews:", 0, MEMORY[0x1E0C9AA60]);
}

- (BOOL)isEqual:(id)a3
{
  SFUnifiedBarContentArrangement *v4;
  BOOL v5;

  v4 = (SFUnifiedBarContentArrangement *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && self->_inlineContentView == v4->_inlineContentView
      && -[NSArray isEqualToArray:](self->_standaloneContentViews, "isEqualToArray:", v4->_standaloneContentViews);
  }

  return v5;
}

- (NSArray)allContentViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_inlineContentView);
  objc_msgSend(v3, "addObjectsFromArray:", self->_standaloneContentViews);
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (SFUnifiedBarContentView)inlineContentView
{
  return self->_inlineContentView;
}

- (NSArray)standaloneContentViews
{
  return self->_standaloneContentViews;
}

@end
