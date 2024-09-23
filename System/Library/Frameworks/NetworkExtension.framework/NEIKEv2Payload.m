@implementation NEIKEv2Payload

- (NEIKEv2Payload)init
{
  NEIKEv2Payload *v2;
  NSObject *v3;
  NEIKEv2Payload *v4;
  const char *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2Payload;
  v2 = -[NEIKEv2Payload init](&v8, sel_init);
  if (!v2)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_WORD *)v7 = 0;
    v6 = "[super init] failed";
    goto LABEL_8;
  }
  if (!-[NEIKEv2Payload isMemberOfClass:](v2, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = v2;
    goto LABEL_6;
  }
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    v6 = "Must use a subclass of NEIKEv2Payload to init";
LABEL_8:
    _os_log_fault_impl(&dword_19BD16000, v3, OS_LOG_TYPE_FAULT, v6, v7, 2u);
  }
LABEL_4:

  v4 = 0;
LABEL_6:

  return v4;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)hasRequiredFields
{
  NSObject *v3;
  int v5;
  NEIKEv2Payload *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Cannot check for required fields on generic payload %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (BOOL)generatePayloadData
{
  NSObject *v3;
  int v5;
  NEIKEv2Payload *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Cannot generate payload data for %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  NSObject *v3;
  int v5;
  NEIKEv2Payload *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "Cannot parse payload data for %@", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v6, "appendPrettyObject:withName:andIndent:options:", v7, CFSTR("Payload Type"), v5, a4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadData, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Invalid");
}

- (uint64_t)isValid
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  if ((*(_BYTE *)(result + 8) & 1) != 0)
  {
    if ((objc_msgSend((id)result, "hasRequiredFields") & 1) == 0)
      goto LABEL_4;
    return 1;
  }
  if ((objc_msgSend((id)result, "generatePayloadData") & 1) != 0)
    return 1;
LABEL_4:
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = v1;
    _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Failed to validate %@", (uint8_t *)&v3, 0xCu);
  }

  return 0;
}

+ (NSObject)createPayloadWithType:(void *)a3 fromData:
{
  id v4;
  __objc2_class **v5;
  NSObject *p_super;
  const char *v7;
  NSObject *v8;
  NEIKEv2CustomPayload *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  v5 = off_1E3CBB9E8;
  switch(a2)
  {
    case '!':
      if ((unint64_t)objc_msgSend(v4, "length") <= 7)
      {
        ne_log_obj();
        p_super = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        v17 = 67109120;
        LODWORD(v18) = objc_msgSend(v4, "length");
        v7 = "Failed to parse SA, length %u";
        goto LABEL_39;
      }
      v13 = objc_msgSend(v4, "bytes");
      v14 = *(unsigned __int8 *)(v13 + 5);
      if (v14 == 1)
      {
        v5 = off_1E3CBBA48;
        goto LABEL_25;
      }
      if (v14 == 3)
      {
        v5 = off_1E3CBB958;
        goto LABEL_25;
      }
      v15 = v13;
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v16 = *(unsigned __int8 *)(v15 + 5);
        v17 = 67109120;
        LODWORD(v18) = v16;
        v7 = "Failed to parse unknown SA type %u";
LABEL_39:
        _os_log_error_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v17, 8u);
      }
LABEL_31:

      p_super = 0;
LABEL_32:

      return p_super;
    case '"':
      v5 = off_1E3CBBB28;
      goto LABEL_25;
    case '#':
      v5 = off_1E3CBBAD8;
      goto LABEL_25;
    case '$':
      v5 = off_1E3CBBBA8;
      goto LABEL_25;
    case '%':
      v5 = off_1E3CBB938;
      goto LABEL_25;
    case '&':
      v5 = off_1E3CBB940;
      goto LABEL_25;
    case '\'':
      v5 = off_1E3CBB928;
      goto LABEL_25;
    case '(':
      v5 = off_1E3CBBB58;
      goto LABEL_25;
    case ')':
      v5 = off_1E3CBBB60;
      goto LABEL_25;
    case '*':
      v5 = off_1E3CBB9B0;
      goto LABEL_25;
    case '+':
      v5 = off_1E3CBBC48;
      goto LABEL_25;
    case ',':
      v5 = off_1E3CBBAE0;
      goto LABEL_25;
    case '-':
      v5 = off_1E3CBBBB0;
      goto LABEL_25;
    case '.':
      goto LABEL_25;
    case '/':
      v5 = off_1E3CBB970;
      goto LABEL_25;
    case '0':
      v5 = off_1E3CBB9C0;
      goto LABEL_25;
    case '1':
      v5 = off_1E3CBBA18;
      goto LABEL_25;
    case '5':
      v5 = off_1E3CBB9D8;
LABEL_25:
      p_super = objc_alloc_init(*v5);
      if (p_super)
        goto LABEL_26;
      goto LABEL_27;
    default:
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17 = 67109120;
        LODWORD(v18) = a2;
        _os_log_impl(&dword_19BD16000, v8, OS_LOG_TYPE_INFO, "Received unknown payload type %u, saving as custom", (uint8_t *)&v17, 8u);
      }

      v9 = objc_alloc_init(NEIKEv2CustomPayload);
      p_super = &v9->super.super;
      if (!v9)
        goto LABEL_27;
      v9->_customType = a2;
LABEL_26:
      objc_setProperty_atomic(p_super, v10, v4, 16);
      LOBYTE(p_super[1].isa) = 1;
LABEL_27:
      if ((-[NSObject parsePayloadData](p_super, "parsePayloadData") & 1) != 0)
        goto LABEL_32;
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = p_super;
        _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to parse payload data for %@", (uint8_t *)&v17, 0xCu);
      }

      goto LABEL_31;
  }
}

- (id)copyPayloadData
{
  const char *v2;

  if (a1 && objc_msgSend(a1, "generatePayloadData"))
    return objc_getProperty(a1, v2, 16, 1);
  else
    return 0;
}

@end
