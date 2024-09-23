@implementation MADAlphaSequenceWriter

+ (id)writerWithUniformTypeIdentifier:(id)a3 frameCount:(unint64_t)a4 crop:(CGRect *)a5
{
  id v7;
  void *v8;
  int v9;
  MADHEICSAlphaSequenceWriter *v10;
  __objc2_class *v11;
  MADHEICSAlphaSequenceWriter *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("public.heics"));

  if (v9)
  {
    v10 = -[MADHEICSAlphaSequenceWriter initWithFrameCount:crop:]([MADHEICSAlphaSequenceWriter alloc], "initWithFrameCount:crop:", a4, a5);
LABEL_8:
    v12 = v10;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CEC5B0]))
  {
    v11 = MADHEVCAlphaSequenceWriter;
LABEL_7:
    v10 = (MADHEICSAlphaSequenceWriter *)objc_msgSend([v11 alloc], "initWithFrameCount:", a4);
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CEC580]))
  {
    v11 = MADPNGAlphaSequenceWriter;
    goto LABEL_7;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Output type %@ not supported", (uint8_t *)&v14, 0xCu);
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  return -4;
}

- (id)finishWithEndTime:(id *)a3
{
  return 0;
}

+ (id)transcodeSequenceData:(id)a3 maxDimension:(unint64_t)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6
{
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Transcode not supported", (uint8_t *)&v9, 0xCu);

  }
  return 0;
}

@end
