@implementation CVAPhotoMTLRingBuffer

- (id)getBufferAt:(unint64_t)a3
{
  return self->_buffers.__elems_[a3 % 5];
}

- (CVAPhotoMTLRingBuffer)initWithLength:(unint64_t)a3 options:(unint64_t)a4 device:(id)a5
{
  id v8;
  CVAPhotoMTLRingBuffer *v9;
  uint64_t v10;
  MTLBuffer *v11;
  uint64_t v12;
  MTLBuffer *v13;
  uint64_t v14;
  MTLBuffer *v15;
  uint64_t v16;
  MTLBuffer *v17;
  uint64_t v18;
  MTLBuffer *v19;
  CVAPhotoMTLRingBuffer *v20;
  objc_super v22;

  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CVAPhotoMTLRingBuffer;
  v9 = -[CVAPhotoMTLRingBuffer init](&v22, sel_init);
  if (!v9)
    goto LABEL_8;
  v10 = objc_msgSend(v8, "newBufferWithLength:options:", a3, a4);
  v11 = v9->_buffers.__elems_[0];
  v9->_buffers.__elems_[0] = (MTLBuffer *)v10;

  if (!v9->_buffers.__elems_[0])
    goto LABEL_8;
  v12 = objc_msgSend(v8, "newBufferWithLength:options:", a3, a4);
  v13 = v9->_buffers.__elems_[1];
  v9->_buffers.__elems_[1] = (MTLBuffer *)v12;

  if (!v9->_buffers.__elems_[1])
    goto LABEL_8;
  v14 = objc_msgSend(v8, "newBufferWithLength:options:", a3, a4);
  v15 = v9->_buffers.__elems_[2];
  v9->_buffers.__elems_[2] = (MTLBuffer *)v14;

  if (!v9->_buffers.__elems_[2])
    goto LABEL_8;
  v16 = objc_msgSend(v8, "newBufferWithLength:options:", a3, a4);
  v17 = v9->_buffers.__elems_[3];
  v9->_buffers.__elems_[3] = (MTLBuffer *)v16;

  if (!v9->_buffers.__elems_[3])
    goto LABEL_8;
  v18 = objc_msgSend(v8, "newBufferWithLength:options:", a3, a4);
  v19 = v9->_buffers.__elems_[4];
  v9->_buffers.__elems_[4] = (MTLBuffer *)v18;

  if (v9->_buffers.__elems_[4])
    v20 = v9;
  else
LABEL_8:
    v20 = 0;

  return v20;
}

- (CVAPhotoMTLRingBuffer)initWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 device:(id)a6
{
  id v10;
  CVAPhotoMTLRingBuffer *v11;
  uint64_t v12;
  MTLBuffer *v13;
  uint64_t v14;
  MTLBuffer *v15;
  uint64_t v16;
  MTLBuffer *v17;
  uint64_t v18;
  MTLBuffer *v19;
  uint64_t v20;
  MTLBuffer *v21;
  CVAPhotoMTLRingBuffer *v22;
  objc_super v24;

  v10 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CVAPhotoMTLRingBuffer;
  v11 = -[CVAPhotoMTLRingBuffer init](&v24, sel_init);
  if (!v11)
    goto LABEL_8;
  v12 = objc_msgSend(v10, "newBufferWithBytes:length:options:", a3, a4, a5);
  v13 = v11->_buffers.__elems_[0];
  v11->_buffers.__elems_[0] = (MTLBuffer *)v12;

  if (!v11->_buffers.__elems_[0])
    goto LABEL_8;
  v14 = objc_msgSend(v10, "newBufferWithBytes:length:options:", a3, a4, a5);
  v15 = v11->_buffers.__elems_[1];
  v11->_buffers.__elems_[1] = (MTLBuffer *)v14;

  if (!v11->_buffers.__elems_[1])
    goto LABEL_8;
  v16 = objc_msgSend(v10, "newBufferWithBytes:length:options:", a3, a4, a5);
  v17 = v11->_buffers.__elems_[2];
  v11->_buffers.__elems_[2] = (MTLBuffer *)v16;

  if (!v11->_buffers.__elems_[2])
    goto LABEL_8;
  v18 = objc_msgSend(v10, "newBufferWithBytes:length:options:", a3, a4, a5);
  v19 = v11->_buffers.__elems_[3];
  v11->_buffers.__elems_[3] = (MTLBuffer *)v18;

  if (!v11->_buffers.__elems_[3])
    goto LABEL_8;
  v20 = objc_msgSend(v10, "newBufferWithBytes:length:options:", a3, a4, a5);
  v21 = v11->_buffers.__elems_[4];
  v11->_buffers.__elems_[4] = (MTLBuffer *)v20;

  if (v11->_buffers.__elems_[4])
    v22 = v11;
  else
LABEL_8:
    v22 = 0;

  return v22;
}

- (id)currentBuffer
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_getBufferAt_);
}

- (id)advancedBuffer
{
  ++self->_index;
  return -[CVAPhotoMTLRingBuffer currentBuffer](self, "currentBuffer");
}

- (void).cxx_destruct
{

}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
