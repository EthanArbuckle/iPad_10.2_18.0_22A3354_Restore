@implementation BSProtobufSerialization

+ (id)encodeObject:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v13;

  v13 = a3;
  v6 = (void *)objc_opt_class();
  v7 = -[objc_class protobufSchema](_BSProtobufValidateClassForEncoding((uint64_t)"<top level>", v6), "protobufSchema");
  if (v7)
  {
    v8 = v7;
    while (1)
    {
      v8 = *(_QWORD *)(v8 + 16);
      if (!v8)
        break;
      if (*(_QWORD *)(v8 + 56))
        goto LABEL_7;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
LABEL_7:
  v9 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v10 = *(_QWORD **)(v8 + 56);
  if (!v10)
  {
    if (_BSProtobufSchemaEncodeMessage(v8, (uint64_t)a3, (uint64_t)v9, (uint64_t)a4))
      goto LABEL_9;
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if ((_BSProtobufSchemaEncodeMessageWithExplicitIvarBaseAddress(v10, (uint64_t)&v13, (uint64_t)v9, (uint64_t)a4) & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v11 = (id)objc_msgSend(v9, "immutableData");
LABEL_12:

  return v11;
}

+ (id)decodeObjectOfClass:(Class)a3 fromData:(id)a4 error:(id *)a5
{
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  void **v12;
  id v13;
  int v14;
  id v15;
  id *v17;
  id v18;

  v7 = _BSProtobufValidateClassForEncoding((uint64_t)"<top level>", a3);
  v8 = -[objc_class protobufSchema](v7, "protobufSchema");
  if (v8)
  {
    v9 = v8;
    while (1)
    {
      v9 = *(_QWORD *)(v9 + 16);
      if (!v9)
        break;
      if (*(_QWORD *)(v9 + 56))
        goto LABEL_7;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
LABEL_7:
  v10 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", a4);
  v18 = 0;
  v11 = *(_QWORD *)(v9 + 56);
  if (v11)
  {
    v17 = &v18;
    v12 = (void **)&v17;
  }
  else
  {
    if (*(_BYTE *)(v9 + 73))
      v13 = (id)objc_msgSend([v7 alloc], "initForProtobufDecoding");
    else
      v13 = objc_alloc_init(v7);
    v18 = v13;
    v12 = &v18;
    v11 = v9;
  }
  v14 = _BSProtobufSchemaDecodeMessage(v11, v12, v10, a5);

  v15 = v18;
  if (v14)
    return v18;
  else
    return 0;
}

+ (id)buildSchemaForClass:(Class)a3 builder:(id)a4
{
  BSProtobufSchema *v6;
  _QWORD *v7;
  _QWORD *v8;
  Class Superclass;
  objc_class *v10;
  _QWORD *v11;
  objc_super v13;

  v6 = [BSProtobufSchema alloc];
  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)BSProtobufSchema;
    v7 = objc_msgSendSuper2(&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7[1] = a3;
      v7[3] = 0;
      v7[6] = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      Superclass = class_getSuperclass(a3);
      if (Superclass)
      {
        v10 = Superclass;
        while (!BSProtobufClassImplmementsProtobufSchema(v10))
        {
          v10 = class_getSuperclass(v10);
          if (!v10)
            goto LABEL_9;
        }
        v8[2] = (id)-[objc_class protobufSchema](v10, "protobufSchema");
      }
LABEL_9:
      *((_BYTE *)v8 + 72) = class_getInstanceMethod(a3, sel_didFinishProtobufDecodingWithError_) != 0;
      *((_BYTE *)v8 + 73) = class_getInstanceMethod(a3, sel_initForProtobufDecoding) != 0;
      *((_BYTE *)v8 + 74) = class_getInstanceMethod(a3, sel_initProtobufTranslatorForObject_) != 0;
    }
  }
  else
  {
    v8 = 0;
  }
  v11 = v8;
  (*((void (**)(id, _QWORD *))a4 + 2))(a4, v11);
  return v11;
}

@end
