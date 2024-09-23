@implementation ASPickerDisplayItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPickerDisplayItem)initWithName:(id)a3 productImage:(id)a4 descriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASPickerDisplayItem *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  ASPickerDisplayItem *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASPickerDisplayItem;
  v12 = -[ASPickerDisplayItem init](&v18, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v14;

    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v12->_productImage, a4);
    objc_storeStrong((id *)&v12->_descriptor, a5);
    v16 = v12;
  }

  return v12;
}

- (ASPickerDisplayItem)initWithCoder:(id)a3
{
  id v4;
  ASPickerDisplayItem *v5;
  ASPickerDisplayItem *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  ASPickerDisplayItem *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v4 = a3;
  v5 = -[ASPickerDisplayItem init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v5->_allowsRename)
      v5->_setupOptions |= 1uLL;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_storeStrong((id *)&v6->_productImage, v9);
      v10 = v8;
      objc_opt_class();
      NSDecodeObjectIfPresent();

      v11 = v10;
      if (objc_msgSend(v11, "containsValueForKey:", CFSTR("rOp")))
        v6->_renameOptions = objc_msgSend(v11, "decodeIntegerForKey:", CFSTR("rOp"));

      v12 = v11;
      if (objc_msgSend(v12, "containsValueForKey:", CFSTR("pDop")))
        v6->_setupOptions = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("pDop"));

      v13 = v6;
    }
    else
    {
      v23 = objc_opt_class();
      ASErrorF(1, (uint64_t)"%@ bad image data init failed", v24, v25, v26, v27, v28, v29, v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "failWithError:", v30);

      v13 = 0;
    }

  }
  else
  {
    v15 = objc_opt_class();
    ASErrorF(1, (uint64_t)"%@ init failed", v16, v17, v18, v19, v20, v21, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v22);

    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  UTType *accessoryType;
  ASDiscoveryDescriptor *descriptor;
  NSString *name;
  UIImage *v7;
  void *v8;
  NSString *identifier;
  unint64_t renameOptions;
  void *v11;
  unint64_t setupOptions;
  id v13;

  v13 = a3;
  accessoryType = self->_accessoryType;
  if (accessoryType)
    objc_msgSend(v13, "encodeObject:forKey:", accessoryType, CFSTR("aTe"));
  if (self->_allowsRename)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("aRm"));
  descriptor = self->_descriptor;
  if (descriptor)
    objc_msgSend(v13, "encodeObject:forKey:", descriptor, CFSTR("aDr"));
  name = self->_name;
  if (name)
    objc_msgSend(v13, "encodeObject:forKey:", name, CFSTR("dNm"));
  -[ASPickerDisplayItem resizedImage](self, "resizedImage");
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("pImg"));

  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v13, "encodeObject:forKey:", identifier, CFSTR("pDid"));
  renameOptions = self->_renameOptions;
  v11 = v13;
  if (renameOptions)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", renameOptions, CFSTR("rOp"));
    v11 = v13;
  }
  setupOptions = self->_setupOptions;
  if (setupOptions)
  {
    objc_msgSend(v13, "encodeInteger:forKey:", setupOptions, CFSTR("pDop"));
    v11 = v13;
  }

}

- (ASPickerDisplayItem)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ASPickerDisplayItem *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  ASPickerDisplayItem *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = -[ASPickerDisplayItem init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ASErrorF(-6756, (uint64_t)"%@ init failed", v20, v21, v22, v23, v24, v25, (uint64_t)v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_25;
  }
  if (MEMORY[0x2349290D0](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
      ASErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v33);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_25:
    v17 = 0;
    goto LABEL_19;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_20;
  if (v7->_allowsRename)
    v7->_setupOptions |= 1uLL;
  objc_opt_class();
  if (!CUXPCDecodeObject() || !CUXPCDecodeNSString())
  {
LABEL_20:
    v17 = 0;
    goto LABEL_18;
  }
  CUXPCDecodeNSData();
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      ASErrorF(-6756, (uint64_t)"%@ bad image data init failed", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_28;
  }
  objc_storeStrong((id *)&v7->_productImage, v14);
  if (!CUXPCDecodeNSString())
  {
LABEL_28:
    v17 = 0;
    goto LABEL_17;
  }
  v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_renameOptions = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_28;
  }
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 != 6)
  {
    if (v16 != 5)
      goto LABEL_16;
    goto LABEL_28;
  }
  v7->_setupOptions = 0;
LABEL_16:
  v17 = v7;
LABEL_17:

LABEL_18:
LABEL_19:

  return v17;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  NSString *name;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  UIImage *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  const char *v18;
  NSString *identifier;
  const char *v20;
  uint64_t renameOptions;
  uint64_t setupOptions;
  xpc_object_t xdict;

  v4 = a3;
  CUXPCEncodeObject();
  name = self->_name;
  v6 = v4;
  v7 = -[NSString UTF8String](objc_retainAutorelease(name), "UTF8String");
  if (v7)
    xpc_dictionary_set_string(v6, "dNm", v7);

  -[UTType identifier](self->_accessoryType, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  if (v11)
    xpc_dictionary_set_string(v9, "aTe", v11);

  -[ASPickerDisplayItem resizedImage](self, "resizedImage");
  v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = objc_retainAutorelease(v13);
    v16 = v9;
    v17 = objc_msgSend(v15, "bytes");
    if (v17)
      v18 = (const char *)v17;
    else
      v18 = "";
    xpc_dictionary_set_data(v16, "pImg", v18, objc_msgSend(v15, "length"));

  }
  identifier = self->_identifier;
  xdict = v9;
  v20 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v20)
    xpc_dictionary_set_string(xdict, "pDid", v20);

  renameOptions = self->_renameOptions;
  if (renameOptions)
    xpc_dictionary_set_uint64(xdict, "rOp", renameOptions);
  setupOptions = self->_setupOptions;
  if (setupOptions)
    xpc_dictionary_set_uint64(xdict, "pDop", setupOptions);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[UTType copy](self->_accessoryType, "copy");
  v6 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v5;

  *(_BYTE *)(v4 + 8) = self->_allowsRename;
  v7 = -[UIImage copy](self->_productImage, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[ASDiscoveryDescriptor copy](self->_descriptor, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[NSString copy](self->_name, "copy");
  v12 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v11;

  v13 = -[NSString copy](self->_identifier, "copy");
  v14 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v13;

  *(_QWORD *)(v4 + 40) = self->_renameOptions;
  *(_QWORD *)(v4 + 48) = self->_setupOptions;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  ASPickerDisplayItem *v4;
  ASPickerDisplayItem *v5;
  ASPickerDisplayItem *v6;
  NSString *name;
  void *v8;
  NSString *p_isa;
  ASDiscoveryDescriptor *v10;
  ASDiscoveryDescriptor *v11;
  int v12;
  BOOL v13;
  ASDiscoveryDescriptor *descriptor;
  void *v15;
  ASDiscoveryDescriptor *v16;
  ASDiscoveryDescriptor *v17;
  _BOOL4 v18;
  NSString *identifier;
  void *v20;
  NSString *v21;
  ASDiscoveryDescriptor *v22;
  int v23;
  unint64_t renameOptions;
  unint64_t setupOptions;

  v4 = (ASPickerDisplayItem *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!-[ASPickerDisplayItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v13 = 0;
LABEL_29:

      goto LABEL_30;
    }
    name = self->_name;
    -[ASPickerDisplayItem name](v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    p_isa = name;
    v10 = v8;
    v11 = v10;
    if (p_isa == (NSString *)v10)
    {

    }
    else
    {
      if ((p_isa == 0) == (v10 != 0))
      {
        v13 = 0;
        v16 = v10;
LABEL_26:

        goto LABEL_27;
      }
      v12 = -[NSString isEqual:](p_isa, "isEqual:", v10);

      if (!v12)
      {
        v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    descriptor = self->_descriptor;
    -[ASPickerDisplayItem descriptor](v6, "descriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = descriptor;
    v17 = v15;
    p_isa = (NSString *)&v17->super.isa;
    if (v16 == v17)
    {

    }
    else
    {
      if ((v16 == 0) == (v17 != 0))
      {

        goto LABEL_25;
      }
      v18 = -[ASDiscoveryDescriptor isEqual:](v16, "isEqual:", v17);

      if (!v18)
      {
        v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    identifier = self->_identifier;
    -[ASPickerDisplayItem identifier](v6, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = identifier;
    v22 = v20;
    v16 = v22;
    if (v21 == (NSString *)v22)
    {

    }
    else
    {
      if ((v21 == 0) == (v22 != 0))
      {

        goto LABEL_25;
      }
      v23 = -[NSString isEqual:](v21, "isEqual:", v22);

      if (!v23)
        goto LABEL_25;
    }
    renameOptions = self->_renameOptions;
    if (renameOptions == -[ASPickerDisplayItem renameOptions](v6, "renameOptions"))
    {
      setupOptions = self->_setupOptions;
      v13 = setupOptions == -[ASPickerDisplayItem setupOptions](v6, "setupOptions");
      goto LABEL_26;
    }
LABEL_25:
    v13 = 0;
    goto LABEL_26;
  }
  v13 = 1;
LABEL_30:

  return v13;
}

- (id)resizedImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  UIImage *v12;
  void *v13;
  void *v14;
  _QWORD v16[7];

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  v6 = (double)CGImageGetWidth(-[UIImage CGImage](self->_productImage, "CGImage")) / v5;
  v7 = (double)CGImageGetHeight(-[UIImage CGImage](self->_productImage, "CGImage")) / v5;
  v8 = 180.0;
  if (v6 <= 180.0 && v7 <= 120.0)
  {
    v12 = self->_productImage;
  }
  else
  {
    v10 = v6 / v7;
    if (v10 <= 1.5)
    {
      v11 = 120.0;
      v8 = v10 * 120.0;
    }
    else
    {
      v11 = 180.0 / v10;
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", v8, v11);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __35__ASPickerDisplayItem_resizedImage__block_invoke;
    v16[3] = &unk_25041FB70;
    v16[4] = self;
    *(double *)&v16[5] = v8;
    *(double *)&v16[6] = v11;
    objc_msgSend(v13, "imageWithActions:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithRenderingMode:", -[UIImage renderingMode](self->_productImage, "renderingMode"));
    v12 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

uint64_t __35__ASPickerDisplayItem_resizedImage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "drawInRect:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)description
{
  return -[ASPickerDisplayItem descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  NSString *identifier;
  __CFString *v6;
  UTType *accessoryType;
  UTType *v8;
  __CFString *v9;
  NSString *name;
  __CFString *v11;
  ASDiscoveryDescriptor *descriptor;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  NSString *v19;
  void *v20;
  NSString *v21;
  ASDiscoveryDescriptor *v22;
  void *v23;
  void *v24;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v19 = identifier;
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  accessoryType = self->_accessoryType;
  if (accessoryType)
  {
    v8 = accessoryType;
    -[UTType identifier](v8, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v9 = v4;

    v4 = v9;
  }
  name = self->_name;
  if (name)
  {
    v21 = name;
    CUAppendF();
    v11 = v4;

    v4 = v11;
  }
  descriptor = self->_descriptor;
  if (descriptor)
  {
    v22 = descriptor;
    CUAppendF();
    v13 = v4;

    v4 = v13;
  }
  if (self->_setupOptions)
  {
    CUPrintFlags64();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v14 = v4;

    v4 = v14;
  }
  if (self->_renameOptions)
  {
    CUPrintFlags64();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v15 = v4;

    v4 = v15;
  }
  v16 = &stru_250420148;
  if (v4)
    v16 = v4;
  v17 = v16;

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)productImage
{
  return self->_productImage;
}

- (ASDiscoveryDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)renameOptions
{
  return self->_renameOptions;
}

- (void)setRenameOptions:(unint64_t)a3
{
  self->_renameOptions = a3;
}

- (unint64_t)setupOptions
{
  return self->_setupOptions;
}

- (void)setSetupOptions:(unint64_t)a3
{
  self->_setupOptions = a3;
}

- (UTType)accessoryType
{
  return self->_accessoryType;
}

- (BOOL)allowsRename
{
  return self->_allowsRename;
}

- (void)setAllowsRename:(BOOL)a3
{
  self->_allowsRename = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_productImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
