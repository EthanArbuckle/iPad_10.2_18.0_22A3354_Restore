@implementation MTPerfKit

- (id)flexibleMeasurementWithEventType:(id)a3 eventData:(id)a4
{
  id v6;
  id v7;
  MTFlexiblePerfMeasurement *v8;
  void *v9;
  void *v10;
  MTFlexiblePerfMeasurement *v11;

  v6 = a4;
  v7 = a3;
  v8 = [MTFlexiblePerfMeasurement alloc];
  -[MTMetricsKitTemplate eventHandlers](self, "eventHandlers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flexible");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MTFlexiblePerfMeasurement initWithMeasurementTransformer:eventType:eventData:](v8, "initWithMeasurementTransformer:eventType:eventData:", v10, v7, v6);

  return v11;
}

- (id)flexibleMeasurementWithEventType:(id)a3
{
  return -[MTPerfKit flexibleMeasurementWithEventType:eventData:](self, "flexibleMeasurementWithEventType:eventData:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampling, 0);
}

- (MTPerfKit)initWithTopic:(id)a3
{
  MTPerfKit *v3;
  MTPerfEventHandlers *v4;
  MTPerfUtils *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTPerfKit;
  v3 = -[MTMetricsKitTemplate initWithTopic:](&v7, sel_initWithTopic_, a3);
  if (v3)
  {
    v4 = -[MTObject initWithMetricsKit:]([MTPerfEventHandlers alloc], "initWithMetricsKit:", v3);
    -[MTMetricsKitTemplate setEventHandlers:](v3, "setEventHandlers:", v4);

    v5 = -[MTObject initWithMetricsKit:]([MTPerfUtils alloc], "initWithMetricsKit:", v3);
    -[MTMetricsKitTemplate setUtils:](v3, "setUtils:", v5);

  }
  return v3;
}

- (id)sampling
{
  MTPerfKit *v2;
  MTSampling *v3;
  MTSampling *sampling;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sampling)
  {
    v3 = objc_alloc_init(MTSampling);
    sampling = v2->_sampling;
    v2->_sampling = v3;

  }
  objc_sync_exit(v2);

  return v2->_sampling;
}

- (id)pageRenderMeasurementWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5
{
  return -[MTPerfKit pageRenderMeasurementWithPageId:pageType:pageContext:eventData:](self, "pageRenderMeasurementWithPageId:pageType:pageContext:eventData:", a3, a4, a5, 0);
}

- (id)pageRenderMeasurementWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MTPageRenderMeasurement *v14;
  void *v15;
  void *v16;
  MTPageRenderMeasurement *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [MTPageRenderMeasurement alloc];
  -[MTMetricsKitTemplate eventHandlers](self, "eventHandlers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pageRender");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MTPageRenderMeasurement initWithMeasurementTransformer:pageId:pageType:pageContext:eventData:](v14, "initWithMeasurementTransformer:pageId:pageType:pageContext:eventData:", v16, v13, v12, v11, v10);

  return v17;
}

- (id)loadUrlMeasurement
{
  return -[MTPerfKit loadUrlMeasurementWithEventData:](self, "loadUrlMeasurementWithEventData:", 0);
}

- (id)loadUrlMeasurementWithEventData:(id)a3
{
  id v4;
  MTLoadUrlMeasurement *v5;
  void *v6;
  void *v7;
  MTLoadUrlMeasurement *v8;

  v4 = a3;
  v5 = [MTLoadUrlMeasurement alloc];
  -[MTMetricsKitTemplate eventHandlers](self, "eventHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MTPerfBaseMeasurement initWithMeasurementTransformer:eventData:](v5, "initWithMeasurementTransformer:eventData:", v7, v4);

  return v8;
}

@end
