@implementation _XREngineeringTypeEncodingParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C7F8 != -1)
    dispatch_once(&qword_25583C7F8, &unk_24EDC41D0);
  return (id)qword_25583C7F0;
}

+ (id)_elementNameToKVCMap
{
  if (qword_25583C808 != -1)
    dispatch_once(&qword_25583C808, &unk_24EDC41F0);
  return (id)qword_25583C800;
}

- (void)_handleStart
{
  self->_bitWidth = -1;
}

- (void)_handleCompletion
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *sentinel;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t bitWidth;
  XRXMLElementParser *v26;

  v26 = self->super.parent;
  objc_msgSend_encodingConvention(v26, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_impl(v26, v8, v9, v10, v11);
  if (v12 <= 6)
  {
    if (((1 << v12) & 0x47) == 0)
    {
      v18 = 3;
      goto LABEL_12;
    }
    sentinel = self->_sentinel;
    if (sentinel)
    {
      if ((objc_msgSend_isEqualToString_(sentinel, v13, (uint64_t)CFSTR("max"), v15, v16) & 1) != 0)
      {
        v18 = 1;
      }
      else if (objc_msgSend_isEqualToString_(self->_sentinel, v13, (uint64_t)CFSTR("zero"), v15, v16))
      {
        v18 = 2;
      }
      else
      {
        v18 = 0;
      }
LABEL_12:
      if (v7)
      {
LABEL_17:
        objc_msgSend_setSentinel_(v7, v13, v18, v15, v16);
        goto LABEL_18;
      }
LABEL_16:
      v7 = (void *)objc_opt_new();
      objc_msgSend_setEncodingConvention_(v26, v22, (uint64_t)v7, v23, v24);
      if (!v7)
        goto LABEL_21;
      goto LABEL_17;
    }
  }
  if (!v7)
  {
    if (self->_bitWidth < 0)
      goto LABEL_21;
    v18 = 0;
    goto LABEL_16;
  }
  objc_msgSend_setSentinel_(v7, v13, 0, v15, v16);
LABEL_18:
  bitWidth = self->_bitWidth;
  if (bitWidth == -1)
    bitWidth = objc_msgSend_conventionalBitWidth(v26, v19, -1, v20, v21);
  objc_msgSend_setBitWidth_(v7, v19, bitWidth, v20, v21);

LABEL_21:
  objc_msgSend_didHandleEncodingElement(v26, v13, v14, v15, v16);

}

- (NSString)sentinel
{
  return self->_sentinel;
}

- (void)setSentinel:(id)a3
{
  objc_storeStrong((id *)&self->_sentinel, a3);
}

- (int64_t)bitWidth
{
  return self->_bitWidth;
}

- (void)setBitWidth:(int64_t)a3
{
  self->_bitWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sentinel, 0);
}

@end
