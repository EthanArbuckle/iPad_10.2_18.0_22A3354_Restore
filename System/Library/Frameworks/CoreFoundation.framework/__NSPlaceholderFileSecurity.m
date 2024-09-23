@implementation __NSPlaceholderFileSecurity

- (__NSPlaceholderFileSecurity)initWithFileSec:(_filesec *)a3
{
  if (self == (__NSPlaceholderFileSecurity *)&___immutablePlaceholderFileSecurity)
    return (__NSPlaceholderFileSecurity *)+[__NSFileSecurity __new:](__NSFileSecurity, "__new:", a3);
  else
    return 0;
}

+ (id)immutablePlaceholder
{
  return &___immutablePlaceholderFileSecurity;
}

- (__NSPlaceholderFileSecurity)init
{
  __NSPlaceholderFileSecurity *result;

  result = (__NSPlaceholderFileSecurity *)filesec_init();
  if (result)
    return -[__NSPlaceholderFileSecurity initWithFileSec:](self, "initWithFileSec:", result);
  return result;
}

- (unint64_t)retainCount
{
  return -1;
}

- (__NSPlaceholderFileSecurity)initWithCoder:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  size_t v7;
  __objc2_class **v8;
  CFIndex v9;
  CFErrorRef v10;
  __NSPlaceholderFileSecurity *v11;
  const void *v13;
  _QWORD *v14;
  _QWORD *v15;
  _filesec *v16;
  _filesec *v17;
  int v18;
  void *obj_p;
  size_t size;
  _BYTE v21[1096];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {

    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), CFSTR("FileSecurity cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = CFSTR("NSCocoaErrorDomain");
  size = 0;
  v6 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NS.filesec"), &size);
  if (!v6)
  {
    v8 = &off_1E1488B70;
    v9 = 4865;
    goto LABEL_6;
  }
  v7 = size;
  if (size - 10313 < 0xFFFFFFFFFFFFD7FFLL)
  {
    v8 = &off_1E1488B98;
    v9 = 4864;
LABEL_6:

    v10 = CFErrorCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v5, v9, (CFDictionaryRef)v8);
    objc_msgSend(a3, "failWithError:", CFAutorelease(v10));
    return 0;
  }
  v13 = (const void *)v6;
  if (size < 0x449)
  {
    v15 = v21;
  }
  else
  {
    v14 = malloc_type_malloc(size, 0x7B064E45uLL);
    if (!v14)
    {
      v5 = CFSTR("NSPOSIXErrorDomain");
      v9 = *__error();
      v8 = &off_1E1488BC0;
      goto LABEL_6;
    }
    v15 = v14;
    v7 = size;
  }
  memcpy(v15, v13, v7);
  v16 = filesec_init();
  v17 = v16;
  if (!v16)
  {
    v5 = CFSTR("NSPOSIXErrorDomain");
    v11 = 0;
    v9 = *__error();
    v8 = &off_1E1488BE8;
    goto LABEL_45;
  }
  v18 = *(_DWORD *)v15;
  if ((*(_DWORD *)v15 & 1) != 0)
  {
    LODWORD(obj_p) = v15[1];
    if (filesec_set_property(v16, FILESEC_OWNER, &obj_p))
    {
      v5 = CFSTR("NSPOSIXErrorDomain");
      v11 = 0;
      v9 = *__error();
      v8 = &off_1E1488C10;
      goto LABEL_45;
    }
    v18 = *(_DWORD *)v15;
  }
  if ((v18 & 2) != 0)
  {
    LODWORD(obj_p) = v15[2];
    if (filesec_set_property(v17, FILESEC_GROUP, &obj_p))
    {
      v5 = CFSTR("NSPOSIXErrorDomain");
      v11 = 0;
      v9 = *__error();
      v8 = &off_1E1488C38;
      goto LABEL_45;
    }
    v18 = *(_DWORD *)v15;
  }
  if ((v18 & 0x10) != 0)
  {
    LOWORD(obj_p) = v15[3];
    if (filesec_set_property(v17, FILESEC_MODE, &obj_p))
    {
      v5 = CFSTR("NSPOSIXErrorDomain");
      v11 = 0;
      v9 = *__error();
      v8 = &off_1E1488C60;
      goto LABEL_45;
    }
    v18 = *(_DWORD *)v15;
  }
  if ((v18 & 4) != 0)
  {
    if (filesec_set_property(v17, FILESEC_UUID, v15 + 4))
    {
      v5 = CFSTR("NSPOSIXErrorDomain");
      v11 = 0;
      v9 = *__error();
      v8 = &off_1E1488C88;
      goto LABEL_45;
    }
    v18 = *(_DWORD *)v15;
  }
  if ((v18 & 8) != 0)
  {
    if (filesec_set_property(v17, FILESEC_GRPUUID, v15 + 6))
    {
      v5 = CFSTR("NSPOSIXErrorDomain");
      v11 = 0;
      v9 = *__error();
      v8 = &off_1E1488CB0;
      goto LABEL_45;
    }
    v18 = *(_DWORD *)v15;
  }
  if ((v18 & 0x20) == 0)
    goto LABEL_36;
  obj_p = 0;
  if (!memchr(v15 + 8, 0, size - 64))
  {
    v8 = &off_1E1488CD8;
LABEL_43:
    v9 = 4864;
    goto LABEL_44;
  }
  obj_p = acl_from_text((const char *)v15 + 64);
  if (!obj_p)
  {
    v8 = &off_1E1488D00;
    goto LABEL_43;
  }
  if (!filesec_set_property(v17, FILESEC_ACL, &obj_p))
  {
    acl_free(obj_p);
LABEL_36:
    v11 = -[__NSPlaceholderFileSecurity initWithFileSec:](self, "initWithFileSec:", v17, obj_p);
    v8 = &off_1E1488B48;
    v9 = 4864;
    goto LABEL_45;
  }
  v5 = CFSTR("NSPOSIXErrorDomain");
  v9 = *__error();
  v8 = &off_1E1488D28;
LABEL_44:
  v11 = 0;
LABEL_45:
  if (v15 != (_QWORD *)v21)
    free(v15);
  if (!v11)
  {
    if (v17)
      filesec_free(v17);
    goto LABEL_6;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSFileSecurity");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized FileSecurity object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v5;
  uint64_t v6;
  NSException *v7;

  v5 = __CFLookUpClass("NSFileSecurity");
  v6 = __CFFullMethodName(v5, (objc_class *)self, a2);
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %@: method sent to an uninitialized FileSecurity object"), v6);
  v7 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0);
  objc_exception_throw(v7);
}

@end
