@implementation AABCHistograms

- (CBHistogramBuilder)L
{
  return self->_L;
}

- (CBHistogramBuilder)E
{
  return self->_E;
}

- (AABCHistograms)init
{
  CBHistogramBuilder *v2;
  CBHistogramBuilder *v3;
  CBHistogramBuilder *v4;
  CBHistogramBuilder *v5;
  CBHistogramBuilder *v6;
  CBHistogramBuilder *v7;
  void *context;
  objc_super v10;
  SEL v11;
  AABCHistograms *v12;

  v12 = self;
  v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)AABCHistograms;
  v12 = -[AABCHistograms init](&v10, sel_init);
  if (v12)
  {
    context = (void *)MEMORY[0x1B5E4A8B0]();
    v2 = -[CBHistogramBuilder initWithEdges:]([CBHistogramBuilder alloc], "initWithEdges:", &unk_1E69173F0);
    v12->_L = v2;
    v3 = -[CBHistogramBuilder initWithEdges:]([CBHistogramBuilder alloc], "initWithEdges:", &unk_1E69173F0);
    v12->_LOff = v3;
    v4 = -[CBHistogramBuilder initWithEdges:]([CBHistogramBuilder alloc], "initWithEdges:", &unk_1E69173F0);
    v12->_LDevice = v4;
    v5 = -[CBHistogramBuilder initWithEdges:]([CBHistogramBuilder alloc], "initWithEdges:", &unk_1E69173F0);
    v12->_LDeviceOff = v5;
    v6 = -[CBHistogramBuilder initWithEdges:]([CBHistogramBuilder alloc], "initWithEdges:", &unk_1E69173F0);
    v12->_LLPM = v6;
    v7 = -[CBHistogramBuilder initWithEdges:]([CBHistogramBuilder alloc], "initWithEdges:", &unk_1E6917408);
    v12->_E = v7;
    objc_autoreleasePoolPop(context);
  }
  return v12;
}

- (void)submit
{
  void *context;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  v4[0] = CFSTR("standard");
  v5[0] = self->_L;
  v4[1] = CFSTR("off");
  v5[1] = self->_LOff;
  v4[2] = CFSTR("display2");
  v5[2] = self->_LDevice;
  v4[3] = CFSTR("display2.off");
  v5[3] = self->_LDeviceOff;
  v4[4] = CFSTR("LPM");
  v5[4] = self->_LLPM;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_366);
  +[CBAnalytics illuminanceHistogram:](CBAnalytics, "illuminanceHistogram:", self->_E);
  -[CBHistogramBuilder reset](self->_E, "reset");
  objc_autoreleasePoolPop(context);
}

uint64_t __24__AABCHistograms_submit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  +[CBAnalytics luminanceHistogram:withName:](CBAnalytics, "luminanceHistogram:withName:", a3, a2);
  return objc_msgSend(a3, "reset");
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  AABCHistograms *v4;

  v4 = self;
  v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)AABCHistograms;
  -[AABCHistograms dealloc](&v2, sel_dealloc);
}

- (CBHistogramBuilder)LOff
{
  return self->_LOff;
}

- (CBHistogramBuilder)LDevice
{
  return self->_LDevice;
}

- (CBHistogramBuilder)LDeviceOff
{
  return self->_LDeviceOff;
}

- (CBHistogramBuilder)LLPM
{
  return self->_LLPM;
}

@end
