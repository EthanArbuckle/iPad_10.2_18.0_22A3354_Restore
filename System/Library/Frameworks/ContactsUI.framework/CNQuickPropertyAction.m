@implementation CNQuickPropertyAction

- (CNQuickPropertyAction)initWithPropertyAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNQuickPropertyAction;
  return -[CNQuickContactAction initWithContactAction:](&v4, sel_initWithContactAction_, a3);
}

- (id)propertyItem
{
  void *v2;
  void *v3;

  -[CNQuickPropertyAction propertyAction](self, "propertyAction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)identifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CNQuickPropertyAction propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_coreDuetValue
{
  void *v2;
  void *v3;
  void *v4;

  -[CNQuickPropertyAction propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)titleForContext:(int64_t)a3
{
  void *v3;
  void *v5;
  objc_super v6;

  if ((unint64_t)(a3 - 2) < 4)
    goto LABEL_5;
  if ((unint64_t)a3 < 2)
  {
    v6.receiver = self;
    v6.super_class = (Class)CNQuickPropertyAction;
    -[CNQuickAction titleForContext:](&v6, sel_titleForContext_);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3 == 6)
  {
LABEL_5:
    -[CNQuickPropertyAction propertyItem](self, "propertyItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)subtitleForContext:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 != 1)
    {
      v4 = 0;
      return v4;
    }
    -[CNQuickPropertyAction propertyItem](self, "propertyItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0C97338];
    objc_msgSend(v3, "labeledValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "property");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDisplayStringForLabel:propertyName:", v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNQuickPropertyAction propertyItem](self, "propertyItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)enabled
{
  void *v4;
  char v5;
  objc_super v6;

  if (-[CNQuickAction cached](self, "cached"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CNQuickPropertyAction;
    return -[CNQuickAction enabled](&v6, sel_enabled);
  }
  else
  {
    -[CNQuickPropertyAction propertyAction](self, "propertyAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canPerformAction");

    return v5;
  }
}

- (unint64_t)score
{
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNQuickPropertyAction;
  v3 = -[CNQuickAction score](&v9, sel_score);
  -[CNQuickPropertyAction propertyAction](self, "propertyAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNQuickActionsUsageManager managerForContact:](CNQuickActionsUsageManager, "managerForContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scoreForAction:", self);
  if (v7 > 0.0)
    v3 += vcvtpd_u64_f64((v7 + 1.0) * 1000.0);

  return (unint64_t)v3;
}

- (void)performWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char isKindOfClass;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  CNQuickPropertyAction *v32;
  objc_super v33;

  v4 = a3;
  if (+[CNQuickAction reallyPerform](CNQuickAction, "reallyPerform"))
  {
    v33.receiver = self;
    v33.super_class = (Class)CNQuickPropertyAction;
    -[CNQuickContactAction performWithCompletionBlock:](&v33, sel_performWithCompletionBlock_, v4);
  }
  else
  {
    -[CNQuickAction globalIdentifier](self, "globalIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Perform action %@"), v5);

    -[CNQuickContactAction setCompletionBlock:](self, "setCompletionBlock:", v4);
    -[CNQuickAction globalIdentifier](self, "globalIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[CNQuickPropertyAction propertyItem](self, "propertyItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNQuickPropertyAction propertyAction](self, "propertyAction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNQuickAction category](self, "category");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CNQuickActionCategoryAudioCall);

    if (v12)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        v6 = CFSTR("FaceTime Audio with");
      else
        v6 = CFSTR("Call");
    }
    else
    {
      -[CNQuickAction category](self, "category");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CNQuickActionCategoryVideoCall);

      if (v15)
      {

        v6 = CFSTR("FaceTime with");
      }
      else
      {
        -[CNQuickAction category](self, "category");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CNQuickActionCategoryInstantMessage);

        if (v17)
        {

          v6 = CFSTR("Send message to");
        }
        else
        {
          -[CNQuickAction category](self, "category");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CNQuickActionCategoryMail);

          if (v19)
          {

            v6 = CFSTR("Send email to");
          }
        }
      }
    }
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v10, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ %@ on %@\n\nNote: If you want to really perform the action, go to Internal Settings > Contacts and enable Quick Actions Perform."), v6, v21, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Performing action"), v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0DC3448];
    CNContactsUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __52__CNQuickPropertyAction_performWithCompletionBlock___block_invoke;
    v30[3] = &unk_1E204FFA8;
    v31 = v23;
    v32 = self;
    v27 = v23;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addAction:", v28);

    -[CNQuickContactAction delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contactAction:presentViewController:", self, v27);

  }
}

void __52__CNQuickPropertyAction_performWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "propertyAction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionDidFinish:", v3);

}

@end
