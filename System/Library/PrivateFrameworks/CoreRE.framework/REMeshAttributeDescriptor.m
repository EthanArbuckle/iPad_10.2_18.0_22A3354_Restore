@implementation REMeshAttributeDescriptor

- (REMeshAttributeDescriptor)initWithMeshAssetBuffer:(const void *)a3 payloadBuilder:(void *)a4
{
  re *v7;
  re *v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;
  REMeshAttributeDescriptor *v12;
  const re::StringID *v13;
  int v14;
  char *v15;
  uint64_t v16;
  uint8_t v18[16];

  v7 = (re *)re::sizeFromVertexFormat(*((unsigned __int8 *)a3 + 72), (uint64_t)a2);
  v8 = v7;
  v9 = v7;
  v10 = *((_QWORD *)a3 + 6) / (unint64_t)v7;
  if (HIDWORD(v10))
  {
    v11 = *re::assetTypesLogObjects(v7);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl(&dword_224FE9000, v11, OS_LOG_TYPE_FAULT, "Vertex count overflow when initializing REMeshAttributeDescriptor", v18, 2u);
    }
    v12 = 0;
  }
  else
  {
    re::StringID::StringID((re::StringID *)v18, (const re::DynamicString *)a3);
    v14 = re::bufferIdentifierForMeshAttribute((re *)v18, v13);
    re::StringID::destroyString((re::StringID *)v18);
    if ((v14 & 0xFFFFFFFC) == 4)
      v15 = (char *)a4 + 64;
    else
      v15 = (char *)a4 + 8;
    if (v9 <= 4)
      v16 = 4;
    else
      v16 = v9;
    v12 = self;
  }

  return v12;
}

- (REMeshAttributeDescriptor)initWithVertexAttributeDescriptor:(const VertexAttributeDescriptor *)a3 payloadOffset:(unsigned int)a4 count:(unsigned int)a5
{
  return -[REMeshAttributeDescriptor initWithPayloadOffset:count:format:stepFunction:stride:](self, "initWithPayloadOffset:count:format:stepFunction:stride:", *(_QWORD *)&a4, *(_QWORD *)&a5, a3->var1, a3->var2, re::sizeFromVertexFormat(a3->var1, (uint64_t)a2));
}

- (void)addBufferToArray:(void *)a3 name:(const char *)a4 payloadBuffer:(const void *)a5
{
  const re::StringID *v9;
  unsigned int v10;
  _anonymous_namespace_ *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  void *v17;
  char v18;
  char v19;
  id v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;

  v16 = 0;
  v17 = &str_110;
  v10 = re::bufferIdentifierForMeshAttribute((re *)&v16, v9);
  re::StringID::destroyString((re::StringID *)&v16);
  v18 = -[REMeshAttributeDescriptor format](self, "format");
  v19 = -[REMeshAttributeDescriptor stepFunction](self, "stepFunction");
  if (v10 >= 8)
  {
    re::internal::assertLog((re::internal *)6, v12, "assertion failure: '%s' (%s:line %i) Index out of range. index = %zu, size = %zu", "index < N", "operator[]", 242, v10, 8);
    _os_crash();
    __break(1u);
  }
  else
  {
    v13 = (void *)*((_QWORD *)a5 + v10);
    v14 = -[REMeshAttributeDescriptor payloadOffset](self, "payloadOffset");
    v15 = -[REMeshAttributeDescriptor bufferSize](self, "bufferSize");
    v20 = 0;
    v20 = v13;
    v21 = v14;
    v22 = v15;
    v23 = 0;
    v24 = -[REMeshAttributeDescriptor stride](self, "stride");
    re::DynamicArray<re::NamedVertexBuffer>::add((_anonymous_namespace_ *)a3, (uint64_t)&v16);
    if (v20)
    {

      v20 = 0;
    }
    if (v16)
    {
      if ((v17 & 1) != 0)
        (*(void (**)(void))(*(_QWORD *)v16 + 40))();
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshAttributeDescriptor)initWithPayloadOffset:(unsigned int)a3 count:(unsigned int)a4 format:(unint64_t)a5 stepFunction:(unint64_t)a6 stride:(unsigned int)a7
{
  REMeshAttributeDescriptor *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)REMeshAttributeDescriptor;
  result = -[REMeshAttributeDescriptor init](&v13, sel_init);
  if (result)
  {
    result->_payloadOffset = a3;
    result->_count = a4;
    result->_format = a5;
    result->_stepFunction = a6;
    result->_stride = a7;
  }
  return result;
}

- (REMeshAttributeDescriptor)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;
  unsigned int *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  unint64_t v18;
  unint64_t v19;
  unsigned __int8 v20;
  unsigned int *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  unint64_t v29;
  NSString *v30;
  REMeshAttributeDescriptor *v31;
  void *v32;
  const re::IntrospectionBase *v34;
  const re::IntrospectionBase *v35;
  uint8_t v36[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("payloadOffset"));
  self->_payloadOffset = v5;
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
  self->_count = v6;
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
  v8 = v7;
  v9 = atomic_load((unsigned __int8 *)&qword_254104558);
  if ((v9 & 1) == 0)
  {
    v7 = __cxa_guard_acquire(&qword_254104558);
    if ((_DWORD)v7)
    {
      qword_254104550 = (uint64_t)re::mtl::introspect_VertexFormat(0, v34);
      __cxa_guard_release(&qword_254104558);
    }
  }
  if (!v8)
    goto LABEL_10;
  v10 = *(unsigned int **)(qword_254104550 + 64);
  v11 = *v10;
  if (!(_DWORD)v11)
    goto LABEL_10;
  v12 = 0;
  v13 = *((_QWORD *)v10 + 1);
  v14 = 1;
  do
  {
    v15 = *(_QWORD *)(v13 + 8 * v12);
    if (*(_DWORD *)v15 == 1 && *(_QWORD *)(v15 + 8) == v8)
      break;
    v14 = ++v12 < v11;
  }
  while (v11 != v12);
  if (v14)
  {
    self->_format = v8;
    v16 = 1;
  }
  else
  {
LABEL_10:
    self->_format = 0;
    v17 = *re::assetTypesLogObjects((re *)v7);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_error_impl(&dword_224FE9000, v17, OS_LOG_TYPE_ERROR, "Invalid MTLVertexFormat when decoding REMeshAttributeDescriptor", v36, 2u);
    }
    v16 = 0;
  }
  v18 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stepFunction"));
  v19 = v18;
  v20 = atomic_load((unsigned __int8 *)&qword_254104568);
  if ((v20 & 1) == 0)
  {
    v18 = __cxa_guard_acquire(&qword_254104568);
    if ((_DWORD)v18)
    {
      qword_254104560 = (uint64_t)re::mtl::introspect_VertexStepFunction(0, v35);
      __cxa_guard_release(&qword_254104568);
    }
  }
  v21 = *(unsigned int **)(qword_254104560 + 64);
  v22 = *v21;
  if (!(_DWORD)v22)
    goto LABEL_21;
  v23 = 0;
  v24 = *((_QWORD *)v21 + 1);
  v25 = 1;
  do
  {
    v26 = *(_QWORD *)(v24 + 8 * v23);
    if (*(_DWORD *)v26 == 1 && *(_QWORD *)(v26 + 8) == v19)
      break;
    v25 = ++v23 < v22;
  }
  while (v22 != v23);
  if (v25)
  {
    self->_stepFunction = v19;
    v27 = 1;
  }
  else
  {
LABEL_21:
    self->_stepFunction = -1;
    v28 = *re::assetTypesLogObjects((re *)v18);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_224FE9000, v28, OS_LOG_TYPE_ERROR, "Invalid MTLVertexStepFunction when decoding REMeshAttributeDescriptor", buf, 2u);
    }
    v27 = 0;
  }
  v29 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stride"));
  self->_stride = v29;
  if (HIDWORD(v29) || HIDWORD(v6) || HIDWORD(v5))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v32);
LABEL_31:

    v31 = 0;
    goto LABEL_32;
  }
  if ((v16 & v27 & 1) == 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v32);
    goto LABEL_31;
  }
  v31 = self;
LABEL_32:

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_payloadOffset, CFSTR("payloadOffset"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_stepFunction, CFSTR("stepFunction"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_stride, CFSTR("stride"));

}

- (BOOL)validateWithPayloadSize:(unint64_t)a3 error:(id *)a4
{
  unint64_t payloadOffset;
  unint64_t v7;

  payloadOffset = self->_payloadOffset;
  v7 = -[REMeshAttributeDescriptor bufferSize](self, "bufferSize");
  if (v7 && !__CFADD__(payloadOffset, v7) && payloadOffset < a3 && payloadOffset + v7 <= a3)
    return 1;
  return 0;
}

- (unint64_t)bufferSize
{
  unsigned int v3;
  uint64_t count;

  v3 = re::sizeFromVertexFormat(LOBYTE(self->_format), (uint64_t)a2);
  count = self->_count;
  if ((_DWORD)count)
    return (count - 1) * self->_stride + v3;
  else
    return 0;
}

- (unint64_t)estimateContainerSize
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return class_getInstanceSize(v2);
}

- (unsigned)payloadOffset
{
  return self->_payloadOffset;
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)stride
{
  return self->_stride;
}

- (unint64_t)format
{
  return self->_format;
}

- (unint64_t)stepFunction
{
  return self->_stepFunction;
}

@end
