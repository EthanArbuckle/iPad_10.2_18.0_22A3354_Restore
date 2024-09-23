@implementation MOVStreamPostProcessorFactory

+ (id)defaultFactory
{
  if (+[MOVStreamPostProcessorFactory defaultFactory]::onceToken != -1)
    dispatch_once(&+[MOVStreamPostProcessorFactory defaultFactory]::onceToken, &__block_literal_global_7);
  return (id)+[MOVStreamPostProcessorFactory defaultFactory]::factory;
}

void __47__MOVStreamPostProcessorFactory_defaultFactory__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[MOVStreamPostProcessorFactory defaultFactory]::factory;
  +[MOVStreamPostProcessorFactory defaultFactory]::factory = v0;

}

- (id)postProcessorFromReader:(id)a3 originalPixelFormat:(unsigned int)a4 encodedFormat:(unsigned int)a5 encoderType:(id)a6 streamId:(id)a7
{
  uint64_t v9;
  id v10;
  id v11;
  MOVStreamRawBayerFromYUVPostProcessor *v12;
  MOVStreamy416To2ByteMonochromePostProcessor *v13;
  __objc2_class **v14;
  uint64_t v15;
  void *v16;
  MOVStreamL016Raw14PostProcessor *v18;
  uint64_t v19;

  v9 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a7;
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("RawBayer")) & 1) != 0
    || +[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", v9))
  {
    if (a5 != 2033463606)
    {
      if (a5 == 2019963442)
        v12 = [MOVStreamRawBayerFromYUVPostProcessor alloc];
      else
        v12 = [MOVStreamRawBayerPostProcessor alloc];
      v15 = -[MOVStreamRawBayerFromYUVPostProcessor initWithOriginalPixelFormat:rawBayerMSBReplication:](v12, "initWithOriginalPixelFormat:rawBayerMSBReplication:", v9, objc_msgSend(v10, "rawBayerMSBReplication"));
      goto LABEL_16;
    }
    v14 = &off_24CA43DB8;
    goto LABEL_14;
  }
  if ((_DWORD)v9 == 1278226738 && a5 == 2033463606)
  {
    v13 = [MOVStreamy416To2ByteMonochromePostProcessor alloc];
    v9 = 1278226738;
LABEL_15:
    v15 = -[MOVStreamDefaultPostProcessor initWithOriginalPixelFormat:](v13, "initWithOriginalPixelFormat:", v9);
    goto LABEL_16;
  }
  if (+[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:](MIOPixelBufferUtility, "isPixelFormatCompandedRawBayer:", v9))
  {
    v14 = off_24CA43C48;
LABEL_14:
    v13 = (MOVStreamy416To2ByteMonochromePostProcessor *)objc_alloc(*v14);
    goto LABEL_15;
  }
  if (a5 != 1278226736)
  {
    if (a5 != 1278226488 || !(_DWORD)v9 || (_DWORD)v9 == 1278226488)
    {
      v15 = objc_opt_new();
      goto LABEL_16;
    }
    v14 = off_24CA43C98;
    goto LABEL_14;
  }
  v18 = [MOVStreamL016Raw14PostProcessor alloc];
  if ((_DWORD)v9 == 1278226742)
  {
    v19 = 1;
    v9 = 1278226742;
  }
  else
  {
    v19 = objc_msgSend(v10, "l010OutputFormatRAW14L016");
  }
  v15 = -[MOVStreamL016Raw14PostProcessor initWithOriginalPixelFormat:l010OutputFormatRAW14L016:](v18, "initWithOriginalPixelFormat:l010OutputFormatRAW14L016:", v9, v19);
LABEL_16:
  v16 = (void *)v15;

  return v16;
}

- (id)postProcessorFromReader:(id)a3 originalPixelFormat:(unsigned int)a4 encodedFormat:(unsigned int)a5 encoderType:(id)a6 streamId:(id)a7 bufferCacheMode:(int)a8
{
  uint64_t v8;
  uint64_t v11;
  id v12;
  id v13;
  MOVStreamRawBayerFromYUVPostProcessor *v14;
  __objc2_class **v15;
  uint64_t v16;
  uint64_t v17;
  MOVStreamy416To2ByteMonochromePostProcessor *v18;
  void *v19;
  MOVStreamL016Raw14PostProcessor *v21;
  uint64_t v22;

  v8 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a7;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RawBayer")) & 1) != 0
    || +[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", v11))
  {
    if (a5 != 2033463606)
    {
      if (a5 == 2019963442)
        v14 = [MOVStreamRawBayerFromYUVPostProcessor alloc];
      else
        v14 = [MOVStreamRawBayerPostProcessor alloc];
      v16 = -[MOVStreamRawBayerFromYUVPostProcessor initWithOriginalPixelFormat:bufferCacheMode:rawBayerMSBReplication:](v14, "initWithOriginalPixelFormat:bufferCacheMode:rawBayerMSBReplication:", v11, v8, objc_msgSend(v12, "rawBayerMSBReplication"));
      goto LABEL_19;
    }
    v15 = &off_24CA43DB8;
LABEL_7:
    v16 = objc_msgSend(objc_alloc(*v15), "initWithOriginalPixelFormat:bufferCacheMode:", v11, v8);
    goto LABEL_19;
  }
  v17 = 1278226738;
  if ((_DWORD)v11 == 1278226738 && a5 == 2033463606)
  {
    v18 = [MOVStreamy416To2ByteMonochromePostProcessor alloc];
LABEL_18:
    v16 = -[MOVStreamDefaultPostProcessor initWithOriginalPixelFormat:](v18, "initWithOriginalPixelFormat:", v17);
    goto LABEL_19;
  }
  if (+[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:](MIOPixelBufferUtility, "isPixelFormatCompandedRawBayer:", v11))
  {
    v15 = off_24CA43C48;
    goto LABEL_7;
  }
  if ((_DWORD)v11 == 1899524402 && a5 == 1278226736)
  {
    v18 = [MOVStreamConvertL010Toq8q2PostProcessor alloc];
    v17 = 1899524402;
    goto LABEL_18;
  }
  if (a5 == 1278226488)
  {
    if ((_DWORD)v11 && (_DWORD)v11 != 1278226488)
    {
      v15 = off_24CA43C98;
      goto LABEL_7;
    }
LABEL_27:
    v16 = objc_opt_new();
    goto LABEL_19;
  }
  if (a5 != 1278226736)
    goto LABEL_27;
  v21 = [MOVStreamL016Raw14PostProcessor alloc];
  if ((_DWORD)v11 == 1278226742)
  {
    v22 = 1;
    v11 = 1278226742;
  }
  else
  {
    v22 = objc_msgSend(v12, "l010OutputFormatRAW14L016");
  }
  v16 = -[MOVStreamL016Raw14PostProcessor initWithOriginalPixelFormat:bufferCacheMode:l010OutputFormatRAW14L016:](v21, "initWithOriginalPixelFormat:bufferCacheMode:l010OutputFormatRAW14L016:", v11, v8, v22);
LABEL_19:
  v19 = (void *)v16;

  return v19;
}

@end
