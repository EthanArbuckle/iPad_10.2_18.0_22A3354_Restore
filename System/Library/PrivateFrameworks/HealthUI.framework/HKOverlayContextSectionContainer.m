@implementation HKOverlayContextSectionContainer

- (HKOverlayContextSectionContainer)initWithContainerTitle:(id)a3 overlayContextSections:(id)a4
{
  return -[HKOverlayContextSectionContainer initWithContainerTitle:overlayContextSections:primaryDisplayType:](self, "initWithContainerTitle:overlayContextSections:primaryDisplayType:", a3, a4, 0);
}

- (HKOverlayContextSectionContainer)initWithContainerTitle:(id)a3 overlayContextSections:(id)a4 primaryDisplayType:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKOverlayContextSectionContainer *v12;
  HKOverlayContextSectionContainer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKOverlayContextSectionContainer;
  v12 = -[HKOverlayContextSectionContainer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedContainerTitle, a3);
    objc_storeStrong((id *)&v13->_overlayContextSections, a4);
    objc_storeStrong((id *)&v13->_primaryDisplayType, a5);
  }

  return v13;
}

- (NSString)localizedContainerTitle
{
  return self->_localizedContainerTitle;
}

- (NSArray)overlayContextSections
{
  return self->_overlayContextSections;
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayContextSections, 0);
  objc_storeStrong((id *)&self->_localizedContainerTitle, 0);
}

@end
