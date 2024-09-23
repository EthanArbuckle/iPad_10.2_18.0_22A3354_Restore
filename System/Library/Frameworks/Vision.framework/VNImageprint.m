@implementation VNImageprint

- (id)distanceToImageprint:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v13 = 0;
    v14 = (float *)&v13;
    v15 = 0x2020000000;
    v16 = 2139095040;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__VNImageprint_distanceToImageprint_error___block_invoke;
    v10[3] = &unk_1E4547408;
    v12 = &v13;
    v10[4] = self;
    v11 = v6;
    if ((VNExecuteBlock(v10, (uint64_t)a4) & 1) == 0)
      goto LABEL_6;
    if (v14[6] != INFINITY)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("could not compute faceprint distance"));
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_6:
      v8 = 0;
    }
LABEL_11:

    _Block_object_dispose(&v13, 8);
    goto LABEL_12;
  }
  if (a4)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("otherImageprint cannot be nil"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (VNImageprint)initWithImageDescriptor:(id)a3 type:(unint64_t)a4 originatingRequestSpecifier:(id)a5
{
  id v9;
  id v10;
  VNImageprint *v11;
  VNImageprint *v12;
  VNImageprint *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VNImageprint;
  v11 = -[VNImageprint init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_descriptor, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_originatingRequestSpecifier, a5);
    v13 = v12;
  }

  return v12;
}

- (VNImageprint)initWithCoder:(id)a3
{
  id v4;
  VNImageprint *v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  VNImageprint *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;

  v4 = a3;
  if (!objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNIp")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPImDesc"));
    v5 = (VNImageprint *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_3;
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("ipType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipOrgReq"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
        goto LABEL_7;
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("ipOrgReq")) & 1) == 0)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipReqRev"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v17;
        if (v17)
          v18 = objc_msgSend(v17, "unsignedIntegerValue");
        else
          v18 = 1;
        v21 = 0;
        +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), v18, &v21);
        v13 = objc_claimAutoreleasedReturnValue();
        v19 = v21;
        v20 = v19;
        if (!v13)
        {
          objc_msgSend(v4, "failWithError:", v19);

          v15 = 1;
          goto LABEL_8;
        }

LABEL_7:
        v14 = -[VNImageprint initWithImageDescriptor:type:originatingRequestSpecifier:](self, "initWithImageDescriptor:type:originatingRequestSpecifier:", v5, v12, v13);
        v15 = v14 == 0;
        v16 = (void *)v13;
        self = v14;
LABEL_8:

        goto LABEL_11;
      }
    }
    v15 = 1;
LABEL_11:

    if (!v15)
    {
      self = self;
      v5 = self;
      goto LABEL_3;
    }
  }
  v5 = 0;
LABEL_3:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNIp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptor, CFSTR("MPImDesc"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("ipType"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("ipOrgReq"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImageDescriptor:type:originatingRequestSpecifier:", self->_descriptor, self->_type, self->_originatingRequestSpecifier);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (VNImageprint)initWithState:(id)a3 byteOffset:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD *v13;
  id v15;
  VNImageprint *v16;
  VNMPImageDescriptor *v17;
  void *v18;
  VNCVMLImageprintObservation_LegacySupportDoNotChange *v19;
  void *v20;
  VNMPImageDescriptor *v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  id v25;
  int v26;
  uint64_t v27;
  id v28;
  void *v29;
  VNImageprint *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[28];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("state cannot be nil"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_16:
    v16 = 0;
    goto LABEL_57;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "bytes");
  v12 = *a4;
  v13 = (_OWORD *)(v11 + *a4);
  *(_OWORD *)v37 = *v13;
  *(_OWORD *)&v37[12] = *(_OWORD *)((char *)v13 + 12);
  *a4 = v12 + 28;
  if (*(_DWORD *)v37 != -878245506)
  {
    if (objc_msgSend(v10, "length") == 136)
    {
      v17 = -[VNMPImageDescriptor initWithRawColorGaborDescriptor:]([VNMPImageDescriptor alloc], "initWithRawColorGaborDescriptor:", v10);
      if (v17)
      {
        +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), 1, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          self = -[VNImageprint initWithImageDescriptor:type:originatingRequestSpecifier:](self, "initWithImageDescriptor:type:originatingRequestSpecifier:", v17, 0, v18);
          v16 = self;
        }
        else
        {
          v16 = 0;
        }

        goto LABEL_31;
      }
      if (a5)
        goto LABEL_27;
    }
    else
    {
      v19 = -[VNCVMLImageprintObservation_LegacySupportDoNotChange initWithData:]([VNCVMLImageprintObservation_LegacySupportDoNotChange alloc], "initWithData:", v10);
      v17 = (VNMPImageDescriptor *)v19;
      if (v19)
      {
        -[VNCVMLImageprintObservation_LegacySupportDoNotChange serializeAsVNImageprintStateAndReturnError:](v19, "serializeAsVNImageprintStateAndReturnError:", a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = 0;
        self = -[VNImageprint initWithState:byteOffset:error:](self, "initWithState:byteOffset:error:", v20, a4, a5);

        v16 = self;
LABEL_31:

        goto LABEL_57;
      }
      if (a5)
      {
LABEL_27:
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 2, CFSTR("Invalid format of VNImageprint serialized state"));
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
    }
    v16 = 0;
    goto LABEL_31;
  }
  v35 = 0;
  v36 = 0;
  calculateChecksumMD5((char *)(v11 + 28), objc_msgSend(v10, "length") - 28, (unsigned __int8 *)&v35);
  if (*(_QWORD *)&v37[12] == v35 && *(_QWORD *)&v37[20] == v36)
  {
    v21 = -[VNMPImageDescriptor initWithState:byteOffset:error:]([VNMPImageDescriptor alloc], "initWithState:byteOffset:error:", v10, a4, a5);
    if (!v21)
      goto LABEL_45;
    v22 = *a4;
    v23 = *(_DWORD *)(v11 + *a4);
    v24 = *a4 + 4;
    *a4 = v24;
    if (v23)
    {
      if (a5)
      {
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Failed to deserialize requestRevision"));
        v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v16 = 0;
        *a5 = v25;
LABEL_56:

        goto LABEL_57;
      }
      goto LABEL_45;
    }
    v26 = *(_DWORD *)&v37[4];
    if ((*(_DWORD *)&v37[4] - 2) >= 2)
    {
      if (*(_DWORD *)&v37[4] != 1)
      {
        if (a5)
        {
          +[VNError errorForUnsupportedSerializingHeaderVersion:](VNError, "errorForUnsupportedSerializingHeaderVersion:");
          v25 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
LABEL_45:
        v16 = 0;
        goto LABEL_56;
      }
      LODWORD(v27) = 1;
    }
    else
    {
      v27 = *(unsigned int *)(v11 + v24);
      *a4 = v22 + 8;
      if (v26 == 3)
      {
        v31 = *(unsigned int *)(v11 + v22 + 8);
        *a4 = v22 + 12;
        +[VNClassRegistrar classNameForClassCode:error:](VNClassRegistrar, "classNameForClassCode:error:", v31, a5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v32
          || (+[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v32, v27, a5), v29 = (void *)objc_claimAutoreleasedReturnValue(), v32, !v29))
        {
LABEL_48:
          v29 = 0;
          goto LABEL_51;
        }
LABEL_40:
        if (*a4 - v12 == *(unsigned int *)&v37[8])
        {
          v30 = -[VNImageprint initWithImageDescriptor:type:originatingRequestSpecifier:](self, "initWithImageDescriptor:type:originatingRequestSpecifier:", v21, 0, v29);
          if (v30)
          {
            self = v30;
            v16 = self;
LABEL_55:

            goto LABEL_56;
          }
          if (a5)
          {
            +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Failed to initialize VNImageprint object"));
            v28 = (id)objc_claimAutoreleasedReturnValue();
            self = 0;
            goto LABEL_54;
          }
          self = 0;
        }
        else if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of deserialized state of the object of type %@"), objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, v33);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_51:
        v16 = 0;
        goto LABEL_55;
      }
      if (v26 != 2)
      {
        if (a5)
        {
          +[VNError errorForUnsupportedSerializingHeaderVersion:](VNError, "errorForUnsupportedSerializingHeaderVersion:");
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v29 = 0;
LABEL_54:
          v16 = 0;
          *a5 = v28;
          goto LABEL_55;
        }
        goto LABEL_48;
      }
    }
    +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), v27, a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_51;
    goto LABEL_40;
  }
  if (!a5)
    goto LABEL_16;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, CFSTR("Serialized and calculated MD5s don't match"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = 0;
  *a5 = v15;
LABEL_57:

  return v16;
}

- (VNImageprint)initWithState:(id)a3 error:(id *)a4
{
  uint64_t v5;

  v5 = 0;
  return -[VNImageprint initWithState:byteOffset:error:](self, "initWithState:byteOffset:error:", a3, &v5, a4);
}

- (unint64_t)serializedLength
{
  return -[VNMPImageDescriptor serializedLength](self->_descriptor, "serializedLength") + 40;
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
  unint64_t v15;
  unint64_t v16;
  void *v17;
  BOOL v18;
  unint64_t v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  int v24;
  _BYTE v25[28];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("state cannot be nil"));
      v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v10, "mutableBytes");
  *(_QWORD *)&v25[12] = 0;
  *(_QWORD *)&v25[20] = 0;
  *(_QWORD *)v25 = 0x3CBA7097ELL;
  v12 = -[VNImageprint serializedLength](self, "serializedLength");
  v13 = a4 + 28;
  *(_DWORD *)&v25[8] = v12;
  v14 = -[VNMPImageDescriptor serializeStateIntoData:startingAtByteOffset:error:](self->_descriptor, "serializeStateIntoData:startingAtByteOffset:error:", v10, a4 + 28, a5);
  v15 = v14;
  if (!v14)
    goto LABEL_10;
  v16 = v14 + v13;
  *(_DWORD *)(v11 + v14 + v13) = self->_type;
  *(_DWORD *)(v14 + v13 + v11 + 4) = -[VNRequestSpecifier requestRevision](self->_originatingRequestSpecifier, "requestRevision");
  v24 = 0;
  -[VNRequestSpecifier requestClassName](self->_originatingRequestSpecifier, "requestClassName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = apple::vision::VNGetSerializingClassCodeForClassName((uint64_t)v17, (uint64_t)&v24, (uint64_t)a5);

  if (!v18)
    goto LABEL_10;
  *(_DWORD *)(v11 + v16 + 8) = v24;
  v19 = v15 + 40;
  if (v15 + 40 != v12)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected size of serialized state of the object of type %@"), objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 9, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_10;
  }
  v20 = (_OWORD *)(v11 + a4);
  calculateChecksumMD5((char *)(v11 + a4 + 28), v15 + 12, &v25[12]);
  v21 = *(_OWORD *)v25;
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)&v25[12];
  *v20 = v21;
LABEL_11:

  return v19;
}

- (id)serializeStateAndReturnError:(id *)a3
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[VNImageprint serializedLength](self, "serializedLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VNImageprint serializeStateIntoData:startingAtByteOffset:error:](self, "serializeStateIntoData:startingAtByteOffset:error:", v5, 0, a3))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNImageprint;
  v3 = -[VNImageprint hash](&v7, sel_hash);
  -[VNImageprint descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return -[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash") ^ __ROR8__(-[VNImageprint type](self, "type") ^ __ROR8__(v5, 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNImageprint *v4;
  VNImageprint *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (VNImageprint *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNImageprint type](self, "type");
      if (v6 == -[VNImageprint type](v5, "type")
        && (-[VNImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VNImageprint originatingRequestSpecifier](v5, "originatingRequestSpecifier"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v7, "isEqual:", v8),
            v8,
            v7,
            (v9 & 1) != 0))
      {
        -[VNImageprint descriptor](self, "descriptor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNImageprint descriptor](v5, "descriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (NSString)requestClassName
{
  void *v2;
  void *v3;

  -[VNImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (Class)requestClassAndReturnError:(id *)a3
{
  void *v4;
  void *v5;

  -[VNImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestClassAndReturnError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (unint64_t)requestRevision
{
  void *v2;
  unint64_t v3;

  -[VNImageprint originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestRevision");

  return v3;
}

- (VNMPImageDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

uint64_t __43__VNImageprint_distanceToImageprint_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "distanceFromDescriptor:", v3);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
