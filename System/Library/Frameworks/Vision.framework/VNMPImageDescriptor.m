@implementation VNMPImageDescriptor

- (VNMPImageDescriptor)initWithImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  VNMPImageDescriptor *v10;
  VNMPImageDescriptor *v11;
  unsigned int v12;
  int64_t v13;
  uint64_t v14;
  NSString *externalImageId;
  uint64_t v16;
  NSString *imageFilePath;
  __int128 v18;
  const __CFString *v24;
  id v25;
  VNMPImageDescriptor *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v28.receiver = self;
  v28.super_class = (Class)VNMPImageDescriptor;
  v10 = -[VNMPImageDescriptor init](&v28, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_10;
  do
  v10->_internalNonSerializedDescriptorId = v13;
  objc_msgSend(v8, "externalImageId");
  v14 = objc_claimAutoreleasedReturnValue();
  externalImageId = v11->_externalImageId;
  v11->_externalImageId = (NSString *)v14;

  objc_msgSend(v8, "imageFilePath");
  v16 = objc_claimAutoreleasedReturnValue();
  imageFilePath = v11->_imageFilePath;
  v11->_imageFilePath = (NSString *)v16;

  *(_QWORD *)&v18 = -1;
  *((_QWORD *)&v18 + 1) = -1;
  *(_OWORD *)&v11->_previousLeafId = v18;
  *(_OWORD *)&v11->_nextLeafTimestampDistance = v18;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&v11->_nextLeafDescriptorDistance = _Q0;
  v11->_colorGaborDescriptor = 0;
  v11->_sceneClassifierDescriptor = 0;
  -[VNMPImageDescriptor computeDescriptorForImageData:context:error:](v11, "computeDescriptorForImageData:context:error:", v8, v9, a5);
  if (!*a5)
  {
    -[VNMPImageDescriptor computeConvnetDescriptorForImageData:context:error:](v11, "computeConvnetDescriptorForImageData:context:error:", v8, v9, a5);
    if (*a5)
    {
      v24 = CFSTR("ERROR: Could not compute the convnet-based image descriptor");
      goto LABEL_9;
    }
    -[VNMPImageDescriptor computeRegistrationFeaturesForImageData:context:error:](v11, "computeRegistrationFeaturesForImageData:context:error:", v8, v9, a5);
    if (*a5)
    {
      v24 = CFSTR("ERROR: Could not compute image registration features");
      goto LABEL_9;
    }
LABEL_10:
    v26 = v11;
    goto LABEL_11;
  }
  v24 = CFSTR("ERROR: Could not compute the image descriptor");
LABEL_9:
  v25 = +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, v24);
  v26 = 0;
LABEL_11:

  return v26;
}

- (VNMPImageDescriptor)initWithImageData:(id)a3 andCustomQualityScore:(float)a4 context:(id)a5 error:(id *)a6
{
  VNMPImageDescriptor *result;

  result = -[VNMPImageDescriptor initWithImageData:context:error:](self, "initWithImageData:context:error:", a3, a5, a6);
  if (result)
    result->_quality = a4;
  return result;
}

- (VNMPImageDescriptor)initWithCoder:(id)a3
{
  id v4;
  VNMPImageDescriptor *v5;
  VNMPImageDescriptor *v6;
  __int128 v7;
  unsigned int v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  NSString *externalImageId;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  int v23;
  void *v24;
  size_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  VNMPImageDescriptor *v36;
  id v37;
  const void *v38;
  void *v39;
  void *v40;
  vision::mod::ImageDescriptorBufferAbstract *v41;

  v4 = a3;
  v5 = -[VNMPImageDescriptor init](self, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_20;
  *(_QWORD *)&v7 = -1;
  *((_QWORD *)&v7 + 1) = -1;
  *(_OWORD *)&v5->_previousLeafId = v7;
  *(_OWORD *)&v5->_nextLeafTimestampDistance = v7;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&v5->_nextLeafDescriptorDistance = _Q0;
  do
  v5->_internalNonSerializedDescriptorId = v14;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = objc_claimAutoreleasedReturnValue();
  externalImageId = v6->_externalImageId;
  v6->_externalImageId = (NSString *)v16;

  v18 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("VNMPImageDescriptor_exifTimestamp"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_exifTimestamp = objc_msgSend(v19, "longValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("VNMPImageDescriptor_quality"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v6->_quality = v21;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shortValue");

  if (v23)
  {
    if (v23 != 1)
    {
      syslog(5, "Unknown decoded image descriptor type");
LABEL_20:
      v36 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_lengthInBytes"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "longValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_data"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 != objc_msgSend(v26, "length"))
    {
      syslog(5, "Size mismatch for decoded image descriptor");
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "unsignedLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_stride"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedLongValue");

    if (!is_mul_ok(v30, v28))
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("Integer overflow occured when unarchiving an object of type: %@ stride: %zu count: %zu"), v33, v30, v28);

      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v35);
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    if (v30 * v28 != v25)
    {
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data integrity check failed when unarchiving an object of type: %@"), objc_opt_class());
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v35);
      goto LABEL_17;
    }
    v37 = objc_retainAutorelease(v26);
    v38 = (const void *)objc_msgSend(v37, "bytes");
    v39 = malloc_type_malloc(v25, 0x6F810886uLL);
    v40 = v39;
    if (!v39)
    {
      +[VNError errorForMemoryAllocationFailureWithLocalizedDescription:](VNError, "errorForMemoryAllocationFailureWithLocalizedDescription:", CFSTR("unable to allocate descriptor data"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v34);
      goto LABEL_18;
    }
    memcpy(v39, v38, v25);
    v41 = (vision::mod::ImageDescriptorBufferAbstract *)operator new();
    vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract(v41, v40, v30, v28, 1);
    *(_QWORD *)v41 = &off_1E453ABB0;
    v6->_colorGaborDescriptor = v41;

  }
  else
  {
    v6->_colorGaborDescriptor = 0;
  }
  v36 = v6;
LABEL_21:

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  _QWORD *colorGaborDescriptor;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", self->_exifTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("VNMPImageDescriptor_exifTimestamp"));

  *(float *)&v5 = self->_quality;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "encodeObject:forKey:", v6, CFSTR("VNMPImageDescriptor_quality"));

  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (!colorGaborDescriptor)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_type"));
    goto LABEL_5;
  }
  if (std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v8, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_type"));

    v9 = (*(uint64_t (**)(_QWORD *))(*colorGaborDescriptor + 104))(colorGaborDescriptor);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v10, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_lengthInBytes"));

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", colorGaborDescriptor[7], v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v11, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_data"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", colorGaborDescriptor[9]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v12, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", colorGaborDescriptor[8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeObject:forKey:", v13, CFSTR("VNMPImageDescriptor_ColorGaborImageDescriptorBuffer_stride"));
LABEL_5:

  }
}

- (unint64_t)serializedLength
{
  void *colorGaborDescriptor;

  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor)
    return (*(uint64_t (**)(void *, SEL))(*(_QWORD *)colorGaborDescriptor + 104))(colorGaborDescriptor, a2)
         + 38;
  else
    return 10;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  const void **colorGaborDescriptor;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  _DWORD *v14;
  void *v15;
  void *v16;

  v8 = a3;
  colorGaborDescriptor = (const void **)self->_colorGaborDescriptor;
  if (!std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "internal error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3710, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  if (!v8)
  {
    if (a5)
    {
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, CFSTR("ERROR: state cannot be nil"));
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
  v11 = -[VNMPImageDescriptor serializedLength](self, "serializedLength");
  *(_QWORD *)(v10 + a4) = v11;
  if (!colorGaborDescriptor)
  {
    if (!a5)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPImageDescriptor cannot be serialized without being created"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  *(_DWORD *)(v10 + a4 + 8) = +[VNMPImageDescriptor currentVersion](VNMPImageDescriptor, "currentVersion");
  v12 = a4 + v10;
  *(_QWORD *)(v12 + 12) = self->_exifTimestamp;
  *(float *)(v12 + 20) = self->_quality;
  *(_WORD *)(v12 + 24) = 1;
  v13 = (*((uint64_t (**)(const void **))*colorGaborDescriptor + 13))(colorGaborDescriptor);
  *(_DWORD *)(v12 + 26) = v13;
  memcpy((void *)(v10 + a4 + 30), colorGaborDescriptor[7], v13);
  v14 = (_DWORD *)(v10 + a4 + 30 + v13);
  *v14 = colorGaborDescriptor[9];
  v14[1] = colorGaborDescriptor[8];
  if (v13 + 38 != v11)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a5 = v16;

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (VNMPImageDescriptor)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  __int128 v9;
  void *v15;
  NSString *v16;
  NSString *externalImageId;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  size_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  vision::mod::ImageDescriptorBufferAbstract *v33;
  VNMPImageDescriptor *v34;
  void *v35;
  void *v36;

  v8 = a3;
  if (!v8)
  {
    if (a5)
    {
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3709, CFSTR("state parameter cannot be nil"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v34 = 0;
      *a5 = v35;
      goto LABEL_15;
    }
LABEL_14:
    v34 = 0;
    goto LABEL_15;
  }
  *(_QWORD *)&v9 = -1;
  *((_QWORD *)&v9 + 1) = -1;
  *(_OWORD *)&self->_previousLeafId = v9;
  *(_OWORD *)&self->_nextLeafTimestampDistance = v9;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&self->_nextLeafDescriptorDistance = _Q0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  externalImageId = self->_externalImageId;
  self->_externalImageId = v16;

  v18 = objc_msgSend(objc_retainAutorelease(v8), "bytes");
  v19 = v18;
  v20 = *a4;
  v21 = *(_QWORD *)(v18 + *a4);
  v22 = *a4 + 12;
  *a4 = v22;
  v23 = *(_QWORD *)(v18 + v22);
  *a4 = v20 + 20;
  self->_exifTimestamp = v23;
  self->_quality = *(float *)(v18 + *a4);
  v24 = *a4;
  v25 = *a4 + 4;
  *a4 = v25;
  v26 = *(unsigned __int16 *)(v18 + v25);
  *a4 = v24 + 6;
  if (v26 != 1)
  {
    if (a5)
    {
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3700, CFSTR("Invalid state format"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  v27 = *(unsigned int *)(v18 + v24 + 6);
  *a4 = v24 + 10;
  v28 = malloc_type_malloc(v27, 0x9A4CDBC8uLL);
  v29 = v28;
  if (!v28)
  {
    syslog(5, "Constructing image descriptor failed");
    goto LABEL_14;
  }
  memcpy(v28, (const void *)(v19 + *a4), v27);
  v30 = *a4 + v27;
  *a4 = v30;
  v31 = *(unsigned int *)(v19 + v30);
  *a4 = v30 + 4;
  v32 = *(unsigned int *)(v19 + v30 + 4);
  *a4 = v30 + 8;
  v33 = (vision::mod::ImageDescriptorBufferAbstract *)operator new();
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract(v33, v29, v32, v31, 1);
  *(_QWORD *)v33 = &off_1E453ABB0;
  self->_colorGaborDescriptor = v33;
  if (*a4 - v20 != v21)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of deserialized state of the object of type %@"), objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3700, v36);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_14;
  }
  v34 = self;
LABEL_15:

  return v34;
}

- (void)dealloc
{
  void *colorGaborDescriptor;
  objc_super v4;

  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor)
    (*(void (**)(void *, SEL))(*(_QWORD *)colorGaborDescriptor + 8))(colorGaborDescriptor, a2);
  v4.receiver = self;
  v4.super_class = (Class)VNMPImageDescriptor;
  -[VNMPImageDescriptor dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  float v6;
  float v7;
  void *v8;
  uint64_t v9;
  uint64_t colorGaborDescriptor;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[VNMPImageDescriptor externalImageId](self, "externalImageId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[VNMPImageDescriptor exifTimestamp](self, "exifTimestamp");
  -[VNMPImageDescriptor quality](self, "quality");
  v7 = v6;
  -[VNMPImageDescriptor rawColorGaborDescriptor](self, "rawColorGaborDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  colorGaborDescriptor = (uint64_t)self->_colorGaborDescriptor;
  if (colorGaborDescriptor)
  {
    v11 = *(_QWORD *)(colorGaborDescriptor + 56);
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)colorGaborDescriptor + 104))(colorGaborDescriptor);
    colorGaborDescriptor = VNHashMemory(v11, v12);
  }
  v13 = LODWORD(v7);
  if (v7 == 0.0)
    v13 = 0;
  return colorGaborDescriptor ^ __ROR8__(v9 ^ __ROR8__(v13 ^ __ROR8__(v5 ^ __ROR8__(v4, 51), 51), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNMPImageDescriptor *v4;
  VNMPImageDescriptor *v5;
  int64_t v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  char v12;
  const void **colorGaborDescriptor;
  const void **v14;
  size_t v15;
  BOOL v16;

  v4 = (VNMPImageDescriptor *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNMPImageDescriptor exifTimestamp](self, "exifTimestamp");
      if (v6 != -[VNMPImageDescriptor exifTimestamp](v5, "exifTimestamp"))
        goto LABEL_9;
      -[VNMPImageDescriptor quality](self, "quality");
      v8 = v7;
      -[VNMPImageDescriptor quality](v5, "quality");
      if (v8 != v9)
        goto LABEL_9;
      -[VNMPImageDescriptor rawColorGaborDescriptor](self, "rawColorGaborDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNMPImageDescriptor rawColorGaborDescriptor](v5, "rawColorGaborDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = VisionCoreEqualOrNilObjects();

      if ((v12 & 1) == 0)
        goto LABEL_9;
      colorGaborDescriptor = (const void **)self->_colorGaborDescriptor;
      v14 = (const void **)v5->_colorGaborDescriptor;
      if (colorGaborDescriptor == v14
        || (v15 = (*((uint64_t (**)(const void **))*colorGaborDescriptor + 13))(colorGaborDescriptor),
            v15 == (*((uint64_t (**)(const void **))*v14 + 13))(v14))
        && !memcmp(colorGaborDescriptor[7], v14[7], v15))
      {
        v16 = 1;
      }
      else
      {
LABEL_9:
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (BOOL)computeConvnetDescriptorForImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)computeDescriptorForImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char *v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  void (**v23)(vision::mod::ColorGaborImageDescriptorProcessor *__hidden);

  v8 = a3;
  v9 = a4;
  if (!a5)
    __assert_rtn("-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]", "MPImageDescriptor.mm", 556, "error != nil");
  *a5 = 0;
  v10 = (char *)operator new();
  *((_QWORD *)v10 + 2) = 0;
  *((_QWORD *)v10 + 3) = 0;
  *((_QWORD *)v10 + 6) = 0;
  *((_QWORD *)v10 + 5) = 0;
  *((_QWORD *)v10 + 4) = v10 + 40;
  *(_OWORD *)(v10 + 56) = 0u;
  *(_OWORD *)(v10 + 72) = 0u;
  v10[88] = 0;
  *(_QWORD *)v10 = &off_1E453ABB0;
  *((_QWORD *)v10 + 1) = 0;
  self->_colorGaborDescriptor = v10;
  if ((int)objc_msgSend(v9, "timerMode") < 1)
  {
    v23 = &off_1E453AE70;
    v18 = vision::mod::ColorGaborImageDescriptorProcessor::computeDescriptorForImage((vision::mod::ColorGaborImageDescriptorProcessor *)&v23, (__CVBuffer *)objc_msgSend(v8, "imageCVPixelBuffer"), (vision::mod::ImageDescriptorBufferAbstract *)self->_colorGaborDescriptor);
    v19 = v18;
    if (v18 != 3712)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CVML_getStatusDescription(v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", v19, v20);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[VNMPUtils getHostTime](VNMPUtils, "getHostTime");
    v12 = v11;
    v23 = &off_1E453AE70;
    v13 = vision::mod::ColorGaborImageDescriptorProcessor::computeDescriptorForImage((vision::mod::ColorGaborImageDescriptorProcessor *)&v23, (__CVBuffer *)objc_msgSend(v8, "imageCVPixelBuffer"), (vision::mod::ImageDescriptorBufferAbstract *)self->_colorGaborDescriptor);
    v14 = v13;
    if (v13 != 3712)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CVML_getStatusDescription(v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", v14, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[VNMPUtils getHostTime](VNMPUtils, "getHostTime");
    v17 = (v16 - v12) * 1000.0;
    ++-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]::totalCount__;
    *(double *)&-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]::totalTime__ = v17
                                                                                                 + *(double *)&-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]::totalTime__;
    syslog(5, "%s, current computation took %3.3f ms", "Image color descriptor computation", v17);
    syslog(5, "%s, computation stats: %3.3f ms per computation (%d computations total)", "Image color descriptor computation", *(double *)&-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]::totalTime__/ (double)-[VNMPImageDescriptor computeDescriptorForImageData:context:error:]::totalCount__, -[VNMPImageDescriptor computeDescriptorForImageData:context:error:]::totalCount__);
  }
  v21 = *a5 == 0;

  return v21;
}

- (BOOL)computeRegistrationFeaturesForImageData:(id)a3 context:(id)a4 error:(id *)a5
{
  return 1;
}

- (float)distanceFromDescriptor:(id)a3
{
  id v4;
  double v5;
  double v6;
  float v7;
  float v8;

  v4 = a3;
  v5 = (*(double (**)(void *, uint64_t))(*(_QWORD *)self->_colorGaborDescriptor + 88))(self->_colorGaborDescriptor, objc_msgSend(v4, "colorGaborDescriptor"));
  LODWORD(v6) = -1.0;
  -[VNMPImageDescriptor computeFinalDescriptorBasedDistanceForColorDistance:andSceneClassifierDistance:](self, "computeFinalDescriptorBasedDistanceForColorDistance:andSceneClassifierDistance:", v5, v6);
  v8 = v7;

  return v8;
}

- (float)computeFinalDescriptorBasedDistanceForColorDistance:(float)result andSceneClassifierDistance:(float)a4
{
  if (a4 >= 0.0)
    return a4;
  return result;
}

- (NSData)rawColorGaborDescriptor
{
  _QWORD *colorGaborDescriptor;
  void *v3;

  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor
    && std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", colorGaborDescriptor[7], (*(uint64_t (**)(_QWORD *))(*colorGaborDescriptor + 104))(colorGaborDescriptor), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSData *)v3;
}

- (VNMPImageDescriptor)initWithRawColorGaborDescriptor:(id)a3
{
  id v4;
  VNMPImageDescriptor *v5;
  VNMPImageDescriptor *v6;
  unsigned int v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  NSString *externalImageId;
  NSString *imageFilePath;
  __int128 v13;
  uint64_t v19;
  void *v20;
  vision::mod::ImageDescriptorBufferAbstract *v21;
  VNMPImageDescriptor *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VNMPImageDescriptor;
  v5 = -[VNMPImageDescriptor init](&v24, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  do
  v5->_internalNonSerializedDescriptorId = v8;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = objc_claimAutoreleasedReturnValue();
  externalImageId = v6->_externalImageId;
  v6->_externalImageId = (NSString *)v10;

  imageFilePath = v6->_imageFilePath;
  v6->_imageFilePath = 0;

  v6->_colorGaborDescriptor = 0;
  *(_QWORD *)&v13 = -1;
  *((_QWORD *)&v13 + 1) = -1;
  *(_OWORD *)&v6->_nextLeafTimestampDistance = v13;
  *(_OWORD *)&v6->_previousLeafId = v13;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&v6->_nextLeafDescriptorDistance = _Q0;
  v6->_sceneClassifierDescriptor = 0;
  v19 = objc_msgSend(v4, "length");
  v20 = malloc_type_malloc(v19, 0x1AB69656uLL);
  memcpy(v20, (const void *)objc_msgSend(objc_retainAutorelease(v4), "bytes"), v19);
  if (!v20)
  {
    syslog(5, "Constructing image descriptor failed");
    goto LABEL_7;
  }
  v21 = (vision::mod::ImageDescriptorBufferAbstract *)operator new();
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract(v21, v20, v19, 1, 1);
  *(_QWORD *)v21 = &off_1E453ABB0;
  v6->_colorGaborDescriptor = v21;
  if (v19 != vision::mod::ColorGaborImageDescriptorBuffer::getDescriptorLengthInBytes(v21))
  {
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  v22 = v6;
LABEL_8:

  return v22;
}

- (int64_t)descriptorId
{
  return self->_internalNonSerializedDescriptorId;
}

- (NSString)externalImageId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)exifTimestamp
{
  return self->_exifTimestamp;
}

- (float)quality
{
  return self->_quality;
}

- (void)colorGaborDescriptor
{
  return self->_colorGaborDescriptor;
}

- (void)sceneClassifierDescriptor
{
  return self->_sceneClassifierDescriptor;
}

- (void)imageRegistrationDescriptor
{
  return self->_imageRegistrationDescriptor;
}

- (int64_t)previousLeafId
{
  return self->_previousLeafId;
}

- (void)setPreviousLeafId:(int64_t)a3
{
  self->_previousLeafId = a3;
}

- (int64_t)nextLeafId
{
  return self->_nextLeafId;
}

- (void)setNextLeafId:(int64_t)a3
{
  self->_nextLeafId = a3;
}

- (float)nextLeafDescriptorDistance
{
  return self->_nextLeafDescriptorDistance;
}

- (void)setNextLeafDescriptorDistance:(float)a3
{
  self->_nextLeafDescriptorDistance = a3;
}

- (float)previousLeafDescriptorDistance
{
  return self->_previousLeafDescriptorDistance;
}

- (void)setPreviousLeafDescriptorDistance:(float)a3
{
  self->_previousLeafDescriptorDistance = a3;
}

- (int64_t)nextLeafTimestampDistance
{
  return self->_nextLeafTimestampDistance;
}

- (void)setNextLeafTimestampDistance:(int64_t)a3
{
  self->_nextLeafTimestampDistance = a3;
}

- (int64_t)previousLeafTimestampDistance
{
  return self->_previousLeafTimestampDistance;
}

- (void)setPreviousLeafTimestampDistance:(int64_t)a3
{
  self->_previousLeafTimestampDistance = a3;
}

- (float)nextLeafTotalDistance
{
  return self->_nextLeafTotalDistance;
}

- (void)setNextLeafTotalDistance:(float)a3
{
  self->_nextLeafTotalDistance = a3;
}

- (float)previousLeafTotalDistance
{
  return self->_previousLeafTotalDistance;
}

- (void)setPreviousLeafTotalDistance:(float)a3
{
  self->_previousLeafTotalDistance = a3;
}

- (NSString)imageFilePath
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilePath, 0);
  objc_storeStrong((id *)&self->_externalImageId, 0);
}

+ (unint64_t)currentVersion
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
