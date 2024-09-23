@implementation FlowEstimate

+ (int64_t)numLevels
{
  return _numLevels;
}

+ (void)setNumLevels:(int64_t)a3
{
  _numLevels = a3;
}

- (FlowEstimate)initWithMode:(int64_t)a3 level:(unsigned int)a4
{
  return -[FlowEstimate initWithMode:level:revision:](self, "initWithMode:level:revision:", a3, *(_QWORD *)&a4, 1);
}

- (FlowEstimate)initWithMode:(int64_t)a3 level:(unsigned int)a4 revision:(int64_t)a5
{
  uint64_t v6;
  void *v9;
  FlowEstimate *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *submissionQueue;
  FlowEstimate *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a4;
  -[FlowEstimate setLevel:](self, "setLevel:", *(_QWORD *)&a4);
  -[EspressoModel setUsage:](self, "setUsage:", a3);
  -[FlowEstimate setRevision:](self, "setRevision:", a5);
  -[FlowEstimate setupNetworkModel](self, "setupNetworkModel");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), self->_espresso_base_name, (v6 + 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)FlowEstimate;
  v10 = -[EspressoModel initWithModelName:usage:](&v16, sel_initWithModelName_usage_, v9, a3);
  if (v10)
  {
    v11 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Optical Flow Estimate Level %d"), v6));
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    submissionQueue = v10->_submissionQueue;
    v10->_submissionQueue = (OS_dispatch_queue *)v12;

    v14 = v10;
  }

  return v10;
}

- (void)setupNetworkModel
{
  NSString *espresso_base_name;
  __CFString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  unint64_t v10;

  v9 = 0;
  v10 = 0;
  FRCGetInputFrameSizeForUsage(-[EspressoModel usage](self, "usage"), (uint64_t *)&v10, &v9);
  espresso_base_name = self->_espresso_base_name;
  if (v10 <= 0x3E8)
    v4 = CFSTR("optical_flow_estimation_pyrlite");
  else
    v4 = CFSTR("optical_flow_estimation_pyrlite_HD");
  self->_espresso_base_name = &v4->isa;

  if (self->_revision != 1)
  {
    -[NSString stringByAppendingFormat:](self->_espresso_base_name, "stringByAppendingFormat:", CFSTR("_rev%ld"), self->_revision);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_espresso_base_name;
    self->_espresso_base_name = v5;

  }
  -[NSString stringByAppendingString:](self->_espresso_base_name, "stringByAppendingString:", CFSTR("_stage"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = self->_espresso_base_name;
  self->_espresso_base_name = v7;

  self->_inputBlobs = (const char **)&inputBlobNames_0;
  self->_outputBlobs = (const char **)&outputBlobNames_0;
  self->_concatenatedInputBlob = *self->_inputBlobs;
}

- (BOOL)bindCVPixelBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  if (self->_level < 2)
  {
    if (espresso_network_bind_direct_cvpixelbuffer())
      goto LABEL_7;
  }
  else
  {
    if (espresso_network_bind_cvpixelbuffer())
    {
      NSLog(CFSTR("Error ! Failed to bind the input\n"));
      return 0;
    }
    if (espresso_network_bind_cvpixelbuffer())
    {
LABEL_7:
      NSLog(CFSTR("Error ! Failed to bind the correlation tensor"));
      return 0;
    }
    if (_numLevels - 1 != self->_level && espresso_network_bind_cvpixelbuffer())
    {
      NSLog(CFSTR("Error ! Failed to bind the input flow"));
      return 0;
    }
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("Error ! Failed to bind the output buffer"));
    return 0;
  }
  return 1;
}

- (BOOL)estimateFlow:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6 callback:(id)a7
{
  id v12;
  NSObject *submissionQueue;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  __CVBuffer *v19;
  __CVBuffer *v20;
  __CVBuffer *v21;
  __CVBuffer *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v12 = a7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  submissionQueue = self->_submissionQueue;
  v26 = 1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FlowEstimate_estimateFlow_correlation_flow_output_callback___block_invoke;
  block[3] = &unk_1E9786988;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v18 = &v23;
  v19 = a3;
  block[4] = self;
  v17 = v12;
  v14 = v12;
  dispatch_sync(submissionQueue, block);
  LOBYTE(a5) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)a5;
}

void __62__FlowEstimate_estimateFlow_correlation_flow_output_callback___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "bindCVPixelBuffers:correlation:flow:output:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)) & 1) != 0)
  {
    kdebug_trace();
    v2 = *(id *)(a1 + 40);
    if (espresso_plan_submit())
    {
      NSLog(CFSTR("FlowEstimate Level:%d: Error !! Network execution Failed. (Usage:%ld)"), objc_msgSend(*(id *)(a1 + 32), "level"), objc_msgSend(*(id *)(a1 + 32), "usage"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }

  }
  else
  {
    NSLog(CFSTR("Error ! Failed to bind the cv pixel buffers"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

uint64_t __62__FlowEstimate_estimateFlow_correlation_flow_output_callback___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)channels
{
  return self->_channels;
}

- (void)setChannels:(unint64_t)a3
{
  self->_channels = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_espresso_base_name, 0);
}

@end
