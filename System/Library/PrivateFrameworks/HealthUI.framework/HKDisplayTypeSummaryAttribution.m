@implementation HKDisplayTypeSummaryAttribution

- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 urlAttribute:(id)a4 primaryProfileOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  HKDisplayTypeSummaryAttribution *v13;

  v5 = a5;
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0CB3778];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithString:", v10);

  if (v8 && objc_msgSend(v11, "length"))
  {
    objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], v8, 0, objc_msgSend(v11, "length"));
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = -[HKDisplayTypeSummaryAttribution initWithAttribution:hasLink:primaryProfileOnly:](self, "initWithAttribution:hasLink:primaryProfileOnly:", v11, v12, v5);

  return v13;
}

- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 hasLink:(BOOL)a4 primaryProfileOnly:(BOOL)a5
{
  id v8;
  HKDisplayTypeSummaryAttribution *v9;
  uint64_t v10;
  NSAttributedString *attribution;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKDisplayTypeSummaryAttribution;
  v9 = -[HKDisplayTypeSummaryAttribution init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    attribution = v9->_attribution;
    v9->_attribution = (NSAttributedString *)v10;

    v9->_hasLink = a4;
    v9->_primaryProfileOnly = a5;
  }

  return v9;
}

- (HKDisplayTypeSummaryAttribution)initWithAttribution:(id)a3 urlAttribute:(id)a4 iPadUrlAttribute:(id)a5 primaryProfileOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  HKDisplayTypeSummaryAttribution *v16;
  id v17;
  HKDisplayTypeSummaryAttribution *v18;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB6F18];
  v13 = a3;
  objc_msgSend(v12, "sharedBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isiPad");

  v16 = [HKDisplayTypeSummaryAttribution alloc];
  if (v15)
    v17 = v11;
  else
    v17 = v10;
  v18 = -[HKDisplayTypeSummaryAttribution initWithAttribution:urlAttribute:primaryProfileOnly:](v16, "initWithAttribution:urlAttribute:primaryProfileOnly:", v13, v17, v6);

  return v18;
}

- (unint64_t)hash
{
  return -[NSAttributedString hash](self->_attribution, "hash") ^ self->_hasLink ^ (2 * self->_primaryProfileOnly);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0
    && -[NSAttributedString isEqualToAttributedString:](self->_attribution, "isEqualToAttributedString:", v4[2])
    && self->_hasLink == *((unsigned __int8 *)v4 + 8)
    && self->_primaryProfileOnly == *((unsigned __int8 *)v4 + 9);

  return v5;
}

- (NSAttributedString)attribution
{
  return self->_attribution;
}

- (BOOL)hasLink
{
  return self->_hasLink;
}

- (BOOL)primaryProfileOnly
{
  return self->_primaryProfileOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
