@implementation SSCHistogramResult

- (id)initForCpuUsage
{
  SSCHistogramResult *v2;
  SSCHistogramResult *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSCHistogramResult;
  v2 = -[SSCHistogramResult init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_realized = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v3;
}

- (SSCHistogramResult)initWithCommandBuffer:(id)a3 andHistogramBuffer:(id)a4
{
  id v7;
  id v8;
  SSCHistogramResult *v9;
  SSCHistogramResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSCHistogramResult;
  v9 = -[SSCHistogramResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_commandBuffer, a3);
    objc_storeStrong((id *)&v10->_histogramBuffer, a4);
    v10->_realized = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v10;
}

- ($A1886C520643A86ACC5362F227C8A889)getHistogramBins
{
  -[SSCHistogramResult _realize](self, "_realize");
  return ($A1886C520643A86ACC5362F227C8A889 *)&self->_bins;
}

- (id)getHistogramMetalBuffer
{
  return self->_histogramBuffer;
}

- (void)_realize
{
  SSCHistogramResult *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_realized)
  {
    -[MTLCommandBuffer waitUntilCompleted](obj->_commandBuffer, "waitUntilCompleted");
    memcpy(&obj->_bins, (const void *)-[MTLBuffer contents](obj->_histogramBuffer, "contents"), sizeof(obj->_bins));
    obj->_realized = 1;
  }
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramBuffer, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
}

@end
