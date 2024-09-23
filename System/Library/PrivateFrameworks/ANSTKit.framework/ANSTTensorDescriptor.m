@implementation ANSTTensorDescriptor

- (unint64_t)lengthOfDimensionAt:(unint64_t)a3
{
  if (self->_numberOfDimensions <= a3)
    return 0;
  else
    return self->_lengths[a3];
}

- (unint64_t)strideOfDimensionAt:(unint64_t)a3
{
  if (self->_numberOfDimensions <= a3)
    return 0;
  else
    return self->_strides[a3];
}

- (unint64_t)sizeInBytes
{
  return *self->_lengths * *self->_strides;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  ANSTTensorDescriptor *result;

  v6 = a3;
  result = (ANSTTensorDescriptor *)objc_msgSend_doesNotRecognizeSelector_(self, v7, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 numberOfDimensions:(unint64_t)a5 lengths:(const unint64_t *)a6 strides:(const unint64_t *)a7 error:(id *)a8
{
  ANSTTensorDescriptor *v13;
  ANSTTensorDescriptor *v14;
  unint64_t *v15;
  const char *v16;
  unint64_t *v17;
  uint64_t v18;
  unint64_t *lengths;
  unint64_t v20;
  ANSTTensorDescriptor *v22;
  void *v23;
  void *v24;
  const char *v25;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)ANSTTensorDescriptor;
  v13 = -[ANSTDescriptor initWithName:error:](&v27, sel_initWithName_error_, a3, a8);
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v22 = v14;
    goto LABEL_17;
  }
  v13->_dataType = a4;
  v13->_numberOfDimensions = a5;
  v15 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
  v14->_lengths = v15;
  if (v15)
  {
    v17 = (unint64_t *)malloc_type_calloc(v14->_numberOfDimensions, 8uLL, 0x100004000313F17uLL);
    v14->_strides = v17;
    if (v17)
    {
      if (v14->_numberOfDimensions)
      {
        v18 = 0;
        lengths = v14->_lengths;
        while (1)
        {
          lengths[v18] = a6[v18];
          v20 = a7[v18];
          v17[v18] = v20;
          if (!lengths[v18] || v20 == 0)
            break;
          if (++v18 >= v14->_numberOfDimensions)
            goto LABEL_11;
        }
        if (a8)
        {
          v23 = (void *)MEMORY[0x24BDD1540];
          v28 = *MEMORY[0x24BDD0BA0];
          v29[0] = CFSTR("Tensor descriptor's length(s) and/or stride(s) should not be zero.");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v29, &v28, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, (uint64_t)CFSTR("ANSTErrorDomain"), 8, v24);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_16;
      }
      goto LABEL_11;
    }
  }
  if (!a8)
  {
LABEL_16:
    v22 = 0;
    goto LABEL_17;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v16, (uint64_t)CFSTR("ANSTErrorDomain"), 6, 0);
  v22 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v22;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 numberOfDimensions:(unint64_t)a5 lengths:(const unint64_t *)a6 alignment:(unint64_t)a7 error:(id *)a8
{
  id v14;
  char *v15;
  const char *v16;
  char *v17;
  uint64_t Size;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  ANSTTensorDescriptor *v25;

  v14 = a3;
  v15 = (char *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
  if (v15)
  {
    v17 = v15;
    if (a5)
    {
      Size = ANSTTensorDataTypeGetSize(a4);
      v19 = 0;
      v20 = 8 * a5 - 8;
      v21 = &v17[v20];
      v22 = (char *)a6 + v20;
      v23 = 1;
      do
      {
        Size *= v23;
        if (a7 >= 2 && v19 == -1)
          Size = (a7 - 1 + Size) / a7 * a7;
        v23 = *(_QWORD *)&v22[8 * v19];
        *(_QWORD *)&v21[8 * v19--] = Size;
      }
      while (-(uint64_t)a5 != v19);
    }
    v24 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_strides_error_(self, v16, (uint64_t)v14, a4, a5, a6, v17, a8);
    free(v17);
    self = v24;
    v25 = self;
  }
  else if (a8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v16, (uint64_t)CFSTR("ANSTErrorDomain"), 6, 0);
    v25 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (ANSTTensorDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 lengths:(id)a5 strides:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  size_t v17;
  void *v18;
  const char *v19;
  void *v20;
  _QWORD *v21;
  const char *v22;
  _QWORD *v23;
  uint64_t i;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  ANSTTensorDescriptor *v33;
  uint64_t v35;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v17 = objc_msgSend_count(v13, v15, v16);
  v18 = malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
  if (!v18)
  {
    if (!a7)
    {
LABEL_10:
      v33 = 0;
      goto LABEL_11;
    }
LABEL_8:
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v19, (uint64_t)CFSTR("ANSTErrorDomain"), 6, 0);
    v33 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v20 = v18;
  v21 = malloc_type_calloc(v17, 8uLL, 0x100004000313F17uLL);
  if (!v21)
  {
    free(v20);
    if (!a7)
      goto LABEL_10;
    goto LABEL_8;
  }
  v23 = v21;
  v35 = (uint64_t)v12;
  if (v17)
  {
    for (i = 0; i != v17; ++i)
    {
      objc_msgSend_objectAtIndex_(v13, v22, i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)v20 + i) = objc_msgSend_unsignedIntegerValue(v25, v26, v27);

      objc_msgSend_objectAtIndex_(v14, v28, i);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v23[i] = objc_msgSend_unsignedIntegerValue(v29, v30, v31);

    }
  }
  v12 = (id)v35;
  v32 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_strides_error_(self, v22, v35, a4, v17, v20, v23, a7);
  free(v20);
  free(v23);
  self = v32;
  v33 = self;
LABEL_11:

  return v33;
}

- (void)dealloc
{
  unint64_t *lengths;
  unint64_t *strides;
  objc_super v5;

  lengths = self->_lengths;
  if (lengths)
    free(lengths);
  strides = self->_strides;
  if (strides)
    free(strides);
  v5.receiver = self;
  v5.super_class = (Class)ANSTTensorDescriptor;
  -[ANSTTensorDescriptor dealloc](&v5, sel_dealloc);
}

- (unint64_t)_minimumContiguousLength
{
  uint64_t v2;
  unint64_t result;
  const char *v5;
  uint64_t v6;
  const char *v7;

  result = objc_msgSend_numberOfDimensions(self, a2, v2);
  if (result)
  {
    v6 = objc_msgSend_lengthOfDimensionAt_(self, v5, 0);
    return objc_msgSend_strideOfDimensionAt_(self, v7, 0) * v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ANSTTensorDescriptor *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  unint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  BOOL v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  objc_super v32;

  v4 = (ANSTTensorDescriptor *)a3;
  v32.receiver = self;
  v32.super_class = (Class)ANSTTensorDescriptor;
  if (!-[ANSTDescriptor isEqual:](&v32, sel_isEqual_, v4))
    goto LABEL_14;
  if (v4 == self)
    goto LABEL_16;
  if (!v4)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v7 = objc_msgSend_dataType(self, v5, v6);
  if (v7 != objc_msgSend_dataType(v4, v8, v9))
    goto LABEL_14;
  v12 = objc_msgSend_numberOfDimensions(self, v10, v11);
  if (v12 != objc_msgSend_numberOfDimensions(v4, v13, v14))
    goto LABEL_14;
  v17 = objc_msgSend_numberOfDimensions(self, v15, v16);
  if (!v17)
  {
LABEL_16:
    v23 = 1;
    goto LABEL_15;
  }
  v19 = v17;
  v20 = objc_msgSend_lengthOfDimensionAt_(self, v18, 0);
  if (v20 != objc_msgSend_lengthOfDimensionAt_(v4, v21, 0))
  {
LABEL_14:
    v23 = 0;
    goto LABEL_15;
  }
  v23 = 0;
  v24 = 1;
  do
  {
    v25 = objc_msgSend_strideOfDimensionAt_(self, v22, v24 - 1);
    if (v25 != objc_msgSend_strideOfDimensionAt_(v4, v26, v24 - 1))
      break;
    v23 = v24 >= v19;
    if (v19 == v24)
      break;
    v28 = objc_msgSend_lengthOfDimensionAt_(self, v27, v24);
    v30 = objc_msgSend_lengthOfDimensionAt_(v4, v29, v24++);
  }
  while (v28 == v30);
LABEL_15:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ANSTTensorDescriptor;
  v3 = -[ANSTDescriptor hash](&v19, sel_hash);
  v6 = objc_msgSend_dataType(self, v4, v5);
  v9 = v6 ^ objc_msgSend_numberOfDimensions(self, v7, v8) ^ v3;
  v12 = objc_msgSend_numberOfDimensions(self, v10, v11);
  if (v12)
  {
    v14 = v12;
    for (i = 0; i != v14; ++i)
    {
      v16 = objc_msgSend_lengthOfDimensionAt_(self, v13, i);
      v9 ^= v16 ^ objc_msgSend_strideOfDimensionAt_(self, v17, i);
    }
  }
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
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_name(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_dataType(self, v6, v7);
  ANSTTensorDataTypeToNSString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lengths(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v12, v13, (uint64_t)CFSTR("×"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v15, (uint64_t)CFSTR("%@ (%@, %@)"), v5, v9, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_dataType(self, v9, v10);
  ANSTTensorDataTypeToNSString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lengths(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v15, v16, (uint64_t)CFSTR("×"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strides(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v20, v21, (uint64_t)CFSTR("×"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v23, (uint64_t)CFSTR("<%@ %p> %@ (%@, %@, %@)"), v5, self, v8, v12, v17, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
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
  void *v12;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  objc_msgSend_name(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithName_dataType_numberOfDimensions_lengths_strides_error_(v7, v11, (uint64_t)v10, self->_dataType, self->_numberOfDimensions, self->_lengths, self->_strides, 0);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ANSTTensorDescriptor;
  -[ANSTDescriptor encodeWithCoder:](&v42, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend_dataType(self, v6, v7);
  objc_msgSend_numberWithUnsignedInteger_(v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_dataType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v10, v11);

  v13 = (void *)MEMORY[0x24BDD16E0];
  v16 = objc_msgSend_numberOfDimensions(self, v14, v15);
  objc_msgSend_numberWithUnsignedInteger_(v13, v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_numberOfDimensions);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v18, v19);

  v23 = objc_msgSend_numberOfDimensions(self, v21, v22);
  if (v23)
  {
    v25 = v23;
    for (i = 0; i != v25; ++i)
    {
      v27 = (void *)MEMORY[0x24BDD16E0];
      v28 = objc_msgSend_lengthOfDimensionAt_(self, v24, i);
      objc_msgSend_numberWithUnsignedInteger_(v27, v29, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, (uint64_t)CFSTR("length@%zu"), i);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v4, v33, (uint64_t)v30, v32);

      v34 = (void *)MEMORY[0x24BDD16E0];
      v36 = objc_msgSend_strideOfDimensionAt_(self, v35, i);
      objc_msgSend_numberWithUnsignedInteger_(v34, v37, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v39, (uint64_t)CFSTR("stride@%zu"), i);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v38, v40);

    }
  }

}

- (ANSTTensorDescriptor)initWithCoder:(id)a3
{
  id v4;
  ANSTTensorDescriptor *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  size_t v18;
  const char *v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  ANSTTensorDescriptor *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  void *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  void *v69;
  const char *v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  void *v80;
  void *v81;
  objc_super v82;
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[4];

  v92[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v82.receiver = self;
  v82.super_class = (Class)ANSTTensorDescriptor;
  v5 = -[ANSTDescriptor initWithCoder:](&v82, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_13;
  v6 = objc_opt_class();
  NSStringFromSelector(sel_dataType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v41 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0B88];
    v91[0] = *MEMORY[0x24BDD0BA0];
    v91[1] = CFSTR("ANSTDescriptorName");
    v92[0] = CFSTR("Tensor descriptor data type was not encoded.");
    objc_msgSend_name(v5, v10, v11);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v43;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v44, (uint64_t)v92, v91, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v46, v42, 4865, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v48, (uint64_t)v47);

LABEL_20:
    v40 = 0;
    goto LABEL_21;
  }
  v5->_dataType = objc_msgSend_unsignedIntegerValue(v9, v10, v11);
  v12 = objc_opt_class();
  NSStringFromSelector(sel_numberOfDimensions);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v49 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0B88];
    v51 = *MEMORY[0x24BDD0BA0];
    v90[0] = CFSTR("Tensor descriptor number of dimensions was not encoded.");
    v89[0] = v51;
    v89[1] = CFSTR("ANSTDescriptorName");
    objc_msgSend_name(v5, v16, v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v52, (uint64_t)v90, v89, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v49, v54, v50, 4865, v53);
LABEL_17:
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v60, (uint64_t)v59);
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  v5->_numberOfDimensions = v18;
  if (!v18)
  {
    v55 = (void *)MEMORY[0x24BDD1540];
    v56 = *MEMORY[0x24BDD0B88];
    v87[0] = *MEMORY[0x24BDD0BA0];
    v87[1] = CFSTR("ANSTDescriptorName");
    v88[0] = CFSTR("Invalid tensor descriptor number of dimensions was encoded.");
    objc_msgSend_name(v5, v19, v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)v88, v87, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v55, v58, v56, 4864, v53);
    goto LABEL_17;
  }
  v21 = (unint64_t *)malloc_type_calloc(v18, 8uLL, 0x100004000313F17uLL);
  v5->_lengths = v21;
  if (!v21)
    goto LABEL_19;
  v22 = (unint64_t *)malloc_type_calloc(v5->_numberOfDimensions, 8uLL, 0x100004000313F17uLL);
  v5->_strides = v22;
  if (!v22)
    goto LABEL_19;
  v80 = v15;
  v81 = v9;
  if (v5->_numberOfDimensions)
  {
    v23 = 0;
    v24 = 0x24BDD1000uLL;
    while (1)
    {
      v25 = objc_opt_class();
      objc_msgSend_stringWithFormat_(*(void **)(v24 + 1992), v26, (uint64_t)CFSTR("length@%zu"), v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v25, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v62 = (void *)MEMORY[0x24BDD1540];
        v63 = v24;
        v64 = *MEMORY[0x24BDD0B88];
        v85[0] = *MEMORY[0x24BDD0BA0];
        objc_msgSend_stringWithFormat_(*(void **)(v63 + 1992), v30, (uint64_t)CFSTR("Tensor descriptor length at dimension index #%zu was not encoded."), v23);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v85[1] = CFSTR("ANSTDescriptorName");
        v86[0] = v29;
        objc_msgSend_name(v5, v65, v66);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v86[1] = v53;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v67, (uint64_t)v86, v85, 2);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v62, v68, v64, 4865, v59);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_failWithError_(v4, v70, (uint64_t)v69);

        goto LABEL_24;
      }
      v5->_lengths[v23] = objc_msgSend_unsignedIntegerValue(v29, v30, v31);
      v32 = objc_opt_class();
      v33 = v24;
      objc_msgSend_stringWithFormat_(*(void **)(v24 + 1992), v34, (uint64_t)CFSTR("stride@%zu"), v23);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v32, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
        break;
      v5->_strides[v23] = objc_msgSend_unsignedIntegerValue(v37, v38, v39);

      ++v23;
      v24 = v33;
      if (v23 >= v5->_numberOfDimensions)
        goto LABEL_12;
    }
    v71 = (void *)MEMORY[0x24BDD1540];
    v72 = *MEMORY[0x24BDD0B88];
    v83[0] = *MEMORY[0x24BDD0BA0];
    objc_msgSend_stringWithFormat_(*(void **)(v33 + 1992), v38, (uint64_t)CFSTR("Tensor descriptor stride at dimension index #%zu was not encoded."), v23);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = CFSTR("ANSTDescriptorName");
    v84[0] = v53;
    objc_msgSend_name(v5, v73, v74);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v84[1] = v59;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v75, (uint64_t)v84, v83, 2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v71, v77, v72, 4865, v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_failWithError_(v4, v79, (uint64_t)v78);

LABEL_24:
    v15 = v80;
    v9 = v81;
    goto LABEL_18;
  }
LABEL_12:

LABEL_13:
  v40 = v5;
LABEL_21:

  return v40;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)numberOfDimensions
{
  return self->_numberOfDimensions;
}

- (NSArray)lengths
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend_numberOfDimensions(self, v4, v5);
  v8 = (void *)objc_msgSend_initWithCapacity_(v3, v7, v6);
  v11 = objc_msgSend_numberOfDimensions(self, v9, v10);
  if (v11)
  {
    v14 = v11;
    for (i = 0; i != v14; ++i)
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = objc_msgSend_lengthOfDimensionAt_(self, v12, i);
      objc_msgSend_numberWithUnsignedInteger_(v16, v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v8, v20, (uint64_t)v19);

    }
  }
  v21 = (void *)objc_msgSend_copy(v8, v12, v13);

  return (NSArray *)v21;
}

- (NSArray)strides
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = objc_msgSend_numberOfDimensions(self, v4, v5);
  v8 = (void *)objc_msgSend_initWithCapacity_(v3, v7, v6);
  v11 = objc_msgSend_numberOfDimensions(self, v9, v10);
  if (v11)
  {
    v14 = v11;
    for (i = 0; i != v14; ++i)
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      v17 = objc_msgSend_strideOfDimensionAt_(self, v12, i);
      objc_msgSend_numberWithUnsignedInteger_(v16, v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v8, v20, (uint64_t)v19);

    }
  }
  v21 = (void *)objc_msgSend_copy(v8, v12, v13);

  return (NSArray *)v21;
}

@end
