@implementation ANSTPixelBuffer

- (ANSTPixelBuffer)init
{
  ANSTPixelBuffer *result;

  result = (ANSTPixelBuffer *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTPixelBuffer)initWithDescriptor:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  ANSTPixelBuffer *v13;
  uint64_t v14;
  ANSTPixelBufferDescriptor *pixelBufferDescriptor;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  const char *v26;
  objc_super v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ANSTPixelBuffer;
  v13 = -[ANSTPixelBuffer init](&v28, sel_init);
  if (!v13)
    goto LABEL_5;
  v14 = objc_msgSend_copy(v10, v11, v12);
  pixelBufferDescriptor = v13->_pixelBufferDescriptor;
  v13->_pixelBufferDescriptor = (ANSTPixelBufferDescriptor *)v14;

  v13->_pixelBuffer = CVPixelBufferRetain(a4);
  v13->_orientation = a5;
  v18 = objc_msgSend_width(v13->_pixelBufferDescriptor, v16, v17);
  if (v18 != CVPixelBufferGetWidth(v13->_pixelBuffer))
    goto LABEL_6;
  v21 = objc_msgSend_height(v13->_pixelBufferDescriptor, v19, v20);
  if (v21 == CVPixelBufferGetHeight(v13->_pixelBuffer)
    && (v23 = objc_msgSend_pixelFormatType(v13->_pixelBufferDescriptor, v19, v22),
        v23 == CVPixelBufferGetPixelFormatType(v13->_pixelBuffer)))
  {
LABEL_5:
    a6 = v13;
  }
  else
  {
LABEL_6:
    if (a6)
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0BA0];
      v30[0] = CFSTR("Pixel buffer's width, height, and pixel format type must match its designated descriptor.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)v30, &v29, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, (uint64_t)CFSTR("ANSTErrorDomain"), 13, v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return (ANSTPixelBuffer *)a6;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ANSTPixelBuffer;
  -[ANSTPixelBuffer dealloc](&v3, sel_dealloc);
}

- (ANSTPixelBufferDescriptor)pixelBufferDescriptor
{
  return self->_pixelBufferDescriptor;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferDescriptor, 0);
}

@end
