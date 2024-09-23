@implementation EKUndoSliceOutcome

- (EKUndoSliceOutcome)initWithOriginalPostSliceDescription:(id)a3
{
  id v5;
  EKUndoSliceOutcome *v6;
  EKUndoSliceOutcome *v7;
  void *v8;
  uint64_t v9;
  EKSeriesDetails *mainSeriesDetails;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  EKEvent *masterToDelete;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EKUndoSliceOutcome;
  v6 = -[EKUndoSliceOutcome init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalPostSliceDescription, a3);
    objc_msgSend(v5, "originalMainSeriesDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    mainSeriesDetails = v7->_mainSeriesDetails;
    v7->_mainSeriesDetails = (EKSeriesDetails *)v9;

    objc_msgSend(v5, "createdSeriesDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "createdSeriesDetails");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "masterEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      masterToDelete = v7->_masterToDelete;
      v7->_masterToDelete = (EKEvent *)v14;

    }
    -[EKPostSliceDescription updatedMainSeriesDetails](v7->_originalPostSliceDescription, "updatedMainSeriesDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "masterEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUndoSliceOutcome _markExistingSeriesMasterAsChangedFromMaster:](v7, "_markExistingSeriesMasterAsChangedFromMaster:", v17);

  }
  return v7;
}

- (id)initResliceFromOutcome:(id)a3
{
  id v4;
  EKUndoSliceOutcome *v5;
  uint64_t v6;
  EKPostSliceDescription *originalPostSliceDescription;
  void *v8;
  uint64_t v9;
  EKSeriesDetails *mainSeriesDetails;
  void *v11;
  uint64_t v12;
  EKSeriesDetails *createdSeriesDetails;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EKUndoSliceOutcome;
  v5 = -[EKUndoSliceOutcome init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "originalPostSliceDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    originalPostSliceDescription = v5->_originalPostSliceDescription;
    v5->_originalPostSliceDescription = (EKPostSliceDescription *)v6;

    -[EKPostSliceDescription updatedMainSeriesDetails](v5->_originalPostSliceDescription, "updatedMainSeriesDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    mainSeriesDetails = v5->_mainSeriesDetails;
    v5->_mainSeriesDetails = (EKSeriesDetails *)v9;

    -[EKPostSliceDescription createdSeriesDetails](v5->_originalPostSliceDescription, "createdSeriesDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    createdSeriesDetails = v5->_createdSeriesDetails;
    v5->_createdSeriesDetails = (EKSeriesDetails *)v12;

    -[EKSeriesDetails masterEvent](v5->_createdSeriesDetails, "masterEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markAsUndeleted");

    -[EKSliceDescription originalMainSeriesDetails](v5->_originalPostSliceDescription, "originalMainSeriesDetails");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "masterEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUndoSliceOutcome _markExistingSeriesMasterAsChangedFromMaster:](v5, "_markExistingSeriesMasterAsChangedFromMaster:", v16);

  }
  return v5;
}

- (void)_markExistingSeriesMasterAsChangedFromMaster:(id)a3
{
  EKSeriesDetails *mainSeriesDetails;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    mainSeriesDetails = self->_mainSeriesDetails;
    v5 = a3;
    -[EKSeriesDetails masterEvent](mainSeriesDetails, "masterEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inverseObjectWithObject:diff:", v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[EKSeriesDetails setMasterEvent:](self->_mainSeriesDetails, "setMasterEvent:", v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EKUndoSliceOutcome originalPostSliceDescription](self, "originalPostSliceDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithOriginalPostSliceDescription:", v5);

  -[EKUndoSliceOutcome masterToDelete](self, "masterToDelete");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasterToDelete:", v7);

  -[EKUndoSliceOutcome mainSeriesDetails](self, "mainSeriesDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMainSeriesDetails:", v8);

  -[EKUndoSliceOutcome createdSeriesDetails](self, "createdSeriesDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCreatedSeriesDetails:", v9);

  return v6;
}

- (EKEvent)masterToDelete
{
  return (EKEvent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMasterToDelete:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (EKSeriesDetails)mainSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMainSeriesDetails:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (EKSeriesDetails)createdSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCreatedSeriesDetails:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (EKPostSliceDescription)originalPostSliceDescription
{
  return (EKPostSliceDescription *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPostSliceDescription, 0);
  objc_storeStrong((id *)&self->_createdSeriesDetails, 0);
  objc_storeStrong((id *)&self->_mainSeriesDetails, 0);
  objc_storeStrong((id *)&self->_masterToDelete, 0);
}

@end
