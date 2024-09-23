@implementation MURelatedPlaceSectionControllerConfiguration

- (MURelatedPlaceSectionControllerConfiguration)initWithDataSource:(int64_t)a3 relatedPlaceList:(id)a4 trailHead:(id)a5
{
  id v9;
  id v10;
  MURelatedPlaceSectionControllerConfiguration *v11;
  MURelatedPlaceSectionControllerConfiguration *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MURelatedPlaceSectionControllerConfiguration;
  v11 = -[MURelatedPlaceSectionControllerConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_dataSource = a3;
    objc_storeStrong((id *)&v11->_relatedPlaceList, a4);
    objc_storeStrong((id *)&v12->_trailHead, a5);
  }

  return v12;
}

- (MURelatedPlaceSectionControllerConfiguration)initWithRelatedPlaceList:(id)a3
{
  return -[MURelatedPlaceSectionControllerConfiguration initWithDataSource:relatedPlaceList:trailHead:](self, "initWithDataSource:relatedPlaceList:trailHead:", 0, a3, 0);
}

- (MURelatedPlaceSectionControllerConfiguration)initWithTrailHead:(id)a3
{
  return -[MURelatedPlaceSectionControllerConfiguration initWithDataSource:relatedPlaceList:trailHead:](self, "initWithDataSource:relatedPlaceList:trailHead:", 1, 0, a3);
}

- (GEORelatedPlaceModuleConfiguration)moduleConfiguration
{
  return self->_moduleConfiguration;
}

- (void)setModuleConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_moduleConfiguration, a3);
}

- (GEORelatedPlaceList)relatedPlaceList
{
  return self->_relatedPlaceList;
}

- (int64_t)dataSource
{
  return self->_dataSource;
}

- (GEOTrailHead)trailHead
{
  return self->_trailHead;
}

- (BOOL)suppressSeeAllButton
{
  return self->_suppressSeeAllButton;
}

- (void)setSuppressSeeAllButton:(BOOL)a3
{
  self->_suppressSeeAllButton = a3;
}

- (unint64_t)numInlineItems
{
  return self->_numInlineItems;
}

- (BOOL)suppressItemSelection
{
  return self->_suppressItemSelection;
}

- (void)setSuppressItemSelection:(BOOL)a3
{
  self->_suppressItemSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailHead, 0);
  objc_storeStrong((id *)&self->_relatedPlaceList, 0);
  objc_storeStrong((id *)&self->_moduleConfiguration, 0);
}

@end
