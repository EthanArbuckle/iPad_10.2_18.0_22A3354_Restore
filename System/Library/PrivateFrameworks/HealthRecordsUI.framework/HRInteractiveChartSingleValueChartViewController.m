@implementation HRInteractiveChartSingleValueChartViewController

- (id)makeStandardCurrentValueViewDataSource
{
  _TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource *v7;

  v3 = [_TtC15HealthRecordsUI37SingleValueCurrentValueViewDataSource alloc];
  -[HKInteractiveChartViewController dateCache](self, "dateCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController selectedRangeFormatter](self, "selectedRangeFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SingleValueCurrentValueViewDataSource initWithDateCache:healthStore:selectedRangeFormatter:](v3, "initWithDateCache:healthStore:selectedRangeFormatter:", v4, v5, v6);

  -[HKCurrentValueViewDataSource setDelegate:](v7, "setDelegate:", v7);
  return v7;
}

- (id)makeAnnotationDataSource
{
  _TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource *annotationViewDataSource;
  _TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource *v4;
  _TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource *v5;

  annotationViewDataSource = self->_annotationViewDataSource;
  if (!annotationViewDataSource)
  {
    v4 = objc_alloc_init(_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource);
    v5 = self->_annotationViewDataSource;
    self->_annotationViewDataSource = v4;

    annotationViewDataSource = self->_annotationViewDataSource;
  }
  return annotationViewDataSource;
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 != 1)
  {
    -[HRInteractiveChartSingleValueChartViewController annotationViewDataSource](self, "annotationViewDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedRangeXValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedPointValueRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateUsing:valueRange:dateRange:timeScope:", v12, v13, v14, a5);

    goto LABEL_6;
  }
  objc_msgSend(v15, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HRInteractiveChartSingleValueChartViewController annotationViewDataSource](self, "annotationViewDataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateUsing:", v11);
LABEL_6:

    }
  }

}

- (id)_colorForDisplayType:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "color");
  else
    HKHealthKeyColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_TtC15HealthRecordsUI35SingleValueAnnotationViewDataSource)annotationViewDataSource
{
  return self->_annotationViewDataSource;
}

- (void)setAnnotationViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_annotationViewDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationViewDataSource, 0);
}

@end
