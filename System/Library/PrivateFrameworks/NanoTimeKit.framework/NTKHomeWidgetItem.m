@implementation NTKHomeWidgetItem

- (NTKHomeWidgetItem)initWithSectionIdentifier:(id)a3
{
  id v4;
  NTKHomeWidgetItem *v5;
  void *v6;
  uint64_t v7;
  NSString *ntk_identifier;
  uint64_t v9;
  NSString *ntk_sectionIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKHomeWidgetItem;
  v5 = -[NTKHomeWidgetItem init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    ntk_identifier = v5->_ntk_identifier;
    v5->_ntk_identifier = (NSString *)v7;

    v9 = objc_msgSend(v4, "copy");
    ntk_sectionIdentifier = v5->_ntk_sectionIdentifier;
    v5->_ntk_sectionIdentifier = (NSString *)v9;

  }
  return v5;
}

- (unint64_t)ntk_itemType
{
  return 6;
}

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  NTKHomeWidgetItem *v4;
  NTKHomeWidgetItem *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (NTKHomeWidgetItem *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKHomeWidgetItem widgetComplication](v5, "widgetComplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKHomeWidgetItem widgetComplication](self, "widgetComplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == v7;

  }
  else
  {
LABEL_5:
    v8 = 0;
  }
LABEL_7:

  return v8;
}

- (NSString)ntk_identifier
{
  return self->_ntk_identifier;
}

- (NSString)ntk_sectionIdentifier
{
  return self->_ntk_sectionIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (NTKWidgetComplication)widgetComplication
{
  return self->_widgetComplication;
}

- (void)setWidgetComplication:(id)a3
{
  objc_storeStrong((id *)&self->_widgetComplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetComplication, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_ntk_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_ntk_identifier, 0);
}

@end
