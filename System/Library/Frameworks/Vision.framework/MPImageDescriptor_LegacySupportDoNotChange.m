@implementation MPImageDescriptor_LegacySupportDoNotChange

- (MPImageDescriptor_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4;
  MPImageDescriptor_LegacySupportDoNotChange *v5;
  MPImageDescriptor_LegacySupportDoNotChange *v6;
  NSString *imageFilePath;
  __int128 v8;
  uint64_t v14;
  NSString *externalImageId;
  uint64_t v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  int v21;
  void *v22;
  size_t v23;
  void *v24;
  id v25;
  const void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  vision::mod::ImageDescriptorBufferAbstract *v33;
  MPImageDescriptor_LegacySupportDoNotChange *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MPImageDescriptor_LegacySupportDoNotChange;
  v5 = -[MPImageDescriptor_LegacySupportDoNotChange init](&v38, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_15;
  v5->_descriptorId = ++internalId;
  imageFilePath = v5->_imageFilePath;
  v5->_imageFilePath = 0;

  *(_QWORD *)&v8 = -1;
  *((_QWORD *)&v8 + 1) = -1;
  *(_OWORD *)&v6->_previousLeafId = v8;
  *(_OWORD *)&v6->_nextLeafTimestampDistance = v8;
  __asm { FMOV            V0.4S, #-1.0 }
  *(_OWORD *)&v6->_nextLeafDescriptorDistance = _Q0;
  v6->_sceneClassifierDescriptor = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPImageDescriptor_externalImageId"));
  v14 = objc_claimAutoreleasedReturnValue();
  externalImageId = v6->_externalImageId;
  v6->_externalImageId = (NSString *)v14;

  v16 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("MPImageDescriptor_exifTimestamp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6->_exifTimestamp = objc_msgSend(v17, "longValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("MPImageDescriptor_quality"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v6->_quality = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("MPImageDescriptor_ColorGaborImageDescriptorBuffer_type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shortValue");

  if (!v21)
    goto LABEL_15;
  if (v21 != 1)
  {
    syslog(5, "Unknown decoded image descriptor type");
    goto LABEL_15;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("MPImageDescriptor_ColorGaborImageDescriptorBuffer_lengthInBytes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "longValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPImageDescriptor_ColorGaborImageDescriptorBuffer_data"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 != objc_msgSend(v24, "length"))
  {
    syslog(5, "Size mismatch for decoded image descriptor");
LABEL_14:

LABEL_15:
    v34 = 0;
    goto LABEL_16;
  }
  v25 = objc_retainAutorelease(v24);
  v26 = (const void *)objc_msgSend(v25, "bytes");
  v27 = malloc_type_malloc(v23, 0x2F410A4BuLL);
  v28 = v27;
  if (!v27)
  {
    syslog(5, "Constructing image descriptor failed");
    goto LABEL_14;
  }
  memcpy(v27, v26, v23);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("MPImageDescriptor_ColorGaborImageDescriptorBuffer_count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "longValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, CFSTR("MPImageDescriptor_ColorGaborImageDescriptorBuffer_stride"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "longValue");

  if (v32 * v30 != v23)
  {
    free(v28);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data integrity check failed when unarchiving an object of type: %@"), objc_opt_class());
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v36);

    goto LABEL_14;
  }
  v33 = (vision::mod::ImageDescriptorBufferAbstract *)operator new();
  vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract(v33, v28, v32, v30, 1);
  *(_QWORD *)v33 = &off_1E453ABB0;
  v6->_colorGaborDescriptor = v33;

  if (!v6->_colorGaborDescriptor)
  {
    syslog(5, "Error instantiating internal image descriptor");
    goto LABEL_15;
  }
  v34 = v6;
LABEL_16:

  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Exporting of legacy MPImageDescriptor_LegacySupportDoNotChange is disabled.  Please convert to VNImageprintObservation and export"));
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
  void *v12;
  unint64_t v13;
  unsigned int v14;
  _DWORD *v15;
  void *v16;
  void *v17;

  v8 = a3;
  colorGaborDescriptor = (const void **)self->_colorGaborDescriptor;
  if (std::type_info::operator==[abi:ne180100]((uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE", (uint64_t)"PN6vision3mod31ColorGaborImageDescriptorBufferE"))
  {
    if (v8)
    {
      v10 = objc_msgSend(objc_retainAutorelease(v8), "mutableBytes");
      v11 = -[MPImageDescriptor_LegacySupportDoNotChange serializedLength](self, "serializedLength");
      *(_QWORD *)(v10 + a4) = v11;
      if (colorGaborDescriptor)
      {
        *(_DWORD *)(a4 + v10 + 8) = 1;
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_externalImageId);
        if (v12)
        {
          *(_QWORD *)(v10 + a4 + 12) = self->_exifTimestamp;
          v13 = a4 + v10;
          *(float *)(v13 + 20) = self->_quality;
          *(_WORD *)(v13 + 24) = 1;
          v14 = (*((uint64_t (**)(const void **))*colorGaborDescriptor + 13))(colorGaborDescriptor);
          *(_DWORD *)(v13 + 26) = v14;
          memcpy((void *)(v10 + a4 + 30), colorGaborDescriptor[7], v14);
          v15 = (_DWORD *)(v10 + a4 + 30 + v14);
          *v15 = colorGaborDescriptor[9];
          v15[1] = colorGaborDescriptor[8];
          if (v14 + 38 != v11)
          {
            if (a5)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, v16);
              *a5 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_17;
          }
        }
        else
        {
          if (!a5)
          {
LABEL_17:
            v11 = 0;
            goto LABEL_18;
          }
          +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3710, CFSTR("ERROR: invalid image Id format"));
          v11 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_18:

        goto LABEL_19;
      }
      if (a5)
        goto LABEL_14;
    }
    else if (a5)
    {
LABEL_14:
      +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3196, CFSTR("ERROR: state cannot be nil"));
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "internal error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNMPUtils createErrorWithCode:andMessage:](VNMPUtils, "createErrorWithCode:andMessage:", 3710, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (void)dealloc
{
  void *colorGaborDescriptor;
  objc_super v4;

  colorGaborDescriptor = self->_colorGaborDescriptor;
  if (colorGaborDescriptor)
    (*(void (**)(void *, SEL))(*(_QWORD *)colorGaborDescriptor + 8))(colorGaborDescriptor, a2);
  v4.receiver = self;
  v4.super_class = (Class)MPImageDescriptor_LegacySupportDoNotChange;
  -[MPImageDescriptor_LegacySupportDoNotChange dealloc](&v4, sel_dealloc);
}

- (int64_t)descriptorId
{
  return self->_descriptorId;
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

- (NSData)rawColorGaborDescriptor
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)imageFilePath
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilePath, 0);
  objc_storeStrong((id *)&self->_rawColorGaborDescriptor, 0);
  objc_storeStrong((id *)&self->_externalImageId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
