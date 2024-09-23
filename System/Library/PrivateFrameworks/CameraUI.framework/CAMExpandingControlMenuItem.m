@implementation CAMExpandingControlMenuItem

+ (id)_menuItemWithState:(id)a3 subtitle:(id)a4 selectedSubtitle:(id)a5 configuration:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = objc_alloc_init((Class)objc_opt_class());
  v14 = (void *)*((_QWORD *)v13 + 1);
  *((_QWORD *)v13 + 1) = v9;
  v15 = v9;

  v16 = (void *)*((_QWORD *)v13 + 2);
  *((_QWORD *)v13 + 2) = v10;
  v17 = v10;

  if (v12)
    v18 = v12;
  else
    v18 = v17;
  objc_storeStrong((id *)v13 + 3, v18);
  v19 = objc_msgSend(v11, "copy");

  v20 = (void *)*((_QWORD *)v13 + 4);
  *((_QWORD *)v13 + 4) = v19;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[CAMExpandingControlMenuItem isEqualToItem:](self, "isEqualToItem:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  CAMExpandingControlMenuItem *v4;
  CAMExpandingControlMenuItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = (CAMExpandingControlMenuItem *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v14 = 1;
    }
    else
    {
      -[CAMExpandingControlMenuItem state](self, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMExpandingControlMenuItem state](v5, "state");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToValue:", v7))
      {
        -[CAMExpandingControlMenuItem subtitle](self, "subtitle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMExpandingControlMenuItem subtitle](v5, "subtitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[CAMExpandingControlMenuItem selectedSubtitle](self, "selectedSubtitle");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMExpandingControlMenuItem selectedSubtitle](v5, "selectedSubtitle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", v11))
          {
            -[CAMExpandingControlMenuItem _configuration](self, "_configuration");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAMExpandingControlMenuItem _configuration](v5, "_configuration");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqualToConfiguration:", v13);

          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSValue)state
{
  return self->_state;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)selectedSubtitle
{
  return self->_selectedSubtitle;
}

- (CAMExpandingControlMenuItemConfiguration)_configuration
{
  return self->__configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configuration, 0);
  objc_storeStrong((id *)&self->_selectedSubtitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
