@implementation _XREngineeringTypeDef

+ (id)_elementNameToClassMap
{
  if (qword_25583C7C8 != -1)
    dispatch_once(&qword_25583C7C8, &unk_24EDC4170);
  return (id)qword_25583C7C0;
}

+ (id)_elementNameToKVCMap
{
  if (qword_25583C7D8 != -1)
    dispatch_once(&qword_25583C7D8, &unk_24EDC4190);
  return (id)qword_25583C7D0;
}

- (void)addAttribute:(unint64_t)a3
{
  self->_attributes |= a3;
}

- (void)didHandleEncodingElement
{
  self->_handledEncodingElement = 1;
}

- (void)_handleCompletion
{
  if (!self->_handledEncodingElement)
    ((void (*)(_XREngineeringTypeDef *, char *, const __CFString *))MEMORY[0x24BEDD108])(self, sel_simulateEmptyElement_, CFSTR("encoding-convention"));
}

- (id)errorStringHeader
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  if (qword_25583C7E0 != -1)
    dispatch_once(&qword_25583C7E0, &unk_24EDC41B0);
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_path((void *)qword_25583C7E8, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineAndColumnForElementStart(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("%@:%@: error:"), v14, v15, v7, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)conventionalBitWidth
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unsigned int v25;

  objc_msgSend_encodingConvention(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v11 = (void *)v6,
        objc_msgSend_encodingConvention(self, v7, v8, v9, v10),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend_bitWidth(v12, v13, v14, v15, v16),
        v12,
        v11,
        v17 == -1))
  {
    v25 = objc_msgSend_impl(self, v7, v8, v9, v10);
    if (v25 >= 7)
      return 22;
    else
      return qword_2263744D8[(char)v25];
  }
  else
  {
    objc_msgSend_encodingConvention(self, v7, v8, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_bitWidth(v18, v19, v20, v21, v22);

    return v23;
  }
}

- (NSString)mnemonic
{
  return self->_mnemonic;
}

- (void)setMnemonic:(id)a3
{
  objc_storeStrong((id *)&self->_mnemonic, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)enumString
{
  return self->_enumString;
}

- (void)setEnumString:(id)a3
{
  objc_storeStrong((id *)&self->_enumString, a3);
}

- (NSString)usage
{
  return self->_usage;
}

- (void)setUsage:(id)a3
{
  objc_storeStrong((id *)&self->_usage, a3);
}

- (unsigned)impl
{
  return self->_impl;
}

- (void)setImpl:(unsigned __int8)a3
{
  self->_impl = a3;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->_attributes = a3;
}

- (BOOL)experimental
{
  return self->_experimental;
}

- (void)setExperimental:(BOOL)a3
{
  self->_experimental = a3;
}

- (BOOL)deprecated
{
  return self->_deprecated;
}

- (void)setDeprecated:(BOOL)a3
{
  self->_deprecated = a3;
}

- (XREngineeringTypeEncodingConvention)encodingConvention
{
  return self->_encodingConvention;
}

- (void)setEncodingConvention:(id)a3
{
  objc_storeStrong((id *)&self->_encodingConvention, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodingConvention, 0);
  objc_storeStrong((id *)&self->_usage, 0);
  objc_storeStrong((id *)&self->_enumString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mnemonic, 0);
}

@end
