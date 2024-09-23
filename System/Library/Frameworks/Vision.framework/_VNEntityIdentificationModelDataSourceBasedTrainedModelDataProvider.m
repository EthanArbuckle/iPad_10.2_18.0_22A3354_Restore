@implementation _VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider

- (_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider)initWithEntityIdentificationModel:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  _VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider *v9;
  _VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider;
  v9 = -[_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityIdentificationModel, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

- (unint64_t)trainedModelEntityCount
{
  return -[VNEntityIdentificationModelDataSource numberOfEntitiesInEntityIdentificationModel:](self->_dataSource, "numberOfEntitiesInEntityIdentificationModel:", self->_entityIdentificationModel);
}

- (id)trainedModelUniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return (id)-[VNEntityIdentificationModelDataSource entityIdentificationModel:uniqueIdentifierOfEntityAtIndex:](self->_dataSource, "entityIdentificationModel:uniqueIdentifierOfEntityAtIndex:", self->_entityIdentificationModel, a3);
}

- (unint64_t)trainedModelIndexOfEntityWithUniqueIdentifier:(id)a3
{
  return -[VNEntityIdentificationModelDataSource entityIdentificationModel:indexOfEntityWithUniqueIdentifier:](self->_dataSource, "entityIdentificationModel:indexOfEntityWithUniqueIdentifier:", self->_entityIdentificationModel, a3);
}

- (unint64_t)trainedModelNumberOfObservationsForEntityAtIndex:(unint64_t)a3
{
  return -[VNEntityIdentificationModelDataSource entityIdentificationModel:numberOfObservationsForEntityAtIndex:](self->_dataSource, "entityIdentificationModel:numberOfObservationsForEntityAtIndex:", self->_entityIdentificationModel, a3);
}

- (id)trainedModelObservationAtIndex:(unint64_t)a3 forEntityAtIndex:(unint64_t)a4
{
  return (id)-[VNEntityIdentificationModelDataSource entityIdentificationModel:observationAtIndex:forEntityAtIndex:](self->_dataSource, "entityIdentificationModel:observationAtIndex:forEntityAtIndex:", self->_entityIdentificationModel, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_entityIdentificationModel, 0);
}

@end
