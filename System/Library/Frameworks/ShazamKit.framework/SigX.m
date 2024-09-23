@implementation SigX

- (BOOL)flowBuffer:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a3;
  if (!objc_msgSend(v6, "int16ChannelData"))
  {
    if (objc_msgSend(v6, "int32ChannelData") || !objc_msgSend(v6, "floatChannelData"))
    {
      +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a4, 100, 0);
      v11 = 0;
      goto LABEL_11;
    }
    if (*(_QWORD *)objc_msgSend(v6, "floatChannelData"))
    {
      v12 = *(_QWORD *)objc_msgSend(v6, "floatChannelData");
      v13 = objc_msgSend(v6, "frameLength");
      objc_msgSend(v6, "format");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SigX flowFloatSamples:sampleCount:channels:error:](self, "flowFloatSamples:sampleCount:channels:error:", v12, v13, objc_msgSend(v9, "channelCount"), a4);
      goto LABEL_4;
    }
LABEL_10:
    v11 = 1;
    goto LABEL_11;
  }
  if (!*(_QWORD *)objc_msgSend(v6, "int16ChannelData"))
    goto LABEL_10;
  v7 = *(_QWORD *)objc_msgSend(v6, "int16ChannelData");
  v8 = objc_msgSend(v6, "frameLength");
  objc_msgSend(v6, "format");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SigX flowIntSamples:sampleCount:channels:error:](self, "flowIntSamples:sampleCount:channels:error:", v7, v8, objc_msgSend(v9, "channelCount"), a4);
LABEL_4:
  v11 = v10;

LABEL_11:
  return v11;
}

- (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigvalidation"), a3->var2.var0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (*((uint64_t (**)(const system_error *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding")), *MEMORY[0x24BDD0FC8]));
  return a4 != 0;
}

- (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigx"), -100, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding")), *MEMORY[0x24BDD0FC8]));
  return a4 != 0;
}

- (BOOL)FillUnknownError:(id *)a3
{
  if (a3)
    *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigx"), -200, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", CFSTR("Something unexpected happened."), *MEMORY[0x24BDD0FC8]));
  return a3 != 0;
}

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 signatureOptions:(int)a5 error:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SigX *v9;
  uint64_t v10;
  objc_super v12;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)SigX;
  v9 = -[SigX init](&v12, sel_init);
  if (v9)
  {
    v10 = operator new();
    SHAZAM_SIGX::SHAZAM_SIGX(v10, v8, v7, v6);
    v9->_mySigX = (void *)v10;
  }
  return v9;
}

- (SigX)initWithSignatureType:(int)a3 sampleRate:(unsigned int)a4 error:(id *)a5
{
  return -[SigX initWithSignatureType:sampleRate:signatureOptions:error:](self, "initWithSignatureType:sampleRate:signatureOptions:error:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0, a5);
}

- (BOOL)flowIntSamples:(const signed __int16 *)a3 sampleCount:(int)a4 error:(id *)a5
{
  SHAZAM_SIGX::flow((SHAZAM_SIGX *)self->_mySigX, a3);
  return 1;
}

- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 error:(id *)a5
{
  gsl::details *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  gsl::details *v11;
  gsl::details *v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)a3, (gsl::details *)a4);
  v9 = v8;
  v10 = v8 + 4 * (_QWORD)v7;
  v15 = v8;
  v16 = v10;
  v17 = v8;
  while (v17 != v10)
  {
    v11 = gsl::details::span_iterator<shazam::tfmatch const>::operator*((gsl::details *)&v15);
    *(float *)v11 = *(float *)v11 * 32767.0;
    v12 = gsl::details::span_iterator<float>::operator++((gsl::details *)&v15);
    if (v15 != v9 || v16 != v10)
      gsl::details::terminate(v12);
  }
  SHAZAM_SIGX::flow((SHAZAM_SIGX *)self->_mySigX, a3);
  return 1;
}

- (BOOL)flowIntSamples:(signed __int16 *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  SHAZAM_SIGX::flow((SHAZAM_SIGX *)self->_mySigX, a3, *(uint64_t *)&a4, a5);
  return 1;
}

- (BOOL)flowFloatSamples:(float *)a3 sampleCount:(int)a4 channels:(int)a5 error:(id *)a6
{
  uint64_t v7;
  gsl::details *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  gsl::details *v14;
  gsl::details *v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = *(_QWORD *)&a4;
  v10 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)a3, (gsl::details *)(a5 * a4));
  v12 = v11;
  v13 = v11 + 4 * (_QWORD)v10;
  v18 = v11;
  v19 = v13;
  v20 = v11;
  while (v20 != v13)
  {
    v14 = gsl::details::span_iterator<shazam::tfmatch const>::operator*((gsl::details *)&v18);
    *(float *)v14 = *(float *)v14 * 32767.0;
    v15 = gsl::details::span_iterator<float>::operator++((gsl::details *)&v18);
    if (v18 != v12 || v19 != v13)
      gsl::details::terminate(v15);
  }
  SHAZAM_SIGX::flow((SHAZAM_SIGX *)self->_mySigX, a3, v7, a5);
  return 1;
}

- (BOOL)resetWithError:(id *)a3
{
  SHAZAM_SIGX::reset((SHAZAM_SIGX *)self->_mySigX);
  return 1;
}

- (id)signatureWithError:(id *)a3
{
  void *v3;
  void *__p;
  _BYTE *v6;
  uint64_t v7;

  __p = 0;
  v6 = 0;
  v7 = 0;
  SHAZAM_SIGX::get_signature((_QWORD *)self->_mySigX, &__p);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __p, v6 - (_BYTE *)__p);
  if (__p)
  {
    v6 = __p;
    operator delete(__p);
  }
  return v3;
}

+ (id)version
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", "24.5.8 (compilation mode 'release', built on 'OS X')", objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
}

- (void)dealloc
{
  SHAZAM_SIGX *mySigX;
  objc_super v4;

  mySigX = (SHAZAM_SIGX *)self->_mySigX;
  if (mySigX)
  {
    SHAZAM_SIGX::~SHAZAM_SIGX(mySigX);
    MEMORY[0x219A21574]();
  }

  v4.receiver = self;
  v4.super_class = (Class)SigX;
  -[SigX dealloc](&v4, sel_dealloc);
}

- (BOOL)setRollingBufferSeconds:(float)a3 error:(id *)a4
{
  SHAZAM_SIGX::set_max_rolling_buffer((SHAZAM_SIGX *)self->_mySigX, a3);
  return 1;
}

- (void)enableSpectralOutputForNumberOfFrequencyBins:(int)a3 callbackFrequency:(int)a4 completionHandler:(id)a5
{
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[SigX setSpectralOutputHandler:](self, "setSpectralOutputHandler:", a5);
  v10[0] = &off_24D9B7340;
  v10[1] = self;
  v11 = v10;
  SHAZAM_SIGX::setup_spectral_output((_QWORD *)-[SigX mySigX](self, "mySigX"), a3, a4, (uint64_t)v10);
  v8 = v11;
  if (v11 == v10)
  {
    v9 = 4;
    v8 = v10;
  }
  else
  {
    if (!v11)
      return;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
}

- (void)disableSpectralOutput
{
  SHAZAM_SIGX::disable_spectral_output((SHAZAM_SIGX *)-[SigX mySigX](self, "mySigX"));
  -[SigX setSpectralOutputHandler:](self, "setSpectralOutputHandler:", 0);
}

- (void)mySigX
{
  return self->_mySigX;
}

- (void)setMySigX:(void *)a3
{
  self->_mySigX = a3;
}

- (id)spectralOutputHandler
{
  return self->_spectralOutputHandler;
}

- (void)setSpectralOutputHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:
{
}

- (_QWORD)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24D9B7340;
  result[1] = v3;
  return result;
}

- (uint64_t)enableSpectralOutputForNumberOfFrequencyBins:callbackFrequency:completionHandler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
