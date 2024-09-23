@implementation _VNPersonsModelDataSourceBasedDataProvider

- (_VNPersonsModelDataSourceBasedDataProvider)initWithPersonsModel:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  _VNPersonsModelDataSourceBasedDataProvider *v9;
  _VNPersonsModelDataSourceBasedDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_VNPersonsModelDataSourceBasedDataProvider;
  v9 = -[_VNPersonsModelDataSourceBasedDataProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personsModel, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
  }

  return v10;
}

- (unint64_t)faceModelPersonsCount
{
  return -[VNPersonsModelDataSource numberOfPersonsInPersonsModel:](self->_dataSource, "numberOfPersonsInPersonsModel:", self->_personsModel);
}

- (id)faceModelUniqueIdentifierOfPersonAtIndex:(unint64_t)a3
{
  return (id)-[VNPersonsModelDataSource personsModel:uniqueIdentifierOfPersonAtIndex:](self->_dataSource, "personsModel:uniqueIdentifierOfPersonAtIndex:", self->_personsModel, a3);
}

- (unint64_t)faceModelIndexOfPersonWithUniqueIdentifier:(id)a3
{
  return -[VNPersonsModelDataSource personsModel:indexOfPersonWithUniqueIdentifier:](self->_dataSource, "personsModel:indexOfPersonWithUniqueIdentifier:", self->_personsModel, a3);
}

- (unint64_t)faceModelNumberOfFaceObservationsForPersonAtIndex:(unint64_t)a3
{
  return -[VNPersonsModelDataSource personsModel:numberOfFaceObservationsForPersonAtIndex:](self->_dataSource, "personsModel:numberOfFaceObservationsForPersonAtIndex:", self->_personsModel, a3);
}

- (id)faceModelFaceObservationAtIndex:(unint64_t)a3 forPersonAtIndex:(unint64_t)a4
{
  return (id)-[VNPersonsModelDataSource personsModel:faceObservationAtIndex:forPersonAtIndex:](self->_dataSource, "personsModel:faceObservationAtIndex:forPersonAtIndex:", self->_personsModel, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_personsModel, 0);
}

@end
