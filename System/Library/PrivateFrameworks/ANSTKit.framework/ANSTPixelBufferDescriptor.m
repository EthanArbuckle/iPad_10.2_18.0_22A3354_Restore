@implementation ANSTPixelBufferDescriptor

- (ANSTPixelBufferDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  ANSTPixelBufferDescriptor *result;

  v6 = a3;
  result = (ANSTPixelBufferDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v7, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTPixelBufferDescriptor)initWithName:(id)a3 pixelBufferAttributes:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  ANSTPixelBufferDescriptor *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSDictionary *pixelBufferAttributes;
  void *v21;
  void *v22;
  const char *v23;
  objc_super v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ANSTPixelBufferDescriptor;
  v10 = -[ANSTDescriptor initWithName:error:](&v25, sel_initWithName_error_, a3, a5);
  if (!v10)
    goto LABEL_6;
  objc_msgSend_objectForKey_(v8, v9, *MEMORY[0x24BDC5708]);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v13 = (void *)v11;
    objc_msgSend_objectForKey_(v8, v12, *MEMORY[0x24BDC5650]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v16 = (void *)v14;
      objc_msgSend_objectForKey_(v8, v15, *MEMORY[0x24BDC56B8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v19 = objc_msgSend_copy(v8, v12, v18);
        pixelBufferAttributes = v10->_pixelBufferAttributes;
        v10->_pixelBufferAttributes = (NSDictionary *)v19;

LABEL_6:
        a5 = v10;
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0BA0];
    v27[0] = CFSTR("Pixel buffer attributes are missing mandatory keys, i.e. width, height, and pixel format type.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v27, &v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, (uint64_t)CFSTR("ANSTErrorDomain"), 9, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_10:

  return (ANSTPixelBufferDescriptor *)a5;
}

- (ANSTPixelBufferDescriptor)initWithName:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormatType:(unsigned int)a6 pixelBufferAttributes:(id)a7 error:(id *)a8
{
  uint64_t v9;
  id v14;
  objc_class *v15;
  id v16;
  id v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  ANSTPixelBufferDescriptor *v29;

  v9 = *(_QWORD *)&a6;
  v14 = a7;
  v15 = (objc_class *)MEMORY[0x24BDBCED8];
  v16 = a3;
  v17 = objc_alloc_init(v15);
  v19 = v17;
  if (v14)
    objc_msgSend_addEntriesFromDictionary_(v17, v18, (uint64_t)v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v18, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v19, v21, (uint64_t)v20, *MEMORY[0x24BDC5708]);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v22, a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v19, v24, (uint64_t)v23, *MEMORY[0x24BDC5650]);

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v25, v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v19, v27, (uint64_t)v26, *MEMORY[0x24BDC56B8]);

  v29 = (ANSTPixelBufferDescriptor *)objc_msgSend_initWithName_pixelBufferAttributes_error_(self, v28, (uint64_t)v16, v19, a8);
  return v29;
}

- (BOOL)isEqual:(id)a3
{
  ANSTPixelBufferDescriptor *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char isEqualToDictionary;
  objc_super v14;

  v4 = (ANSTPixelBufferDescriptor *)a3;
  v14.receiver = self;
  v14.super_class = (Class)ANSTPixelBufferDescriptor;
  if (!-[ANSTDescriptor isEqual:](&v14, sel_isEqual_, v4))
    goto LABEL_6;
  if (v4 == self)
  {
    isEqualToDictionary = 1;
    goto LABEL_8;
  }
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_pixelBufferAttributes(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pixelBufferAttributes(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v7, v11, (uint64_t)v10);

  }
  else
  {
LABEL_6:
    isEqualToDictionary = 0;
  }
LABEL_8:

  return isEqualToDictionary;
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ANSTPixelBufferDescriptor;
  v3 = -[ANSTDescriptor hash](&v11, sel_hash);
  objc_msgSend_pixelBufferAttributes(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v6, v7, v8) ^ v3;

  return v9;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  char v23;
  const char *v24;
  void *v25;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_width(self, v6, v7);
  v11 = objc_msgSend_height(self, v9, v10);
  v14 = ((int)objc_msgSend_pixelFormatType(self, v12, v13) >> 24);
  v17 = ((int)(objc_msgSend_pixelFormatType(self, v15, v16) << 8) >> 24);
  v20 = ((__int16)objc_msgSend_pixelFormatType(self, v18, v19) >> 8);
  v23 = objc_msgSend_pixelFormatType(self, v21, v22);
  objc_msgSend_stringWithFormat_(v4, v24, (uint64_t)CFSTR("%@ (%zu×%zu, %c%c%c%c)"), v5, v8, v11, v14, v17, v20, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pixelBufferAttributes(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_debugDescription(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@ %p> %@ pixelBufferAttributes %@"), v5, self, v8, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_name(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pixelBufferAttributes(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initWithName_pixelBufferAttributes_error_(v7, v14, (uint64_t)v10, v13, 0);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  id v24;
  objc_super v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v25.receiver = self;
  v25.super_class = (Class)ANSTPixelBufferDescriptor;
  v4 = a3;
  -[ANSTDescriptor encodeWithCoder:](&v25, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x24BDD1770];
  objc_msgSend_pixelBufferAttributes(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(v5, v9, (uint64_t)v8, 200, 0, &v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v24;

  if (v10)
  {
    NSStringFromSelector(sel_pixelBufferAttributes);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v10, v14);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD1398];
    v26[0] = *MEMORY[0x24BDD0BA0];
    v26[1] = v17;
    v18 = *MEMORY[0x24BDD0B88];
    v27[0] = CFSTR("Pixel buffer attributes cannot be encoded.");
    v27[1] = v11;
    v26[2] = CFSTR("ANSTDescriptorName");
    objc_msgSend_name(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)v27, v26, 3);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v21, v18, 4866, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v23, (uint64_t)v22);

    v4 = (id)v20;
  }

}

- (ANSTPixelBufferDescriptor)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  ANSTPixelBufferDescriptor *v7;
  void *v8;
  ANSTPixelBufferDescriptor *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSDictionary *pixelBufferAttributes;
  const char *v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  id v39;
  objc_super v40;
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ANSTPixelBufferDescriptor;
  v7 = -[ANSTDescriptor initWithCoder:](&v40, sel_initWithCoder_, v4);
  if (!v7)
    goto LABEL_7;
  objc_msgSend_error(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = objc_opt_class();
    NSStringFromSelector(sel_pixelBufferAttributes);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0B88];
      v43[0] = *MEMORY[0x24BDD0BA0];
      v43[1] = CFSTR("ANSTDescriptorName");
      v44[0] = CFSTR("Pixel buffer descriptor pixel buffer attributes were not encoded.");
      objc_msgSend_name(v7, v14, v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v24;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)v44, v43, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v22, v27, v23, 4865, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v29, (uint64_t)v28);

      goto LABEL_3;
    }
    v39 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v14, (uint64_t)v13, 0, 0, &v39);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v39;
    pixelBufferAttributes = v7->_pixelBufferAttributes;
    v7->_pixelBufferAttributes = (NSDictionary *)v16;

    if (!v7->_pixelBufferAttributes)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD1398];
      v41[0] = *MEMORY[0x24BDD0BA0];
      v41[1] = v31;
      v32 = *MEMORY[0x24BDD0B88];
      v42[0] = CFSTR("Pixel buffer attributes cannot be decoded.");
      v42[1] = v17;
      v41[2] = CFSTR("ANSTDescriptorName");
      objc_msgSend_name(v7, v19, v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v33;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)v42, v41, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v30, v36, v32, 4864, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v38, (uint64_t)v37);

      goto LABEL_3;
    }

LABEL_7:
    v9 = v7;
    goto LABEL_8;
  }
LABEL_3:
  v9 = 0;
LABEL_8:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)pixelBufferAttributes
{
  return self->_pixelBufferAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferAttributes, 0);
}

- (unint64_t)width
{
  uint64_t v2;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;

  objc_msgSend_pixelBufferAttributes(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x24BDC5708]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

    return v10;
  }
  else
  {
    result = objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
    __break(1u);
  }
  return result;
}

- (unint64_t)height
{
  uint64_t v2;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;

  objc_msgSend_pixelBufferAttributes(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x24BDC5650]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

    return v10;
  }
  else
  {
    result = objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
    __break(1u);
  }
  return result;
}

- (unsigned)pixelFormatType
{
  uint64_t v2;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int result;

  objc_msgSend_pixelBufferAttributes(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x24BDC56B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend_unsignedIntegerValue(v7, v8, v9);

    return v10;
  }
  else
  {
    result = objc_msgSend_doesNotRecognizeSelector_(self, v8, (uint64_t)a2);
    __break(1u);
  }
  return result;
}

@end
