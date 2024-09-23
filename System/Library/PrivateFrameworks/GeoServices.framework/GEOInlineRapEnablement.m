@implementation GEOInlineRapEnablement

- (GEOInlineRapEnablement)initWithEnablement:(id)a3
{
  id v5;
  GEOInlineRapEnablement *v6;
  GEOInlineRapEnablement *v7;
  GEOInlineRapEnablement *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOInlineRapEnablement;
    v6 = -[GEOInlineRapEnablement init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_inlineRapEnablement, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEditable
{
  return -[GEOInlineRapEnablement isHoursEditable](self, "isHoursEditable")
      || -[GEOInlineRapEnablement isPhoneEditable](self, "isPhoneEditable")
      || -[GEOInlineRapEnablement isWebsiteEditable](self, "isWebsiteEditable")
      || -[GEOInlineRapEnablement isAddressEditable](self, "isAddressEditable");
}

- (BOOL)isHoursEditable
{
  return !-[GEOPDInlineRapEnablement hasIsHoursEditable](self->_inlineRapEnablement, "hasIsHoursEditable")
      || -[GEOPDInlineRapEnablement isHoursEditable](self->_inlineRapEnablement, "isHoursEditable");
}

- (BOOL)isPhoneEditable
{
  return !-[GEOPDInlineRapEnablement hasIsPhoneEditable](self->_inlineRapEnablement, "hasIsPhoneEditable")
      || -[GEOPDInlineRapEnablement isPhoneEditable](self->_inlineRapEnablement, "isPhoneEditable");
}

- (BOOL)isWebsiteEditable
{
  return !-[GEOPDInlineRapEnablement hasIsWebsiteEditable](self->_inlineRapEnablement, "hasIsWebsiteEditable")
      || -[GEOPDInlineRapEnablement isWebsiteEditable](self->_inlineRapEnablement, "isWebsiteEditable");
}

- (BOOL)isAddressEditable
{
  return !-[GEOPDInlineRapEnablement hasIsAddressEditable](self->_inlineRapEnablement, "hasIsAddressEditable")
      || -[GEOPDInlineRapEnablement isAddressEditable](self->_inlineRapEnablement, "isAddressEditable");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineRapEnablement, 0);
}

@end
