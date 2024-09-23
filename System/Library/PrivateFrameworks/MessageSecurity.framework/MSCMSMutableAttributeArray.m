@implementation MSCMSMutableAttributeArray

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedAttributeSet, 0);
  objc_storeStrong((id *)&self->_genericAttributes, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (id)getAttributesWithType:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  +[MSCMSMutableAttributeArray array](MSCMSMutableAttributeArray, "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__MSCMSMutableAttributeArray_getAttributesWithType___block_invoke;
  v8[3] = &unk_1EA961EC8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[MSCMSMutableAttributeArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)createAttributeArrayFromAttributeSetRaw:(heim_base_data *)a3 error:(id *)a4
{
  MSCMSMutableAttributeArray *v5;
  id v6;
  unint64_t var0;
  void *v8;
  char *var1;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  id v24;
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;
  heim_base_data *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MSCMSMutableAttributeArray initWithCapacity:]([MSCMSMutableAttributeArray alloc], "initWithCapacity:", 0);
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = 0;
  var0 = a3->var0;
  if (a3->var0)
  {
    v8 = 0;
    var1 = (char *)a3->var1;
    while (1)
    {
      memset(v26, 0, sizeof(v26));
      v25 = 0;
      v10 = decode_Attribute();
      if (v10)
        break;
      v24 = v8;
      +[MSCMSAttribute decodeAttribute:error:](MSCMSAttribute, "decodeAttribute:error:", v26, &v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24;

      if (v11)
        -[MSCMSMutableAttributeArray addObject:](v5, "addObject:", v11);
      var0 -= v25;
      var1 += v25;
      free_Attribute();

      v8 = v12;
      if (!var0)
        goto LABEL_9;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v10, v8, CFSTR("unable to decode CMSAttributes"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v12 = 0;
LABEL_9:
  v28 = a3;
  LODWORD(v27) = 1;
  *(_QWORD *)&v26[0] = 0;
  v13 = length_CMSOrderedAttributes();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v17 = 12;
    goto LABEL_15;
  }
  v6 = objc_retainAutorelease(v14);
  objc_msgSend(v6, "mutableBytes");
  v15 = encode_CMSOrderedAttributes();
  if (v15)
  {
    v16 = v15;

    v17 = v16;
LABEL_15:
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Failed encoding type CMSOrderedAttributes");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v17, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v12 = (id)v20;
    goto LABEL_17;
  }
  if (v13 != *(_QWORD *)&v26[0])
  {
    v22 = asn1_abort();
    return (id)__56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke(v22);
  }
LABEL_17:
  if (objc_msgSend(v6, "length") >= a3->var0)
  {
    -[MSCMSMutableAttributeArray setEncodedAttributeSet:](v5, "setEncodedAttributeSet:", v6);
    goto LABEL_19;
  }
LABEL_13:

  v5 = 0;
LABEL_19:
  if (a4)
  {
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }

  return v5;
}

void __56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  id obj;

  v7 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(a2, "encodeAttributeWithError:", &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "addObject:", v8);
    v9 = (_OWORD *)(a1[7] + 32 * a3);
    v10 = (_OWORD *)objc_msgSend(v8, "generateAttributeStruct");
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (id)encodeAttributesWithError:(id *)a3
{
  NSData *encodedAttributeSet;
  id result;
  id v7;
  id v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *genericAttributes;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  encodedAttributeSet = self->_encodedAttributeSet;
  if (encodedAttributeSet)
    return encodedAttributeSet;
  if (!-[MSCMSMutableAttributeArray count](self, "count"))
    return 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  if (a3)
  {
    v7 = *a3;
    if (*a3)
      v7 = (id)objc_msgSend(v7, "copy");
  }
  else
  {
    v7 = 0;
  }
  v38 = v7;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = malloc_type_malloc(32 * -[MSCMSMutableAttributeArray count](self, "count"), 0x10300406495394CuLL);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[MSCMSMutableAttributeArray count](self, "count"));
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    genericAttributes = self->_genericAttributes;
    self->_genericAttributes = v10;

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__MSCMSMutableAttributeArray_encodeAttributesWithError___block_invoke;
    v28[3] = &unk_1EA961EF0;
    v28[4] = self;
    v28[5] = &v33;
    v28[6] = &v29;
    v28[7] = v9;
    -[MSCMSMutableAttributeArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v28);
    if (*((_BYTE *)v30 + 24))
      goto LABEL_20;
    v27 = -[MSCMSMutableAttributeArray count](self, "count");
    v26 = 0;
    v12 = length_CMSAttributes();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v8 = objc_retainAutorelease(v13);
      objc_msgSend(v8, "mutableBytes");
      v14 = encode_CMSAttributes();
      if (!v14)
      {
        if (v12)
        {
          result = (id)asn1_abort();
          __break(1u);
          return result;
        }
        goto LABEL_19;
      }

      v15 = v14;
    }
    else
    {
      v15 = 12;
    }
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("Failed encoding type CMSAttributes");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, 0, v27, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v15, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v34[5];
    v34[5] = v22;

    v8 = 0;
LABEL_19:
    objc_msgSend(v8, "length", v26);
LABEL_20:
    free(v9);
    if (a3)
    {
      v24 = (void *)v34[5];
      if (v24)
        *a3 = objc_retainAutorelease(v24);
    }
    if (objc_msgSend(v8, "length"))
      v25 = v8;
    else
      v25 = 0;
    v19 = v25;
    goto LABEL_27;
  }
  if (a3)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorAllocationDomain[0], -67672, v34[5], CFSTR("Unable to allocate attribute array"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v34[5];
    v34[5] = (uint64_t)v16;

    v18 = objc_retainAutorelease(v16);
    v19 = 0;
    *a3 = v18;
  }
  else
  {
    v19 = 0;
  }
LABEL_27:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v19;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_attributes, "count");
}

void __52__MSCMSMutableAttributeArray_getAttributesWithType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "attributeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

- (void)addObject:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_attributes, "addObject:");
    -[MSCMSMutableAttributeArray reset](self, "reset");
  }
}

- (void)reset
{
  NSData *encodedAttributeSet;
  NSData *v4;
  NSData *v5;

  encodedAttributeSet = self->_encodedAttributeSet;
  self->_encodedAttributeSet = 0;

  -[MSCMSMutableAttributeArray encodeAttributesWithError:](self, "encodeAttributesWithError:", 0);
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  v5 = self->_encodedAttributeSet;
  self->_encodedAttributeSet = v4;

}

- (MSCMSMutableAttributeArray)initWithCapacity:(unint64_t)a3
{
  MSCMSMutableAttributeArray *v4;
  uint64_t v5;
  NSMutableArray *attributes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSCMSMutableAttributeArray;
  v4 = -[MSCMSMutableAttributeArray init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    attributes = v4->_attributes;
    v4->_attributes = (NSMutableArray *)v5;

  }
  return v4;
}

- (void)setEncodedAttributeSet:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)calculateAttributesWithDigest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  if (a4 && *a4)
    v7 = (void *)objc_msgSend(*a4, "copy");
  else
    v7 = 0;
  if (!self->_encodedAttributeSet)
  {
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorCMSDomain[0], -26276, v7, CFSTR("unable to encode signed attributes"));
    v15 = objc_claimAutoreleasedReturnValue();

LABEL_10:
    v11 = 0;
    v7 = (void *)v15;
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  objc_msgSend(v6, "algorithm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend(v8, "ccdigest");

  if (!v9)
  {
    v12 = MSErrorCryptoDomain[0];
    objc_msgSend(v6, "algorithm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "OIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v12, -4, v7, CFSTR("%@ is not a supported digest algorithm"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData length](self->_encodedAttributeSet, "length");
  -[NSData bytes](self->_encodedAttributeSet, "bytes");
  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v11, "mutableBytes");
  ccdigest();
  if (!a4)
    goto LABEL_13;
LABEL_11:
  if (v7)
    *a4 = objc_retainAutorelease(v7);
LABEL_13:

  return v11;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  if (a3)
  {
    -[NSMutableArray insertObject:atIndex:](self->_attributes, "insertObject:atIndex:", a3, a4);
    -[MSCMSMutableAttributeArray reset](self, "reset");
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_attributes, "removeObjectAtIndex:", a3);
  -[MSCMSMutableAttributeArray reset](self, "reset");
}

- (void)removeLastObject
{
  -[NSMutableArray removeLastObject](self->_attributes, "removeLastObject");
  -[MSCMSMutableAttributeArray reset](self, "reset");
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (a4)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_attributes, "replaceObjectAtIndex:withObject:", a3);
    -[MSCMSMutableAttributeArray reset](self, "reset");
  }
}

- (void)removeAttributes:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, uint64_t);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __47__MSCMSMutableAttributeArray_removeAttributes___block_invoke;
  v9 = &unk_1EA961EC8;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  -[MSCMSMutableAttributeArray enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", &v6);
  -[MSCMSMutableAttributeArray removeObjectsAtIndexes:](self, "removeObjectsAtIndexes:", v13[5], v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

void __47__MSCMSMutableAttributeArray_removeAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a2, "encodeAttributeWithError:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addIndex:", a3);

}

- (id)encodeImplicitAttributesWithError:(id *)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[MSCMSMutableAttributeArray encodeAttributesWithError:](self, "encodeAttributesWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = nsheim_decode_CMSOrderedAttributes(v4);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", MEMORY[8], MEMORY[0], 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      free_CMSOrderedAttributes();
      goto LABEL_8;
    }
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", MSErrorASN1Domain[0], v6, 0, CFSTR("unable to decode CMSAttributes"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
      *a3 = objc_retainAutorelease(v7);

  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (NSMutableArray)attributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)genericAttributes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGenericAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)encodedAttributeSet
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

@end
