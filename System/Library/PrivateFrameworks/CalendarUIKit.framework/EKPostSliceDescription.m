@implementation EKPostSliceDescription

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)EKPostSliceDescription;
  -[EKSliceDescription description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPostSliceDescription updatedMainSeriesDetails](self, "updatedMainSeriesDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "masterEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPostSliceDescription createdSeriesDetails](self, "createdSeriesDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "masterEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPostSliceDescription createdSeriesDetails](self, "createdSeriesDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "masterEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ :: Modified series - title: %@ :: Created series - localUID: %@, title: %@"), v3, v5, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKPostSliceDescription;
  v4 = -[EKSliceDescription copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[EKPostSliceDescription updatedMainSeriesDetails](self, "updatedMainSeriesDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpdatedMainSeriesDetails:", v5);

  -[EKPostSliceDescription createdSeriesDetails](self, "createdSeriesDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreatedSeriesDetails:", v6);

  return v4;
}

- (EKPostSliceDescription)initWithOriginalSliceDescription:(id)a3
{
  id v4;
  EKPostSliceDescription *v5;
  void *v6;
  void *v7;
  EKSeriesDetails *v8;
  void *v9;
  uint64_t v10;
  EKSeriesDetails *updatedMainSeriesDetails;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKPostSliceDescription;
  v5 = -[EKPostSliceDescription init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "originalMainSeriesDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSliceDescription setOriginalMainSeriesDetails:](v5, "setOriginalMainSeriesDetails:", v6);

    objc_msgSend(v4, "originalEventToSliceOn");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKSliceDescription setOriginalEventToSliceOn:](v5, "setOriginalEventToSliceOn:", v7);

    v8 = [EKSeriesDetails alloc];
    objc_msgSend(v4, "originalEventToSliceOn");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EKSeriesDetails initWithEvent:](v8, "initWithEvent:", v9);
    updatedMainSeriesDetails = v5->_updatedMainSeriesDetails;
    v5->_updatedMainSeriesDetails = (EKSeriesDetails *)v10;

  }
  return v5;
}

- (EKSeriesDetails)updatedMainSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedMainSeriesDetails:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (EKSeriesDetails)createdSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreatedSeriesDetails:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdSeriesDetails, 0);
  objc_storeStrong((id *)&self->_updatedMainSeriesDetails, 0);
}

@end
