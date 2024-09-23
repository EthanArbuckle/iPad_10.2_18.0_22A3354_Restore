@implementation VNReadOnlyPersonsModel

- (VNReadOnlyPersonsModel)initWithConfiguration:(id)a3 faceModel:(id)a4
{
  id v7;
  VNReadOnlyPersonsModel *v8;
  VNReadOnlyPersonsModel *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNReadOnlyPersonsModel;
  v8 = -[VNPersonsModel initWithConfiguration:dataSource:](&v11, sel_initWithConfiguration_dataSource_, a3, self);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->super._faceModel_DO_NOT_ACCESS_DIRECTLY, a4);

  return v9;
}

- (BOOL)dropCurrentFaceModelAndReturnError:(id *)a3
{
  if (a3)
  {
    VNPersonsModelErrorForReadOnlyModelWithLocalizedDescription(0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4
{
  return self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
}

- (unint64_t)personCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "personCount");
  else
    v4 = 0;

  return v4;
}

- (id)personUniqueIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "personUniqueIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "faceCountForPersonWithUniqueIdentifier:", v4);
  else
    v7 = 0;

  return v7;
}

- (id)faceObservationsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    VNPersonsModelErrorForReadOnlyModelWithLocalizedDescription(CFSTR("face observations are not available"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "faceCountsForPersonsWithUniqueIdentifiers:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (id)faceCountsForAllPersons
{
  void *v2;
  void *v3;
  void *v4;

  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "faceCountsForAllPersons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v4;
}

- (unint64_t)numberOfPersonsInPersonsModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "personUniqueIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)personsModel:(id)a3 uniqueIdentifierOfPersonAtIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "personUniqueIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E4549388;
  }

  return v8;
}

- (unint64_t)personsModel:(id)a3 indexOfPersonWithUniqueIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v5 = a4;
  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "personUniqueIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v5);

  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (unint64_t)personsModel:(id)a3 numberOfFaceObservationsForPersonAtIndex:(unint64_t)a4
{
  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0);

  return 0;
}

- (id)personsModel:(id)a3 faceObservationAtIndex:(unint64_t)a4 forPersonAtIndex:(unint64_t)a5
{
  void *v5;
  uint64_t v6;
  void *v7;

  -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "faceprintRequestRevision");
  +[VNFaceObservation faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:](VNFaceObservation, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", v6, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isReadOnly
{
  return 1;
}

+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a4;
  objc_msgSend(a1, "configurationFromLoadedObjects:error:", v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
    v10 = 1;
    while (1)
    {
      v11 = v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)&+[VNReadOnlyPersonsModel newModelFromVersion:objects:error:]::kSupportedFaceModelTags + v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        break;
      v10 = 0;
      v9 = 1;
      if ((v11 & 1) == 0)
      {
        if (a5)
        {
          VNPersonsModelErrorForInvalidModelData(CFSTR("face model data is unavailable"));
          v13 = 0;
          v14 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
          v14 = 0;
        }
        goto LABEL_13;
      }
    }
    v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:faceModel:", v8, v13);
    if ((objc_msgSend(v15, "updateInternalConfigurationWithModelFaceprintRequestRevision:error:", objc_msgSend(v13, "faceprintRequestRevision"), a5) & 1) != 0)v14 = v15;
    else
      v14 = 0;

LABEL_13:
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
