@implementation MUTransitLineItemHeaderViewModel

- (MUTransitLineItemHeaderViewModel)initWithTransitLineItem:(id)a3
{
  id v5;
  MUTransitLineItemHeaderViewModel *v6;
  MUTransitLineItemHeaderViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUTransitLineItemHeaderViewModel;
  v6 = -[MUTransitLineItemHeaderViewModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lineItem, a3);

  return v7;
}

- (MULabeledTokenViewModel)enclosingPlaceViewModel
{
  return 0;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (BOOL)hasEnclosingPlace
{
  return 0;
}

- (id)enclosingPlaceAttributedStringWithFont:(id)a3 labelColor:(id)a4 tokenColor:(id)a5
{
  return 0;
}

- (NSString)placeName
{
  GEOTransitLineItem *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self->_lineItem;
  -[GEOTransitLineItem name](v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
  {
    -[GEOTransitLineItem system](v2, "system");
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (GEOTransitLineItem *)v5;
  }
  -[GEOTransitLineItem name](v2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)placeSecondaryName
{
  return (NSString *)_MULocalizedStringFromThisBundle(CFSTR("Line Card Secondary Name [Placecard]"));
}

- (NSAttributedString)addressDescriptionForContact
{
  return 0;
}

- (NSArray)transitLabelItems
{
  return (NSArray *)-[GEOTransitLineItem labelItems](self->_lineItem, "labelItems");
}

- (BOOL)hasHeroImage
{
  return 0;
}

- (void)loadHeroImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, CGSize, __n128, double))a5 + 2))(a5, 0, 0, 0, a3, *(__n128 *)&a3.height, a4);
}

- (BOOL)isVerified
{
  return 0;
}

- (BOOL)isClaimed
{
  return 0;
}

- (BOOL)hasVerifiedHeaderStyle
{
  return 0;
}

- (BOOL)supportsEnhancedBusinessHeader
{
  return 0;
}

- (void)loadCoverPhotoWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, CGSize, __n128, double))a5 + 2))(a5, 0, 0, 0, a3, *(__n128 *)&a3.height, a4);
}

- (void)loadVerifiedLogoImageWithFrameSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, CGSize, __n128, double))a5 + 2))(a5, 0, 0, 0, a3, *(__n128 *)&a3.height, a4);
}

- (BOOL)supportsLogo
{
  return 0;
}

- (UIColor)coverPhotoBackgroundColor
{
  return 0;
}

- (UIColor)logoBackgroundColor
{
  return 0;
}

- (BOOL)supportsContactAddressDescription
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineItem, 0);
}

@end
