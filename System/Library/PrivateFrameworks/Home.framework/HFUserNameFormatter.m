@implementation HFUserNameFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

- (HFUserNameFormatter)initWithHome:(id)a3
{
  id v5;
  HFUserNameFormatter *v6;
  HFUserNameFormatter *v7;
  CNContactFormatter *v8;
  CNContactFormatter *contactFormatter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFUserNameFormatter;
  v6 = -[HFUserNameFormatter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactFormatter = v7->_contactFormatter;
    v7->_contactFormatter = v8;

    -[HFUserNameFormatter setStyle:](v7, "setStyle:", 2);
  }

  return v7;
}

- (void)setStyle:(unint64_t)a3
{
  uint64_t v4;
  id v5;

  if (self->_style != a3)
  {
    self->_style = a3;
    v4 = objc_msgSend((id)objc_opt_class(), "_contactFormatterStyleForUserNameStyle:", a3);
    -[HFUserNameFormatter contactFormatter](self, "contactFormatter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", v4);

  }
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

+ (int64_t)_contactFormatterStyleForUserNameStyle:(unint64_t)a3
{
  if (a3 == 1)
    return 1000;
  else
    return 0;
}

- (HFUserNameFormatter)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserNameFormatter.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFUserNameFormatter init]",
    v5);

  return 0;
}

- (id)stringForObjectValue:(id)a3
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
  id v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!-[HFUserNameFormatter style](self, "style"))
      {
        -[HFUserNameFormatter home](self, "home");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hf_userForHandle:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
        goto LABEL_16;
      }
      v5 = (void *)MEMORY[0x1E0C97218];
      -[HFUserNameFormatter contactFormatter](self, "contactFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptorForRequiredKeysForStyle:", objc_msgSend(v6, "style"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[HFContactStore defaultStore](HFContactStore, "defaultStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contactForUserHandle:withKeys:", v4, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFUserNameFormatter contactFormatter](self, "contactFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromContact:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "length"))
      {
        v13 = v12;
      }
      else
      {
        v15 = objc_msgSend(v4, "type");
        if (v15 == 1)
        {
          v16 = CFSTR("HFUserNameFormatterFallbackOtherUserContactName");
        }
        else
        {
          if (v15)
          {
LABEL_14:

            goto LABEL_15;
          }
          v16 = CFSTR("HFUserNameFormatterFallbackCurrentUserContactName");
        }
        _HFLocalizedStringWithDefaultValue(v16, v16, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = v13;
      goto LABEL_14;
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (unint64_t)style
{
  return self->_style;
}

- (HMHome)home
{
  return self->_home;
}

@end
