@implementation ANSTTensorData

- (ANSTTensorData)init
{
  ANSTTensorData *result;

  result = (ANSTTensorData *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (ANSTTensorData)new
{
  ANSTTensorData *result;

  result = (ANSTTensorData *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTTensorData)initWithDescriptor:(id)a3 dataPointer:(void *)a4 length:(unint64_t)a5 deallocator:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  ANSTTensorData *v16;
  uint64_t v17;
  ANSTTensorDescriptor *tensorDescriptor;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id deallocator;
  unint64_t length;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  objc_super v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)ANSTTensorData;
  v16 = -[ANSTTensorData init](&v32, sel_init);
  if (!v16)
    goto LABEL_8;
  v17 = objc_msgSend_copy(v12, v14, v15);
  tensorDescriptor = v16->_tensorDescriptor;
  v16->_tensorDescriptor = (ANSTTensorDescriptor *)v17;

  v16->_dataPointer = a4;
  v16->_length = a5;
  if (v13)
  {
    v21 = (void *)objc_msgSend_copy(v13, v19, v20);
    v22 = MEMORY[0x23B7DAC00]();
    deallocator = v16->_deallocator;
    v16->_deallocator = (id)v22;

  }
  else
  {
    v21 = v16->_deallocator;
    v16->_deallocator = 0;
  }

  length = v16->_length;
  if (length < objc_msgSend__minimumContiguousLength(v16->_tensorDescriptor, v25, v26))
  {
    if (a7)
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0BA0];
      v34[0] = CFSTR("Tensor data length does not satisfy its descriptor's minimum contiguous length.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v27, (uint64_t)v34, &v33, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("ANSTErrorDomain"), 12, v29);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }
  else
  {
LABEL_8:
    a7 = v16;
  }

  return (ANSTTensorData *)a7;
}

- (void)dealloc
{
  void (**deallocator)(void);
  objc_super v4;

  if (self->_dataPointer)
  {
    deallocator = (void (**)(void))self->_deallocator;
    if (deallocator)
      deallocator[2]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ANSTTensorData;
  -[ANSTTensorData dealloc](&v4, sel_dealloc);
}

- (ANSTTensorDescriptor)tensorDescriptor
{
  return self->_tensorDescriptor;
}

- (BOOL)performDataAccessWithOptions:(unint64_t)a3 usingBlock:(id)a4 error:(id *)a5
{
  (*((void (**)(id, void *, unint64_t))a4 + 2))(a4, self->_dataPointer, a3);
  return 1;
}

- (BOOL)performMutableDataAccessWithOptions:(unint64_t)a3 usingBlock:(id)a4 error:(id *)a5
{
  (*((void (**)(id, void *, unint64_t))a4 + 2))(a4, self->_dataPointer, a3);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocator, 0);
  objc_storeStrong((id *)&self->_tensorDescriptor, 0);
}

@end
