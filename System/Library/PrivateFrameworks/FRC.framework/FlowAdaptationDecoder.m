@implementation FlowAdaptationDecoder

- (FlowAdaptationDecoder)initWithMode:(int64_t)a3
{
  return -[FlowAdaptationDecoder initWithMode:revision:](self, "initWithMode:revision:", a3, 1);
}

- (FlowAdaptationDecoder)initWithMode:(int64_t)a3 revision:(int64_t)a4
{
  NSString *espresso_file;
  FlowAdaptationDecoder *v8;
  FlowAdaptationDecoder *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *submissionQueue;
  FlowAdaptationDecoder *v12;
  objc_super v14;

  -[EspressoModel setUsage:](self, "setUsage:");
  -[FlowEstimate setRevision:](self, "setRevision:", a4);
  -[FlowAdaptationDecoder setupNetworkModel](self, "setupNetworkModel");
  espresso_file = self->_espresso_file;
  v14.receiver = self;
  v14.super_class = (Class)FlowAdaptationDecoder;
  v8 = -[EspressoModel initWithModelName:usage:](&v14, sel_initWithModelName_usage_, espresso_file, a3);
  v9 = v8;
  if (v8)
  {
    -[FlowEstimate setLevel:](v8, "setLevel:", 0);
    v10 = dispatch_queue_create("Flow Adaptation Decoder", 0);
    submissionQueue = v9->_submissionQueue;
    v9->_submissionQueue = (OS_dispatch_queue *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)setupNetworkModel
{
  NSString *espresso_file;
  NSString *v4;
  NSString *v5;

  self->super._inputBlobs = (const char **)&inputBlobNames_1;
  espresso_file = self->_espresso_file;
  self->_espresso_file = (NSString *)CFSTR("flow_adaptation_decoder");

  self->super._outputBlobs = (const char **)&outputBlobNames_1;
  if (-[FlowEstimate revision](self, "revision") != 1)
  {
    self->super._outputBlobs = (const char **)&off_1EFE39990;
    -[NSString stringByAppendingFormat:](self->_espresso_file, "stringByAppendingFormat:", CFSTR("_rev%ld"), -[FlowEstimate revision](self, "revision"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_espresso_file;
    self->_espresso_file = v4;

  }
}

- (BOOL)bindCVPixelBuffers:(__CVBuffer *)a3 correlation:(__CVBuffer *)a4 flow:(__CVBuffer *)a5 output:(__CVBuffer *)a6
{
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("Error ! Failed to bind the input feature\n"));
    return 0;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("Error ! Failed to bind the input flow"));
    return 0;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("Error ! Failed to bind the correlation tensor"));
    return 0;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(CFSTR("Error ! Failed to bind the output"));
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
  block[2] = __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke;
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

void __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "bindCVPixelBuffers:correlation:flow:output:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80)) & 1) != 0)
  {
    kdebug_trace();
    v2 = MEMORY[0x1E0C809B0];
    v3 = *(id *)(a1 + 40);
    if (espresso_plan_submit())
    {
      NSLog(CFSTR("FlowAdaptationDecoder: Error !! Network execution Failed. (Usage:%ld)"), objc_msgSend(*(id *)(a1 + 32), "usage"), v2, 3221225472, __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke_2, &unk_1E9786948, v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

uint64_t __71__FlowAdaptationDecoder_estimateFlow_correlation_flow_output_callback___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  kdebug_trace();
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionQueue, 0);
  objc_storeStrong((id *)&self->_espresso_file, 0);
}

@end
