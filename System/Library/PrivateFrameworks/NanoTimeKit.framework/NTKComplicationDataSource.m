@implementation NTKComplicationDataSource

+ (Class)dataSourceClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  +[NTKComplicationDataSourceCache sharedInstance](NTKComplicationDataSourceCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceClassForComplicationType:family:forDevice:", a3, a4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  return 0;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 withFamily:(int64_t)a4 forDevice:(id)a5
{
  id v8;
  char v9;

  v8 = a5;
  if (objc_msgSend(a1, "acceptsComplicationType:forDevice:", a3, v8))
    v9 = objc_msgSend(a1, "acceptsComplicationFamily:forDevice:", a4, v8);
  else
    v9 = 0;

  return v9;
}

- (id)sampleTemplate
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  NTKSampleComplicationDataSource *v8;
  void *v9;
  NTKSampleComplicationDataSource *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKComplicationDataSource;
  -[CLKCComplicationDataSource sampleTemplate](&v12, sel_sampleTemplate);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CLKCComplicationDataSource complication](self, "complication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "complicationType");
    v6 = -[CLKCComplicationDataSource family](self, "family");
    -[CLKCComplicationDataSource device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[NTKSampleComplicationDataSource acceptsComplicationType:withFamily:forDevice:](NTKSampleComplicationDataSource, "acceptsComplicationType:withFamily:forDevice:", v5, v6, v7))
    {
      v8 = [NTKSampleComplicationDataSource alloc];
      -[CLKCComplicationDataSource context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:context:](v8, "initWithComplication:family:forDevice:context:", v4, v6, v7, v9);

      -[NTKSampleComplicationDataSource sampleTemplate](v10, "sampleTemplate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

@end
