@implementation VNCVMLImageprintObservation_LegacySupportDoNotChange

- (VNCVMLImageprintObservation_LegacySupportDoNotChange)init
{
  VNCVMLImageprintObservation_LegacySupportDoNotChange *v2;
  VNCVMLImageprintObservation_LegacySupportDoNotChange *v3;
  NSUUID *identifier;
  MPImageDescriptor_LegacySupportDoNotChange *imageprintDescriptor;
  NSString *imageprintType;
  NSString *imageprintVersion;
  VNCVMLImageprintObservation_LegacySupportDoNotChange *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNCVMLImageprintObservation_LegacySupportDoNotChange;
  v2 = -[VNCVMLImageprintObservation_LegacySupportDoNotChange init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;

    imageprintDescriptor = v3->_imageprintDescriptor;
    v3->_imageprintDescriptor = 0;

    imageprintType = v3->_imageprintType;
    v3->_imageprintType = (NSString *)CFSTR("CVMLImageprintObservation_ImageprintTypeColorGabor");

    imageprintVersion = v3->_imageprintVersion;
    v3->_imageprintVersion = 0;

    v8 = v3;
  }

  return v3;
}

- (VNCVMLImageprintObservation_LegacySupportDoNotChange)initWithData:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VNCVMLImageprintObservation_LegacySupportDoNotChange;
  return -[VNCVMLObservation_LegacySupportDoNotChange initWithData:forKey:](&v4, sel_initWithData_forKey_, a3, CFSTR("CVMLImageprintObservation_ObjectCodingKey"));
}

- (VNCVMLImageprintObservation_LegacySupportDoNotChange)initWithCoder:(id)a3
{
  id v4;
  VNCVMLImageprintObservation_LegacySupportDoNotChange *v5;
  void *v6;
  VNCVMLImageprintObservation_LegacySupportDoNotChange *v7;
  uint64_t v8;
  MPImageDescriptor_LegacySupportDoNotChange *imageprintDescriptor;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  NSString *imageprintType;
  uint64_t v14;
  NSString *imageprintVersion;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNCVMLImageprintObservation_LegacySupportDoNotChange;
  v5 = -[VNCVMLObservation_LegacySupportDoNotChange initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLImageprintObservation_VersionCodingKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "unsignedIntegerValue"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLImageprintObservation_ImageprintDescriptorCodingKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageprintDescriptor = v5->_imageprintDescriptor;
    v5->_imageprintDescriptor = (MPImageDescriptor_LegacySupportDoNotChange *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLImageprintObservation_UUIDCodingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLImageprintObservation_ImageprintTypeCodingKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageprintType = v5->_imageprintType;
    v5->_imageprintType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CVMLImageprintObservation_ImageprintDescriptorColorGaborVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageprintVersion = v5->_imageprintVersion;
    v5->_imageprintVersion = (NSString *)v14;

LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }

  v7 = 0;
LABEL_6:

  return v7;
}

- (unint64_t)serializedLength
{
  return -[MPImageDescriptor_LegacySupportDoNotChange serializedLength](self->_imageprintDescriptor, "serializedLength")
       + 32;
}

- (unint64_t)serializeStateIntoData:(id)a3 startingAtByteOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  void *v17;
  _BYTE v19[28];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("state cannot be nil"));
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "mutableBytes");
  *(_QWORD *)&v19[12] = 0;
  *(_QWORD *)&v19[20] = 0;
  *(_DWORD *)v19 = -878245506;
  v12 = -[VNCVMLImageprintObservation_LegacySupportDoNotChange serializedLength](self, "serializedLength");
  *(_DWORD *)&v19[4] = 1;
  *(_DWORD *)&v19[8] = v12;
  v13 = -[MPImageDescriptor_LegacySupportDoNotChange serializeStateIntoData:startingAtByteOffset:error:](self->_imageprintDescriptor, "serializeStateIntoData:startingAtByteOffset:error:", v10, a4 + 28, a5);
  if (!v13)
    goto LABEL_9;
  *(_DWORD *)(v11 + v13 + a4 + 28) = 0;
  v14 = v13 + 32;
  if (v13 + 32 != v12)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  v15 = (_OWORD *)(v11 + a4);
  calculateChecksumMD5((char *)(v11 + a4 + 28), v13 + 4, &v19[12]);
  v16 = *(_OWORD *)v19;
  *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&v19[12];
  *v15 = v16;
LABEL_10:

  return v14;
}

- (id)serializeAsVNImageprintStateAndReturnError:(id *)a3
{
  void *v5;
  unint64_t v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[VNCVMLImageprintObservation_LegacySupportDoNotChange serializedLength](self, "serializedLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNCVMLImageprintObservation_LegacySupportDoNotChange serializeStateIntoData:startingAtByteOffset:error:](self, "serializeStateIntoData:startingAtByteOffset:error:", v5, 0, a3);
  if (v6 && v6 == -[VNCVMLImageprintObservation_LegacySupportDoNotChange serializedLength](self, "serializedLength"))
    v7 = v5;
  else
    v7 = 0;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Exporting of legacy VNCVMLImageprintObservation_LegacySupportDoNotChange is disabled.  Please convert to VNImageprintObservation and export"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageprintVersion, 0);
  objc_storeStrong((id *)&self->_imageprintType, 0);
  objc_storeStrong((id *)&self->_imageprintDescriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
