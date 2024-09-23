@implementation CKObjCType

- (unint64_t)size
{
  unint64_t code;

  code = self->_code;
  if (code > 0x18)
    return 0;
  else
    return qword_18A83D508[code];
}

+ (id)typeForEncoding:(const char *)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __CKDynamicObjCType *v11;
  const char *v12;
  uint64_t v13;
  CKObjCType *v14;
  const char *v15;
  uint64_t v16;
  CKObjCType *v17;
  const char *v18;
  uint64_t v19;
  CKObjCType *v20;
  const char *v21;
  uint64_t v22;
  __CKDynamicObjCType *v23;
  const char *v24;
  CKObjCType *v25;
  const char *v26;
  uint64_t v27;
  __CKDynamicObjCType *v28;
  const char *v29;
  CKObjCType *v30;
  const char *v31;
  uint64_t v32;
  CKObjCType *v33;
  const char *v34;
  uint64_t v35;
  CKObjCType *v36;
  const char *v37;
  uint64_t v38;
  CKObjCType *v39;
  const char *v40;
  uint64_t v41;
  CKObjCType *v42;
  const char *v43;
  uint64_t v44;
  CKObjCType *v45;
  const char *v46;
  uint64_t v47;
  CKObjCType *v48;
  const char *v49;
  uint64_t v50;
  CKObjCType *v51;
  const char *v52;
  uint64_t v53;
  CKObjCType *v54;
  const char *v55;
  uint64_t v56;
  __CKDynamicObjCType *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  NSString *v67;
  __CKClassObjCType *v68;
  Class v69;
  const char *v70;
  void *v71;
  CKObjCType *v72;
  const char *v73;
  uint64_t v74;
  CKObjCType *v75;
  const char *v76;
  uint64_t v77;
  CKObjCType *v78;
  const char *v79;
  uint64_t v80;
  __CKDynamicObjCType *v81;
  const char *v82;
  CKObjCType *v83;
  const char *v84;
  uint64_t v85;
  __CKDynamicObjCType *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  CKObjCType *v90;
  const char *v91;
  uint64_t v92;
  CKObjCType *v93;
  const char *v94;
  uint64_t v95;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = *a3;
  if (v10 > 90)
  {
    switch(*a3)
    {
      case '^':
        v11 = [__CKDynamicObjCType alloc];
        v13 = objc_msgSend_initWithCode_encoding_(v11, v12, 22, (uint64_t)v9);
        goto LABEL_48;
      case '_':
      case 'a':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 't':
      case 'u':
        goto LABEL_32;
      case 'b':
        v28 = [__CKDynamicObjCType alloc];
        v13 = objc_msgSend_initWithCode_encoding_(v28, v29, 21, (uint64_t)v9);
        goto LABEL_48;
      case 'c':
        v30 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v30, v31, 0, v32);
        goto LABEL_48;
      case 'd':
        v33 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v33, v34, 11, v35);
        goto LABEL_48;
      case 'f':
        v36 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v36, v37, 10, v38);
        goto LABEL_48;
      case 'i':
        v39 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v39, v40, 2, v41);
        goto LABEL_48;
      case 'l':
        v42 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v42, v43, 3, v44);
        goto LABEL_48;
      case 'q':
        v45 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v45, v46, 4, v47);
        goto LABEL_48;
      case 's':
        v48 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v48, v49, 1, v50);
        goto LABEL_48;
      case 'v':
        v51 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v51, v52, 13, v53);
        goto LABEL_48;
      default:
        if (v10 == 91)
        {
          v86 = [__CKDynamicObjCType alloc];
          v13 = objc_msgSend_initWithCode_encoding_(v86, v87, 18, (uint64_t)v9);
        }
        else
        {
          if (v10 != 123)
            goto LABEL_32;
          v23 = [__CKDynamicObjCType alloc];
          v13 = objc_msgSend_initWithCode_encoding_(v23, v24, 19, (uint64_t)v9);
        }
        break;
    }
    goto LABEL_48;
  }
  if (v10 > 72)
  {
    if (v10 > 80)
    {
      if (v10 == 81)
      {
        v83 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v83, v84, 9, v85);
        goto LABEL_48;
      }
      if (v10 == 83)
      {
        v25 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v25, v26, 6, v27);
        goto LABEL_48;
      }
    }
    else
    {
      if (v10 == 73)
      {
        v75 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v75, v76, 7, v77);
        goto LABEL_48;
      }
      if (v10 == 76)
      {
        v17 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v17, v18, 8, v19);
        goto LABEL_48;
      }
    }
LABEL_32:
    v57 = [__CKDynamicObjCType alloc];
    v13 = objc_msgSend_initWithCode_encoding_(v57, v58, 23, (uint64_t)v9);
    goto LABEL_48;
  }
  if (v10 <= 57)
  {
    switch(v10)
    {
      case '#':
        v78 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v78, v79, 16, v80);
        goto LABEL_48;
      case '(':
        v81 = [__CKDynamicObjCType alloc];
        v13 = objc_msgSend_initWithCode_encoding_(v81, v82, 20, (uint64_t)v9);
        goto LABEL_48;
      case '*':
        v20 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v20, v21, 14, v22);
        goto LABEL_48;
    }
    goto LABEL_32;
  }
  switch(*a3)
  {
    case ':':
      v14 = [CKObjCType alloc];
      v13 = objc_msgSend_initWithCode_(v14, v15, 17, v16);
      break;
    case '@':
      if ((unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 4
        && objc_msgSend_characterAtIndex_(v9, v59, 1, v61) == 34)
      {
        v62 = objc_msgSend_length(v9, v59, v60, v61);
        if (objc_msgSend_characterAtIndex_(v9, v63, v62 - 1, v64) == 34)
        {
          v65 = objc_msgSend_length(v9, v59, v60, v61);
          objc_msgSend_substringWithRange_(v9, v66, 2, v65 - 3);
          v67 = (NSString *)objc_claimAutoreleasedReturnValue();
          v68 = [__CKClassObjCType alloc];
          v69 = NSClassFromString(v67);
          v71 = (void *)objc_msgSend_initWithCode_encoding_class_(v68, v70, 15, (uint64_t)v9, v69);

          goto LABEL_49;
        }
      }
      if ((unint64_t)objc_msgSend_length(v9, v59, v60, v61) >= 2
        && objc_msgSend_characterAtIndex_(v9, v88, 1, v89) == 63)
      {
        v90 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v90, v91, 24, v92);
      }
      else
      {
        v93 = [CKObjCType alloc];
        v13 = objc_msgSend_initWithCode_(v93, v94, 15, v95);
      }
      break;
    case 'B':
      v72 = [CKObjCType alloc];
      v13 = objc_msgSend_initWithCode_(v72, v73, 12, v74);
      break;
    case 'C':
      v54 = [CKObjCType alloc];
      v13 = objc_msgSend_initWithCode_(v54, v55, 5, v56);
      break;
    default:
      goto LABEL_32;
  }
LABEL_48:
  v71 = (void *)v13;
LABEL_49:

  return v71;
}

+ (id)typeForValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_objCType(a3, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_typeForEncoding_(CKObjCType, v5, v4, v6);
}

- (CKObjCType)initWithCode:(int64_t)a3
{
  CKObjCType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKObjCType;
  result = -[CKObjCType init](&v5, sel_init);
  if (result)
    result->_code = a3;
  return result;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encoding(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("<CKObjCType %p: %@ (%@)>"), v12, self, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)encoding
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v8 = objc_msgSend_code(self, a2, v2, v3);
  v9 = CFSTR("?");
  switch(v8)
  {
    case 0:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"c", v7);
      goto LABEL_20;
    case 1:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"s", v7);
      goto LABEL_20;
    case 2:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"i", v7);
      goto LABEL_20;
    case 3:
    case 4:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"q", v7);
      goto LABEL_20;
    case 5:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"C", v7);
      goto LABEL_20;
    case 6:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"S", v7);
      goto LABEL_20;
    case 7:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"I", v7);
      goto LABEL_20;
    case 8:
    case 9:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"Q", v7);
      goto LABEL_20;
    case 10:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"f", v7);
      goto LABEL_20;
    case 11:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"d", v7);
      goto LABEL_20;
    case 12:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"B", v7);
      goto LABEL_20;
    case 13:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"v", v7);
      goto LABEL_20;
    case 14:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"^v", v7);
      goto LABEL_20;
    case 15:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"@", v7);
      goto LABEL_20;
    case 16:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"#", v7);
      goto LABEL_20;
    case 17:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)":", v7);
      goto LABEL_20;
    case 22:
      return (NSString *)v9;
    case 24:
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"@?", v7);
LABEL_20:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99768];
      v12 = objc_msgSend_code(self, v5, v6, v7);
      objc_msgSend_raise_format_(v10, v13, v11, (uint64_t)CFSTR("Unable to determine encoding for type %zd"), v12);
      v9 = CFSTR("?");
      break;
  }
  return (NSString *)v9;
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;

  v5 = objc_msgSend_code(self, a2, v2, v3);
  if (v5 < 0x19)
    return &off_1E1F65C80[v5]->isa;
  v10 = (void *)MEMORY[0x1E0C99DA0];
  v11 = *MEMORY[0x1E0C99768];
  v12 = objc_msgSend_code(self, v6, v7, v8);
  objc_msgSend_raise_format_(v10, v13, v11, (uint64_t)CFSTR("Unable to determine name for type %zd"), v12);
  return (NSString *)CFSTR("unknown");
}

- (unint64_t)flags
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v4 = objc_msgSend_code(self, a2, v2, v3);
  if (v4 > 0x18)
    return 0;
  else
    return qword_18A83D440[v4];
}

- (NSString)className
{
  return 0;
}

- (int64_t)code
{
  return self->_code;
}

@end
