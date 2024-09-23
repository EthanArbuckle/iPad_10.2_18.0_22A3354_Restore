@implementation EKSliceDescription

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSliceDescription originalMainSeriesDetails](self, "originalMainSeriesDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "masterEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKSliceDescription originalMainSeriesDetails](self, "originalMainSeriesDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "masterEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> :: Original master - localUID: %@, title: %@"), v5, self, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setOriginalEventToSliceOn:(id)a3
{
  EKEvent *v4;
  EKEvent *originalEventToSliceOn;

  v4 = (EKEvent *)objc_msgSend(a3, "copy");
  originalEventToSliceOn = self->_originalEventToSliceOn;
  self->_originalEventToSliceOn = v4;

}

- (EKEvent)originalEventToSliceOn
{
  return self->_originalEventToSliceOn;
}

+ (id)sliceDescriptionForSlicingEvent:(id)a3
{
  id v3;
  void *v4;
  EKSeriesDetails *v5;

  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setOriginalEventToSliceOn:", v3);
  v5 = -[EKSeriesDetails initWithEvent:]([EKSeriesDetails alloc], "initWithEvent:", v3);

  objc_msgSend(v4, "setOriginalMainSeriesDetails:", v5);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[EKSliceDescription originalEventToSliceOn](self, "originalEventToSliceOn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalEventToSliceOn:", v5);

  -[EKSliceDescription originalMainSeriesDetails](self, "originalMainSeriesDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalMainSeriesDetails:", v6);

  return v4;
}

- (EKSeriesDetails)originalMainSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOriginalMainSeriesDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMainSeriesDetails, 0);
  objc_storeStrong((id *)&self->_originalEventToSliceOn, 0);
}

@end
