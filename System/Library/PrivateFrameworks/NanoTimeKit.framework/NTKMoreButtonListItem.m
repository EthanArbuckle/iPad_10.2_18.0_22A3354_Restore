@implementation NTKMoreButtonListItem

- (NTKMoreButtonListItem)initWithSectionIdentifier:(id)a3
{
  id v4;
  NTKMoreButtonListItem *v5;
  void *v6;
  uint64_t v7;
  NSString *ntk_identifier;
  uint64_t v9;
  NSString *ntk_sectionIdentifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKMoreButtonListItem;
  v5 = -[NTKMoreButtonListItem init](&v12, sel_init);
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

- (id)ntk_localizedNameWithOptions:(unint64_t)a3 forRichComplicationSlot:(BOOL)a4
{
  return NTKClockFaceLocalizedString(CFSTR("COMPLICATION_PICKER_MORE_LABEL"), CFSTR("More"));
}

- (unint64_t)ntk_itemType
{
  return 3;
}

- (NSString)ntk_contactIdentifier
{
  return 0;
}

- (NSString)ntk_identifier
{
  return self->_ntk_identifier;
}

- (NSString)ntk_sectionIdentifier
{
  return self->_ntk_sectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ntk_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_ntk_identifier, 0);
}

@end
