@implementation JFXVideoEncoderInterface

- (JFXVideoEncoderInterface)init
{
  JFXVideoEncoderInterface *v2;
  HEVCLosslessEncoder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXVideoEncoderInterface;
  v2 = -[JFXVideoEncoderInterface init](&v5, sel_init);
  if (v2)
  {
    v3 = (HEVCLosslessEncoder *)operator new();
    HEVCLosslessEncoder::HEVCLosslessEncoder(v3);
    v2->m_expectedFrameRate = 30.0;
    v2->m_encoder = v3;
    v2->m_preparedPixelBuffer = 0;
    v2->m_encoderInitialized = 0;
  }
  return v2;
}

- (JFXVideoEncoderInterface)initWithExpectedFrameRate:(double)a3
{
  JFXVideoEncoderInterface *result;

  result = -[JFXVideoEncoderInterface init](self, "init");
  if (result)
    result->m_expectedFrameRate = a3;
  return result;
}

- (void)setupEncoderWithWidth:(int)a3 andHeight:(int)a4 imageFormat:(int)a5 andFramerate:(double)a6
{
  HEVCLosslessEncoder::Open(self->m_encoder, a3, a4, a5, (void (__cdecl *)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef))VTCompressionOutputCallbackImpl, self, a6);
  self->m_encoderInitialized = 1;
}

- (opaqueCMSampleBuffer)encodeFrame:(__CVBuffer *)a3 presentationTime:(id *)a4 frameProperties:(__CFDictionary *)a5
{
  char *v9;
  std::__assoc_sub_state *state;
  void *v11;
  OSType PixelFormatType;
  int v13;
  size_t Width;
  size_t Height;
  uint64_t v16;
  HEVCLosslessEncoder *m_encoder;
  opaqueCMSampleBuffer *v18;
  std::__assoc_sub_state *v19;
  uint64_t *p_shared_owners;
  unint64_t v21;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23;
  uint64_t v24;
  std::__assoc_sub_state *v25;

  v9 = (char *)operator new();
  *((_QWORD *)v9 + 2) = 0;
  *((_QWORD *)v9 + 3) = 850045863;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((_QWORD *)v9 + 10) = 0;
  *((_QWORD *)v9 + 11) = 1018212795;
  *((_OWORD *)v9 + 6) = 0u;
  *((_OWORD *)v9 + 7) = 0u;
  *(_OWORD *)(v9 + 124) = 0u;
  *(_QWORD *)v9 = &off_24EE591B0;
  *((_QWORD *)v9 + 1) = 0;
  state = (std::__assoc_sub_state *)self->m_sampleBufferPromise.__state_;
  v24 = 0;
  v25 = state;
  self->m_sampleBufferPromise.__state_ = v9;
  std::promise<opaqueCMSampleBuffer *>::~promise((uint64_t *)&v25);
  std::promise<opaqueCMSampleBuffer *>::~promise(&v24);
  v11 = self->m_sampleBufferPromise.__state_;
  if (!v11)
    std::__throw_future_error[abi:ne180100](3u);
  v25 = (std::__assoc_sub_state *)self->m_sampleBufferPromise.__state_;
  std::__assoc_sub_state::__attach_future[abi:ne180100]((uint64_t)v11);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v13 = PixelFormatType;
  if (!self->m_encoderInitialized)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (v13 > 1278226735)
    {
      if (v13 != 1278226736)
      {
        if (v13 == 1278226742)
        {
          -[JFXVideoEncoderInterface setupEncoderWithWidth:andHeight:imageFormat:andFramerate:](self, "setupEncoderWithWidth:andHeight:imageFormat:andFramerate:", Width, Height, 9, self->m_expectedFrameRate);
LABEL_4:
          __assert_rtn("-[JFXVideoEncoderInterface encodeFrame:presentationTime:frameProperties:]", "JFXVideoEncoderInterface.mm", 156, "!\"L016 not supported\");
        }
LABEL_21:
        __assert_rtn("-[JFXVideoEncoderInterface encodeFrame:presentationTime:frameProperties:]", "JFXVideoEncoderInterface.mm", 148, "0");
      }
      v16 = 9;
    }
    else
    {
      v16 = 0;
      if (v13 != 875704422 && v13 != 875704438)
        goto LABEL_21;
    }
    -[JFXVideoEncoderInterface setupEncoderWithWidth:andHeight:imageFormat:andFramerate:](self, "setupEncoderWithWidth:andHeight:imageFormat:andFramerate:", Width, Height, v16, self->m_expectedFrameRate);
    goto LABEL_12;
  }
  if (PixelFormatType == 1278226742)
    goto LABEL_4;
LABEL_12:
  m_encoder = self->m_encoder;
  v23 = *a4;
  HEVCLosslessEncoder::EncodeFrame(m_encoder, a3, (CMTime *)&v23, a5);
  v18 = (opaqueCMSampleBuffer *)std::future<opaqueCMSampleBuffer *>::get(&v25);
  v19 = v25;
  if (v25)
  {
    p_shared_owners = &v25->__shared_owners_;
    do
      v21 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v21 - 1, (unint64_t *)p_shared_owners));
    if (!v21)
      ((void (*)(std::__assoc_sub_state *))v19->__on_zero_shared)(v19);
  }
  return v18;
}

- (void)closeEncoder
{
  self->m_encoderInitialized = 0;
  HEVCLosslessEncoder::Close(self->m_encoder);
}

- (void)skipFrame
{
  uint64_t v2;

  v2 = 0;
  std::promise<opaqueCMSampleBuffer *>::set_value((uint64_t *)&self->m_sampleBufferPromise, &v2);
}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *v4;

  v4 = a3;
  CFRetain(a3);
  std::promise<opaqueCMSampleBuffer *>::set_value((uint64_t *)&self->m_sampleBufferPromise, &v4);
}

- (void)dealloc
{
  HEVCLosslessEncoder *m_encoder;
  objc_super v4;

  m_encoder = self->m_encoder;
  if (m_encoder)
  {
    HEVCLosslessEncoder::~HEVCLosslessEncoder(m_encoder);
    MEMORY[0x2276A1A98]();
  }
  v4.receiver = self;
  v4.super_class = (Class)JFXVideoEncoderInterface;
  -[JFXVideoEncoderInterface dealloc](&v4, sel_dealloc);
}

- (opaqueCMSampleBuffer)currentBuffer
{
  return self->_currentBuffer;
}

- (void)setCurrentBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_currentBuffer = a3;
}

- (void).cxx_destruct
{
  std::promise<opaqueCMSampleBuffer *>::~promise((uint64_t *)&self->m_sampleBufferPromise);
}

- (id).cxx_construct
{
  char *v3;

  v3 = (char *)operator new();
  *((_QWORD *)v3 + 2) = 0;
  *((_QWORD *)v3 + 3) = 850045863;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_QWORD *)v3 + 10) = 0;
  *((_QWORD *)v3 + 11) = 1018212795;
  *((_OWORD *)v3 + 6) = 0u;
  *((_OWORD *)v3 + 7) = 0u;
  *(_OWORD *)(v3 + 124) = 0u;
  *(_QWORD *)v3 = &off_24EE591B0;
  *((_QWORD *)v3 + 1) = 0;
  self->m_sampleBufferPromise.__state_ = v3;
  return self;
}

@end
