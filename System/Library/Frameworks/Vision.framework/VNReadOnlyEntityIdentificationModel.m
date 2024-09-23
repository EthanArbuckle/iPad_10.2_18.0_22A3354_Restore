@implementation VNReadOnlyEntityIdentificationModel

- (VNReadOnlyEntityIdentificationModel)initWithConfiguration:(id)a3 trainedModel:(id)a4
{
  id v7;
  VNReadOnlyEntityIdentificationModel *v8;
  VNReadOnlyEntityIdentificationModel *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNReadOnlyEntityIdentificationModel;
  v8 = -[VNEntityIdentificationModel initWithConfiguration:dataSource:](&v11, sel_initWithConfiguration_dataSource_, a3, self);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_trainedModel, a4);

  return v9;
}

- (BOOL)dropTrainedModelAndReturnError:(id *)a3
{
  if (a3)
  {
    VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)trainedModelWithCanceller:(id)a3 error:(id *)a4
{
  return self->_trainedModel;
}

- (unint64_t)observationCountForEntityWithUniqueIdentifier:(id)a3
{
  return -[VNEntityIdentificationModelTrainedModel printCountForEntityWithUniqueIdentifier:](self->_trainedModel, "printCountForEntityWithUniqueIdentifier:", a3);
}

- (id)observationsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(CFSTR("observations are not available in a read-only model"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)observationCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  return -[VNEntityIdentificationModelTrainedModel printCountsForEntitiesWithUniqueIdentifiers:](self->_trainedModel, "printCountsForEntitiesWithUniqueIdentifiers:", a3);
}

- (id)observationCountsForAllEntities
{
  return -[VNEntityIdentificationModelTrainedModel printCountsForAllEntities](self->_trainedModel, "printCountsForAllEntities");
}

- (unint64_t)numberOfEntitiesInEntityIdentificationModel:(id)a3
{
  return -[VNEntityIdentificationModelTrainedModel entityCount](self->_trainedModel, "entityCount", a3);
}

- (id)entityIdentificationModel:(id)a3 uniqueIdentifierOfEntityAtIndex:(unint64_t)a4
{
  return -[VNEntityIdentificationModelTrainedModel uniqueIdentifierOfEntityAtIndex:](self->_trainedModel, "uniqueIdentifierOfEntityAtIndex:", a4);
}

- (unint64_t)entityIdentificationModel:(id)a3 indexOfEntityWithUniqueIdentifier:(id)a4
{
  return -[VNEntityIdentificationModelTrainedModel indexOfEntityWithUniqueIdentifier:](self->_trainedModel, "indexOfEntityWithUniqueIdentifier:", a4);
}

- (unint64_t)entityIdentificationModel:(id)a3 numberOfObservationsForEntityAtIndex:(unint64_t)a4
{
  void *v5;
  unint64_t v6;

  -[VNEntityIdentificationModelTrainedModel uniqueIdentifierOfEntityAtIndex:](self->_trainedModel, "uniqueIdentifierOfEntityAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNEntityIdentificationModelTrainedModel printCountForEntityWithUniqueIdentifier:](self->_trainedModel, "printCountForEntityWithUniqueIdentifier:", v5);

  return v6;
}

- (id)entityIdentificationModel:(id)a3 observationAtIndex:(unint64_t)a4 forEntityAtIndex:(unint64_t)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainedModel, 0);
}

+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a4;
  objc_msgSend(a1, "modelConfigurationForVersion:modelObjects:error:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
    v11 = 1;
    while (1)
    {
      v12 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&newModelForVersion_modelObjects_error__kTrainedModelSupportedTags[4 * v10]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        break;
      v11 = 0;
      v10 = 1;
      if ((v12 & 1) == 0)
      {
        if (a5)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, CFSTR("trained model data is not available"), 0);
          v14 = 0;
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        v14 = 0;
        goto LABEL_16;
      }
    }
    if (!objc_msgSend(v14, "entityCount"))
    {
LABEL_11:
      v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:trainedModel:", v9, v14);
      goto LABEL_17;
    }
    objc_msgSend(v9, "entityPrintOriginatingRequestSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entityPrintOriginatingRequestSpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "hasModelEquivalencyToRequestSpecifier:", v17) & 1) != 0)
    {

      goto LABEL_11;
    }
    if (a5)
    {
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, CFSTR("trained model entity print originating request is not defined"), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    v15 = 0;
LABEL_17:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)isReadOnly
{
  return 1;
}

@end
