@implementation GEORelatedPlaceModuleConfiguration

- (GEORelatedPlaceModuleConfiguration)initWithPlaceTemplateModuleConfiguration:(id)a3
{
  id v5;
  GEORelatedPlaceModuleConfiguration *v6;
  GEORelatedPlaceModuleConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORelatedPlaceModuleConfiguration;
  v6 = -[GEORelatedPlaceModuleConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_relatedPlaceConfig, a3);

  return v7;
}

- (NSString)sectionTitle
{
  return (NSString *)-[GEOPDTemplatePlaceModuleConfiguration sectionTitle](self->_relatedPlaceConfig, "sectionTitle");
}

- (int)componentIdentifier
{
  GEOPDTemplatePlaceModuleConfiguration *relatedPlaceConfig;

  relatedPlaceConfig = self->_relatedPlaceConfig;
  if (relatedPlaceConfig)
    return relatedPlaceConfig->_templatePlaceComponentId;
  else
    return 0;
}

- (unint64_t)numberOfRows
{
  GEOPDTemplatePlaceModuleConfiguration *relatedPlaceConfig;

  relatedPlaceConfig = self->_relatedPlaceConfig;
  if (!relatedPlaceConfig)
    return 0;
  if ((*(_BYTE *)&relatedPlaceConfig->_flags & 2) != 0)
    return relatedPlaceConfig->_numberOfRows;
  return 1;
}

- (BOOL)isVertical
{
  GEOPDTemplatePlaceModuleConfiguration *relatedPlaceConfig;

  relatedPlaceConfig = self->_relatedPlaceConfig;
  return relatedPlaceConfig && (*(_BYTE *)&relatedPlaceConfig->_flags & 4) != 0 && relatedPlaceConfig->_orientation == 2;
}

- (int)layoutVariant
{
  GEOPDTemplatePlaceModuleConfiguration *relatedPlaceConfig;
  int layoutType;

  relatedPlaceConfig = self->_relatedPlaceConfig;
  if (!relatedPlaceConfig || (*(_BYTE *)&relatedPlaceConfig->_flags & 1) == 0)
    return 0;
  layoutType = relatedPlaceConfig->_layoutType;
  if ((layoutType - 1) >= 4)
    return 0;
  else
    return layoutType;
}

- (id)description
{
  return -[GEOPDTemplatePlaceModuleConfiguration description](self->_relatedPlaceConfig, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlaceConfig, 0);
}

@end
