@implementation MSCMSAttribute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeDERData, 0);
  objc_storeStrong((id *)&self->_attributeValues, 0);
  objc_storeStrong((id *)&self->_attributeType, 0);
}

- (void)dealloc
{
  Attribute *encodedAttribute;
  objc_super v4;

  encodedAttribute = self->_encodedAttribute;
  if (encodedAttribute)
  {
    free_Attribute();
    encodedAttribute = self->_encodedAttribute;
  }
  free(encodedAttribute);
  self->_encodedAttribute = 0;
  v4.receiver = self;
  v4.super_class = (Class)MSCMSAttribute;
  -[MSCMSAttribute dealloc](&v4, sel_dealloc);
}

uint64_t __41__MSCMSAttribute_generateAttributeStruct__block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  id v5;
  unsigned int v6;
  _QWORD v8[2];

  v5 = objc_retainAutorelease(a2);
  v8[1] = objc_msgSend(v5, "bytes");
  v6 = objc_msgSend(v5, "length");

  v8[0] = v6;
  return MEMORY[0x1DF0F2414](v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 24) + 16 * a3);
}

- (Attribute)generateAttributeStruct
{
  uint64_t v3;
  NSArray *attributeValues;
  _QWORD v6[7];

  if (self->_encodedAttribute)
  {
    free_Attribute();
    free(self->_encodedAttribute);
  }
  self->_encodedAttribute = (Attribute *)malloc_type_malloc(0x20uLL, 0x10300406495394CuLL);
  v6[5] = -[MSOID Asn1OID](self->_attributeType, "Asn1OID");
  v6[6] = v3;
  der_copy_oid();
  self->_encodedAttribute->var1.var0 = -[NSArray count](self->_attributeValues, "count");
  self->_encodedAttribute->var1.var1 = (heim_base_data *)malloc_type_malloc(16 * -[NSArray count](self->_attributeValues, "count"), 0x108004057E67DB5uLL);
  attributeValues = self->_attributeValues;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__MSCMSAttribute_generateAttributeStruct__block_invoke;
  v6[3] = &unk_1EA961F18;
  v6[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](attributeValues, "enumerateObjectsUsingBlock:", v6);
  return self->_encodedAttribute;
}

- (MSOID)attributeType
{
  return (MSOID *)objc_getProperty(self, a2, 8, 1);
}

+ (id)decodeAttribute:(Attribute *)a3 error:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAttributeStruct:error:", a3, a4);
}

- (NSArray)attributeValues
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (MSCMSAttribute)initWithAttributeStruct:(Attribute *)a3 error:(id *)a4
{
  MSCMSAttribute *v6;
  Attribute *v7;
  int v8;
  MSCMSAttribute *v9;
  uint64_t v10;
  MSOID *attributeType;
  NSArray *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  NSArray *attributeValues;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MSCMSAttribute;
  v6 = -[MSCMSAttribute init](&v18, sel_init);
  if (!v6)
  {
LABEL_13:
    v9 = v6;
    goto LABEL_17;
  }
  v7 = (Attribute *)malloc_type_malloc(0x20uLL, 0x10300406495394CuLL);
  v6->_encodedAttribute = v7;
  if (v7)
  {
    v8 = copy_Attribute();
    if (v8)
    {
      if (a4)
      {
        +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v8, *a4, CFSTR("unable to copy Attribute"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_16;
    }
    +[MSOID OIDWithAsn1OID:error:](MSOID, "OIDWithAsn1OID:error:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    attributeType = v6->_attributeType;
    v6->_attributeType = (MSOID *)v10;

    if (!v6->_attributeType)
    {
      free_Attribute();
LABEL_16:
      free(v6->_encodedAttribute);
      v9 = 0;
      v6->_encodedAttribute = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3->var1.var0);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (a3->var1.var0)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3->var1.var1[v13].var1, a3->var1.var1[v13].var0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v12, "addObject:", v15);

        ++v14;
        ++v13;
      }
      while (v14 < a3->var1.var0);
    }
    attributeValues = v6->_attributeValues;
    v6->_attributeValues = v12;

    goto LABEL_13;
  }
  if (a4)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], -108, *a4, CFSTR("unable to allocate Attribute"));
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (MSCMSAttribute)initWithDER:(id)a3
{
  id v4;
  MSCMSAttribute *v5;
  id v6;
  MSCMSAttribute *v7;
  MSCMSAttribute *v8;

  v4 = a3;
  v5 = (MSCMSAttribute *)malloc_type_malloc(0x20uLL, 0x10300406495394CuLL);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    if (decode_Attribute())
    {
      free(v5);
      v5 = 0;
    }
    else
    {
      v7 = -[MSCMSAttribute initWithAttributeStruct:error:](self, "initWithAttributeStruct:error:", v5, 0);
      v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_attributeDERData, v6);
        free_Attribute();
        free(v5);
      }
      self = v8;
      v5 = self;
    }
  }

  return v5;
}

- (MSCMSAttribute)initWithAttributeType:(id)a3 values:(id)a4
{
  id v7;
  id v8;
  MSCMSAttribute *v9;
  MSCMSAttribute *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSCMSAttribute;
  v9 = -[MSCMSAttribute init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributeType, a3);
    objc_storeStrong((id *)&v10->_attributeValues, a4);
  }

  return v10;
}

- (MSCMSAttribute)initWithAttribute:(id)a3 error:(id *)a4
{
  MSCMSAttribute *v5;

  v5 = (MSCMSAttribute *)a3;

  return v5;
}

- (NSData)attributeDERData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttributeDERData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (Attribute)encodedAttribute
{
  return self->_encodedAttribute;
}

- (void)setEncodedAttribute:(Attribute *)a3
{
  self->_encodedAttribute = a3;
}

@end
