@implementation AVAnnotationRepresentation

+ (id)_annotationRepresentationWithPropertyList:(id)a3 binaryData:(id)a4
{
  void *v6;
  void *v7;
  __objc2_class **v8;
  id result;

  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationArchiveKeyVersion"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("AVAnnotationRepresentationVersion_1")))
      return -[AVAnnotationUnknownRepresentation _initWithPropertyList:binaryData:]([AVAnnotationUnknownRepresentation alloc], "_initWithPropertyList:binaryData:", a3, a4);
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyType"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AVAnnotationRepresentationTypeText")) & 1) != 0)
      {
        v8 = off_1E302A1A0;
        goto LABEL_16;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AVAnnotationRepresentationTypeImage")) & 1) != 0)
      {
        v8 = off_1E302A170;
        goto LABEL_16;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AVAnnotationRepresentationTypePKDrawing")) & 1) != 0)
      {
        v8 = off_1E302A178;
        goto LABEL_16;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AVAnnotationRepresentationTypeSVG")) & 1) != 0)
      {
        v8 = off_1E302A190;
        goto LABEL_16;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AVAnnotationRepresentationTypeShape")) & 1) != 0)
      {
        v8 = off_1E302A198;
        goto LABEL_16;
      }
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("AVAnnotationRepresentationTypePath")))
      {
        v8 = off_1E302A180;
LABEL_16:
        result = (id)objc_msgSend(objc_alloc(*v8), "_initWithPropertyList:binaryData:", a3, a4);
        if (result)
          return result;
      }
      return -[AVAnnotationUnknownRepresentation _initWithPropertyList:binaryData:]([AVAnnotationUnknownRepresentation alloc], "_initWithPropertyList:binaryData:", a3, a4);
    }
  }
  return 0;
}

- (id)_initWithRepresentationType:(id)a3
{
  AVAnnotationRepresentation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationRepresentation;
  v4 = -[AVAnnotationRepresentation init](&v6, sel_init);
  if (v4)
  {
    v4->_representationType = (NSString *)objc_msgSend(a3, "copy");
    v4->_version = (NSString *)objc_msgSend(CFSTR("AVAnnotationRepresentationVersion_1"), "copy");
    v4->_identifier = (NSUUID *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "copy");
  }
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  AVAnnotationRepresentation *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationRepresentation;
  v5 = -[AVAnnotationRepresentation init](&v10, sel_init, a3, a4);
  if (!v5)
    goto LABEL_6;
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationRepresentationArchiveKeyType"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v5->_representationType = (NSString *)objc_msgSend(v6, "copy");
  v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationArchiveKeyVersion"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5->_version = (NSString *)objc_msgSend(v7, "copy"),
        v8 = objc_msgSend(a3, "objectForKey:", CFSTR("AVAnnotationArchiveKeyIdentifier")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5->_identifier = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
  }
  else
  {
LABEL_6:

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationRepresentation;
  -[AVAnnotationRepresentation dealloc](&v3, sel_dealloc);
}

- (id)_representationType
{
  return self->_representationType;
}

- (void)_setRepresentationType:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_representationType = v4;
}

- (id)_version
{
  return self->_version;
}

- (void)_setVersion:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_version = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  uint64_t v5;

  v5 = 0;
  v3 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](self, "_propertyListAndBinaryData:", &v5);
  return +[AVAnnotationRepresentation _annotationRepresentationWithPropertyList:binaryData:](AVAnnotationRepresentation, "_annotationRepresentationWithPropertyList:binaryData:", v3, v5);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_msgSend(-[AVAnnotationRepresentation _representationType](self, "_representationType"), "isEqualToString:", objc_msgSend(a3, "_representationType"));
    if (v5)
    {
      v5 = objc_msgSend(-[AVAnnotationRepresentation _version](self, "_version"), "isEqualToString:", objc_msgSend(a3, "_version"));
      if (v5)
        LOBYTE(v5) = -[NSUUID isEqual:](-[AVAnnotationRepresentation identifier](self, "identifier"), "isEqual:", objc_msgSend(a3, "identifier"));
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(-[AVAnnotationRepresentation _representationType](self, "_representationType"), "hash");
  v4 = objc_msgSend(-[AVAnnotationRepresentation _version](self, "_version"), "hash") ^ v3;
  return v4 ^ -[NSUUID hash](-[AVAnnotationRepresentation identifier](self, "identifier"), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationRepresentation _representationType](self, "_representationType"), CFSTR("AVAnnotationRepresentationArchiveKeyType"));
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationRepresentation _version](self, "_version"), CFSTR("AVAnnotationArchiveKeyVersion"));
  objc_msgSend(v5, "setObject:forKey:", -[NSUUID UUIDString](-[AVAnnotationRepresentation identifier](self, "identifier"), "UUIDString"), CFSTR("AVAnnotationArchiveKeyIdentifier"));
  *a3 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  return v5;
}

+ (id)_createMetadataItemPayloadForData:(id)a3 identifier:(id)a4 error:(id *)a5
{
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("data");
  v7[0] = a4;
  v7[1] = a3;
  return +[AVAnnotationRepresentation _createMetadataItemPayloadForDataBinding:error:](AVAnnotationRepresentation, "_createMetadataItemPayloadForDataBinding:error:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2), a5);
}

+ (id)_createMetadataItemPayloadForDataBinding:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v16;
  uint64_t v17;
  __int16 v18;
  char v19;

  v5 = a3;
  if (!a3)
  {
    v14 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11883, 0);
LABEL_9:
    v13 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("data"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v7 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("identifier")),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11883, 0);
    v5 = 0;
    goto LABEL_9;
  }
  v19 = 0;
  v8 = (void *)objc_msgSend(v7, "UUIDString");
  v9 = 2 * objc_msgSend(v8, "length");
  v5 = malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  objc_msgSend(v8, "getCString:maxLength:encoding:", v5, v9, 1);
  v10 = strnlen((const char *)v5, v9);
  v11 = objc_msgSend(v6, "length");
  v12 = objc_msgSend(v6, "bytes");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v10 + 14 + v11);
  objc_msgSend(v13, "mutableBytes");
  v16 = bswap32(v10 + 14 + v11);
  v17 = 1919968626;
  v18 = bswap32(v10) >> 16;
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", 0, 14, &v16, 14);
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", 14, v10, v5, v10);
  objc_msgSend(v13, "replaceBytesInRange:withBytes:length:", v10 + 14, v11, v12, v11);
  v14 = 0;
  if (a4)
LABEL_5:
    *a4 = v14;
LABEL_6:
  free(v5);
  return v13;
}

+ (id)_createBindingDictionaryFromMetadataItemPayload:(id)a3 error:(id *)a4
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_10;
  v6 = objc_msgSend(a3, "length");
  if (v6 <= 0xD)
    goto LABEL_10;
  v7 = v6;
  v8 = objc_msgSend(a3, "bytes");
  if (v7 != bswap32(*(_DWORD *)v8)
    || (v9 = v8,
        v10 = bswap32(*(unsigned __int16 *)(v8 + 12)) >> 16,
        v11 = v10 + 14,
        v12 = v7 >= v10 + 14,
        v13 = v7 - (v10 + 14),
        !v12)
    || (v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v8 + 14, v10, 1), (v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v14)) == 0))
  {
LABEL_10:
    v19 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11821, 0);
    v18 = 0;
    if (!a4)
      return v18;
    goto LABEL_8;
  }
  v16 = v15;
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v13);
  objc_msgSend(v17, "replaceBytesInRange:withBytes:length:", 0, v13, v9 + v11, v13);
  v21[0] = CFSTR("identifier");
  v21[1] = CFSTR("data");
  v22[0] = v16;
  v22[1] = v17;
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v19 = 0;
  if (a4)
LABEL_8:
    *a4 = v19;
  return v18;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
