@implementation VNPersonsModelFaceModelDataSummarization

- (VNPersonsModelFaceModelDataSummarization)initWithPersonsCount:(unint64_t)a3 faceObservationCountsDistribution:(id)a4 personFaceObservationsCountHistogram:(id)a5
{
  id v8;
  id v9;
  VNPersonsModelFaceModelDataSummarization *v10;
  VNPersonsModelFaceModelDataSummarization *v11;
  uint64_t v12;
  NSIndexSet *faceObservationCountsDistribution;
  uint64_t v14;
  NSCountedSet *personFaceObservationsCountHistogram;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNPersonsModelFaceModelDataSummarization;
  v10 = -[VNPersonsModelFaceModelDataSummarization init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_personsCount = a3;
    v12 = objc_msgSend(v8, "copy");
    faceObservationCountsDistribution = v11->_faceObservationCountsDistribution;
    v11->_faceObservationCountsDistribution = (NSIndexSet *)v12;

    v14 = objc_msgSend(v9, "copy");
    personFaceObservationsCountHistogram = v11->_personFaceObservationsCountHistogram;
    v11->_personFaceObservationsCountHistogram = (NSCountedSet *)v14;

  }
  return v11;
}

- (unint64_t)numberOfPersonsWithFaceObservationsCount:(unint64_t)a3
{
  NSCountedSet *personFaceObservationsCountHistogram;
  void *v4;
  unint64_t v5;

  personFaceObservationsCountHistogram = self->_personFaceObservationsCountHistogram;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSCountedSet countForObject:](personFaceObservationsCountHistogram, "countForObject:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("Persons: %lu"), -[VNPersonsModelFaceModelDataSummarization personsCount](self, "personsCount"));
  -[VNPersonsModelFaceModelDataSummarization faceObservationCountsDistribution](self, "faceObservationCountsDistribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR(" observation counts:"));
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__VNPersonsModelFaceModelDataSummarization_description__block_invoke;
    v6[3] = &unk_1E4548C68;
    v6[4] = self;
    v8 = v9;
    v7 = v3;
    objc_msgSend(v4, "enumerateIndexesWithOptions:usingBlock:", 2, v6);

    _Block_object_dispose(v9, 8);
  }

  return v3;
}

- (unint64_t)personsCount
{
  return self->_personsCount;
}

- (NSIndexSet)faceObservationCountsDistribution
{
  return (NSIndexSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personFaceObservationsCountHistogram, 0);
  objc_storeStrong((id *)&self->_faceObservationCountsDistribution, 0);
}

uint64_t __55__VNPersonsModelFaceModelDataSummarization_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfPersonsWithFaceObservationsCount:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR(","));
  else
    *(_BYTE *)(v5 + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR(" %lu (%lu)"), a2, v4);
}

+ (id)summarizationOfDataFromProvider:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "faceModelPersonsCount");
  v6 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v8 = objc_msgSend(v4, "faceModelNumberOfFaceObservationsForPersonAtIndex:", i);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15++), "unsignedIntegerValue", (_QWORD)v18));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersonsCount:faceObservationCountsDistribution:personFaceObservationsCountHistogram:", v5, v10, v11);
  return v16;
}

@end
