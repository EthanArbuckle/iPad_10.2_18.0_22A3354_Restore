@implementation MXMSampleTimeSeries

- (id)timeIndex
{
  return objc_loadWeakRetained((id *)&self->_time);
}

- (MXMSampleTimeSeries)init
{
  return -[MXMSampleTimeSeries initWithAbsoluteTimeSeries:length:](self, "initWithAbsoluteTimeSeries:length:", 0, 0);
}

- (MXMSampleTimeSeries)initWithAbsoluteTimeSeries:(unint64_t *)a3 length:(unint64_t)a4
{
  void *v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MXMSampleTimeSeries *v15;
  id v16;
  id location;

  v7 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  v8 = v7;
  if (a4)
  {
    v9 = v7;
    v10 = a4;
    do
    {
      v11 = *a3++;
      +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", v11);
      *v9++ = v12;
      --v10;
    }
    while (v10);
  }
  objc_initWeak(&location, self);
  +[MXMClockSampleTag absoluteTime](MXMClockSampleTag, "absoluteTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "nanoseconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MXMSampleTimeSeries initWithTimeSeries:tag:unit:length:](self, "initWithTimeSeries:tag:unit:length:", v8, v13, v14, a4);

  if (v15)
  {
    v16 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v15->_time, v16);

  }
  free(v8);
  objc_destroyWeak(&location);
  return v15;
}

- (MXMSampleTimeSeries)initWithContinuousTimeSeries:(unint64_t *)a3 length:(unint64_t)a4
{
  void *v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MXMSampleTimeSeries *v15;
  id v16;
  id location;

  if (initWithContinuousTimeSeries_length__onceToken != -1)
    dispatch_once(&initWithContinuousTimeSeries_length__onceToken, &__block_literal_global_2);
  v7 = malloc_type_malloc(8 * a4, 0x100004000313F17uLL);
  v8 = v7;
  if (a4)
  {
    v9 = v7;
    v10 = a4;
    do
    {
      v11 = *a3++;
      +[MXMMachUtils _nanosecondsWithContinuousTime:](MXMMachUtils, "_nanosecondsWithContinuousTime:", v11);
      *v9++ = v12;
      --v10;
    }
    while (v10);
  }
  objc_initWeak(&location, self);
  +[MXMClockSampleTag continuousTime](MXMClockSampleTag, "continuousTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD18D8], "nanoseconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MXMSampleTimeSeries initWithTimeSeries:tag:unit:length:](self, "initWithTimeSeries:tag:unit:length:", v8, v13, v14, a4);

  if (v15)
  {
    v16 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v15->_time, v16);

  }
  free(v8);
  objc_destroyWeak(&location);
  return v15;
}

void __59__MXMSampleTimeSeries_initWithContinuousTimeSeries_length___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BE90680]);
  v1 = (void *)initWithContinuousTimeSeries_length__transl;
  initWithContinuousTimeSeries_length__transl = (uint64_t)v0;

}

- (MXMSampleTimeSeries)initWithTimeSeries:(double *)a3 tag:(id)a4 unit:(id)a5 length:(unint64_t)a6
{
  id v10;
  id v11;
  MXMSampleTimeSeries *v12;
  id v13;
  objc_super v15;
  id location;

  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  v15.receiver = self;
  v15.super_class = (Class)MXMSampleTimeSeries;
  v12 = -[MXMSampleSet initWithTime:tag:unit:attributes:doubleValues:length:](&v15, sel_initWithTime_tag_unit_attributes_doubleValues_length_, 0, v10, v11, 0, a3, a6);
  if (v12)
  {
    v13 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v12->_time, v13);

  }
  objc_destroyWeak(&location);

  return v12;
}

- (void)_appendAbsoluteTime:(unint64_t)a3
{
  MXMSampleTimeSeries *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = self;
  objc_sync_enter(v4);
  -[MXMSampleSet _prepareUnderlyingBufferSizeWithAdditionalBytes:](v4, "_prepareUnderlyingBufferSizeWithAdditionalBytes:", 8);
  +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", a3);
  v6 = v5;
  v7 = -[MXMSampleSet underlyingBuffer](v4, "underlyingBuffer");
  *(_QWORD *)(v7 + 8 * (_QWORD)-[MXMSampleSet index](v4, "index")[8]) = v6;
  v8 = -[MXMSampleSet index](v4, "index");
  ++*(_QWORD *)(v8 + 8);
  objc_sync_exit(v4);

  -[MXMSampleSet setCachedSamples:](v4, "setCachedSamples:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_time);
}

@end
