@implementation __NSFileSecurity

+ (id)__new:(_filesec *)a3
{
  id result;

  result = __CFAllocateObject((objc_class *)a1, 0);
  *((_QWORD *)result + 1) = a3;
  return result;
}

- (_filesec)_filesec
{
  return self->_filesec;
}

- (void)dealloc
{
  _filesec *filesec;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  filesec = self->_filesec;
  if (filesec)
    filesec_free(filesec);
  v4.receiver = self;
  v4.super_class = (Class)__NSFileSecurity;
  -[__NSFileSecurity dealloc](&v4, sel_dealloc);
}

- (BOOL)getOwner:(unsigned int *)a3
{
  int property;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  property = filesec_get_property(self->_filesec, FILESEC_OWNER, &v6);
  if (!property)
    *a3 = v6;
  return property == 0;
}

- (BOOL)getMode:(unsigned __int16 *)a3
{
  int property;
  unsigned __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  property = filesec_get_property(self->_filesec, FILESEC_MODE, &v6);
  if (!property)
    *a3 = v6;
  return property == 0;
}

- (BOOL)getGroup:(unsigned int *)a3
{
  int property;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  property = filesec_get_property(self->_filesec, FILESEC_GROUP, &v6);
  if (!property)
    *a3 = v6;
  return property == 0;
}

- (BOOL)copyAccessControlList:(_acl *)a3
{
  int property;
  _acl *v5;
  acl_t acl[2];

  acl[1] = *(acl_t *)MEMORY[0x1E0C80C00];
  acl[0] = 0;
  property = filesec_get_property(self->_filesec, FILESEC_ACL, acl);
  if (!property)
  {
    v5 = acl_dup(acl[0]);
    *a3 = v5;
    if (v5)
      acl_free(acl[0]);
    else
      *a3 = acl[0];
  }
  return property == 0;
}

- (BOOL)setOwner:(unsigned int)a3
{
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_OWNER, &v4) == 0;
}

- (BOOL)setGroup:(unsigned int)a3
{
  unsigned int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_GROUP, &v4) == 0;
}

- (BOOL)setMode:(unsigned __int16)a3
{
  unsigned __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  return filesec_set_property(self->_filesec, FILESEC_MODE, &v4) == 0;
}

- (BOOL)getOwnerUUID:(unsigned __int8 *)(a3
{
  int property;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0uLL;
  property = filesec_get_property(self->_filesec, FILESEC_UUID, &v6);
  if (!property)
    *(_OWORD *)a3 = v6;
  return property == 0;
}

- (BOOL)setOwnerUUID:(unsigned __int8)a3[16]
{
  return filesec_set_property(self->_filesec, FILESEC_UUID, a3) == 0;
}

- (BOOL)getGroupUUID:(unsigned __int8 *)(a3
{
  int property;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0uLL;
  property = filesec_get_property(self->_filesec, FILESEC_GRPUUID, &v6);
  if (!property)
    *(_OWORD *)a3 = v6;
  return property == 0;
}

- (BOOL)setGroupUUID:(unsigned __int8)a3[16]
{
  return filesec_set_property(self->_filesec, FILESEC_GRPUUID, a3) == 0;
}

- (BOOL)setAccessControlList:(_acl *)a3
{
  _filesec *filesec;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  filesec = self->_filesec;
  v7[0] = a3;
  v4 = v7;
  if (!a3)
    v4 = 0;
  if (a3 == (_acl *)1)
    v5 = 1;
  else
    v5 = (uint64_t)v4;
  return filesec_set_property(filesec, FILESEC_ACL, (const void *)v5) == 0;
}

- (BOOL)clearProperties:(unint64_t)a3
{
  char v3;
  BOOL v5;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    v5 = filesec_unset_property(self->_filesec, FILESEC_OWNER) == 0;
    if ((v3 & 2) == 0)
      goto LABEL_7;
  }
  else
  {
    v5 = 1;
    if ((a3 & 2) == 0)
      goto LABEL_7;
  }
  if (filesec_unset_property(self->_filesec, FILESEC_GROUP))
    v5 = 0;
LABEL_7:
  if ((v3 & 4) != 0)
  {
    if (filesec_unset_property(self->_filesec, FILESEC_MODE))
      v5 = 0;
    if ((v3 & 8) == 0)
    {
LABEL_9:
      if ((v3 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_20;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_9;
  }
  if (filesec_unset_property(self->_filesec, FILESEC_UUID))
    v5 = 0;
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x20) == 0)
      return v5;
    goto LABEL_11;
  }
LABEL_20:
  if (filesec_unset_property(self->_filesec, FILESEC_GRPUUID))
    v5 = 0;
  if ((v3 & 0x20) != 0)
  {
LABEL_11:
    if (filesec_unset_property(self->_filesec, FILESEC_ACL))
      return 0;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  _filesec *v3;
  _filesec *v4;
  _QWORD v6[2];
  void *obj_p;
  __int16 v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (unint64_t)self;
  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[__NSFileSecurity _filesec](self, "_filesec");
  if (v3)
  {
    v4 = v3;
    v10[0] = 0;
    v9[0] = 0;
    v9[1] = 0;
    v8 = 0;
    v6[1] = 0;
    obj_p = 0;
    v6[0] = 0;
    if (filesec_get_property(v3, FILESEC_OWNER, (char *)v10 + 4))
      v2 = 1;
    else
      v2 = 3;
    if (!filesec_get_property(v4, FILESEC_GROUP, v10))
      v2 |= 4uLL;
    if (!filesec_get_property(v4, FILESEC_UUID, v9))
      v2 |= 8uLL;
    if (!filesec_get_property(v4, FILESEC_MODE, &v8))
      v2 |= 0x10uLL;
    if (!filesec_get_property(v4, FILESEC_ACL, &obj_p))
    {
      acl_free(obj_p);
      v2 |= 0x20uLL;
    }
    if (!filesec_get_property(v4, FILESEC_GRPUUID, v6))
      v2 |= 0x40uLL;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  _filesec *v5;
  uint64_t v6;
  _filesec *v7;
  int property;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  char *v20;
  char *v21;
  char *v22;
  BOOL v23;
  ssize_t v24;
  ssize_t len_p;
  acl_t v26;
  uint64_t v27;
  acl_t acl;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self == a3)
    return 1;
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[__NSFileSecurity _filesec](self, "_filesec");
  v6 = objc_msgSend(a3, "_filesec");
  v7 = (_filesec *)v6;
  if (!v5 || !v6)
    return ((unint64_t)v5 | v6) == 0;
  LODWORD(acl) = 0;
  LODWORD(v26) = 0;
  property = filesec_get_property(v5, FILESEC_OWNER, &acl);
  if ((property == 0) == (filesec_get_property(v7, FILESEC_OWNER, &v26) != 0)
    || !property && (_DWORD)acl != (_DWORD)v26)
  {
    return 0;
  }
  LODWORD(acl) = 0;
  LODWORD(v26) = 0;
  v9 = filesec_get_property(v5, FILESEC_GROUP, &acl);
  if ((v9 == 0) == (filesec_get_property(v7, FILESEC_GROUP, &v26) != 0) || !v9 && (_DWORD)acl != (_DWORD)v26)
    return 0;
  LOWORD(acl) = 0;
  LOWORD(v26) = 0;
  v10 = filesec_get_property(v5, FILESEC_MODE, &acl);
  if ((v10 == 0) == (filesec_get_property(v7, FILESEC_MODE, &v26) != 0)
    || !v10 && (unsigned __int16)acl != (unsigned __int16)v26)
  {
    return 0;
  }
  acl = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v11 = filesec_get_property(v5, FILESEC_UUID, &acl);
  if ((v11 == 0) == (filesec_get_property(v7, FILESEC_UUID, &v26) != 0))
    return 0;
  if (!v11 && (acl != v26 || v29 != v27))
    return 0;
  acl = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v12 = filesec_get_property(v5, FILESEC_GRPUUID, &acl);
  if ((v12 == 0) == (filesec_get_property(v7, FILESEC_GRPUUID, &v26) != 0))
    return 0;
  if (!v12 && (acl != v26 || v29 != v27))
    return 0;
  acl = 0;
  v26 = 0;
  v13 = filesec_get_property(v5, FILESEC_ACL, &acl);
  v14 = filesec_get_property(v7, FILESEC_ACL, &v26);
  v15 = v14;
  if (v14 | v13)
  {
    v16 = (v13 == 0) == (v14 == 0);
    if (v13)
      goto LABEL_47;
    goto LABEL_46;
  }
  v24 = 0;
  len_p = 0;
  v20 = acl_to_text(acl, &len_p);
  v21 = acl_to_text(v26, &v24);
  v22 = v21;
  if (v20 && v21)
  {
    v23 = len_p == v24 && memcmp(v20, v21, len_p) == 0;
    goto LABEL_43;
  }
  v23 = 0;
  v16 = 0;
  if (v20)
  {
LABEL_43:
    acl_free(v20);
    v16 = v23;
  }
  if (v22)
    acl_free(v22);
LABEL_46:
  acl_free(acl);
LABEL_47:
  if (!v15)
    acl_free(v26);
  return v16;
}

- (id)description
{
  _filesec *v3;
  _filesec *v4;
  int property;
  int v6;
  int v7;
  int v8;
  int v9;
  CFUUIDRef v10;
  const __CFString *v11;
  CFStringRef v12;
  char *v13;
  char *v14;
  CFStringRef v15;
  int v16;
  CFStringRef v17;
  CFStringRef v18;
  CFStringRef v19;
  id result;
  const __CFString *v21;
  int v22;
  CFUUIDRef cf;
  int v24;
  ssize_t len_p;
  acl_t acl;
  CFUUIDBytes v27;
  CFUUIDBytes v28;
  unsigned __int16 v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = -[__NSFileSecurity _filesec](self, "_filesec");
  v4 = v3;
  if (!v3)
  {
LABEL_47:
    result = (id)CFStringCreateWithFormat(0, 0, CFSTR("<FileSecurity %p> [%p]"), self, v4);
    if (!result)
      return result;
    return (id)_CFAutoreleasePoolAddObject();
  }
  v30[0] = 0;
  v29 = 0;
  *(_QWORD *)&v28.byte0 = 0;
  *(_QWORD *)&v28.byte8 = 0;
  *(_QWORD *)&v27.byte0 = 0;
  *(_QWORD *)&v27.byte8 = 0;
  acl = 0;
  property = filesec_get_property(v3, FILESEC_OWNER, (char *)v30 + 4);
  v6 = filesec_get_property(v4, FILESEC_GROUP, v30);
  v24 = filesec_get_property(v4, FILESEC_MODE, &v29);
  v7 = filesec_get_property(v4, FILESEC_UUID, &v28);
  v8 = filesec_get_property(v4, FILESEC_GRPUUID, &v27);
  v9 = filesec_get_property(v4, FILESEC_ACL, &acl);
  v10 = 0;
  if (v7)
  {
    if (v8)
    {
LABEL_4:
      cf = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = CFUUIDCreateFromUUIDBytes(0, v28);
    if (v8)
      goto LABEL_4;
  }
  cf = CFUUIDCreateFromUUIDBytes(0, v27);
LABEL_7:
  v22 = v9;
  if (v9)
  {
    v21 = 0;
    v11 = CFSTR("(null)");
    if (property)
    {
LABEL_9:
      v12 = CFSTR("(null)");
      goto LABEL_20;
    }
  }
  else
  {
    if (acl == (acl_t)1)
    {
      v11 = CFSTR("_FILESEC_REMOVE_ACL");
    }
    else
    {
      len_p = 0;
      v13 = acl_to_text(acl, &len_p);
      if (v13)
      {
        v14 = v13;
        v15 = CFStringCreateWithBytes(0, (const UInt8 *)v13, len_p, 0x8000100u, 0);
        acl_free(v14);
      }
      else
      {
        v15 = 0;
      }
      if (v15)
        v11 = v15;
      else
        v11 = CFSTR("(acl_to_text failed)");
    }
    v21 = v11;
    if (property)
      goto LABEL_9;
  }
  v12 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), HIDWORD(v30[0]));
LABEL_20:
  v16 = v6;
  if (v6)
    v17 = CFSTR("(null)");
  else
    v17 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), LODWORD(v30[0]));
  if (v24)
    v18 = CFSTR("(null)");
  else
    v18 = CFStringCreateWithFormat(0, 0, CFSTR("%d"), v29);
  v19 = 0;
  if (v12 && v17 && v18)
    v19 = CFStringCreateWithFormat(0, 0, CFSTR("<FileSecurity %p> [%p] {FILESEC_OWNER = %@, FILESEC_GROUP = %@, FILESEC_MODE = %@, FILESEC_UUID = %@, FILESEC_GRPUUID = %@, FILESEC_ACL = %@}"), self, v4, v12, v17, v18, v10, cf, v11, v21);
  if (!property && v12)
    CFRelease(v12);
  if (!v16 && v17)
    CFRelease(v17);
  if (!v24 && v18)
    CFRelease(v18);
  if (v10)
    CFRelease(v10);
  if (cf)
    CFRelease(cf);
  if (v22)
  {
    if (!v19)
      goto LABEL_47;
  }
  else
  {
    acl_free(acl);
    CFRelease(v21);
    if (!v19)
      goto LABEL_47;
  }
  return (id)_CFAutoreleasePoolAddObject();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = filesec_dup(-[__NSFileSecurity _filesec](self, "_filesec"));
  if (result)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFileSec:", result);
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[__NSPlaceholderFileSecurity immutablePlaceholder](__NSPlaceholderFileSecurity, "immutablePlaceholder", a3);
}

- (void)encodeWithCoder:(id)a3
{
  _filesec *v5;
  uint64_t Typed;
  char *v7;
  size_t v8;
  char *v9;
  char *v10;
  char *v11;
  unsigned __int16 v12;
  uint64_t v13;
  acl_t acl;
  ssize_t len_p[2];

  len_p[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidArgumentException"), CFSTR("NSFileSecurity cannot be encoded by non-keyed archivers"), 0));
  v5 = -[__NSFileSecurity _filesec](self, "_filesec");
  acl = 0;
  len_p[0] = 0;
  if (filesec_get_property(v5, FILESEC_ACL, &acl))
  {
    Typed = CFAllocatorAllocateTyped(&__kCFAllocatorSystemDefault, 72, 2422924720, 0);
    if (!Typed)
      return;
    v7 = (char *)Typed;
    *(_QWORD *)(Typed + 64) = 0;
    *(_OWORD *)(Typed + 32) = 0u;
    *(_OWORD *)(Typed + 48) = 0u;
    *(_OWORD *)Typed = 0u;
    *(_OWORD *)(Typed + 16) = 0u;
    *(_DWORD *)Typed = 0;
    v8 = 72;
    *(_BYTE *)(Typed + 64) = 0;
    goto LABEL_8;
  }
  v9 = acl_to_text(acl, len_p);
  if (!v9)
  {
LABEL_20:
    acl_free(acl);
    return;
  }
  v10 = v9;
  v8 = len_p[0] + 65;
  v11 = (char *)CFAllocatorAllocateTyped(&__kCFAllocatorSystemDefault, len_p[0] + 65, 1988560932, 0);
  if (!v11)
  {
    free(v10);
    goto LABEL_20;
  }
  v7 = v11;
  bzero(v11, v8);
  *(_DWORD *)v7 = 0;
  strlcpy(v7 + 64, v10, len_p[0] + 1);
  *(_DWORD *)v7 |= 0x20u;
  free(v10);
  acl_free(acl);
LABEL_8:
  v13 = 0;
  v12 = 0;
  if (!filesec_get_property(v5, FILESEC_OWNER, (char *)&v13 + 4))
  {
    *((_QWORD *)v7 + 1) = HIDWORD(v13);
    *(_DWORD *)v7 |= 1u;
  }
  if (!filesec_get_property(v5, FILESEC_GROUP, &v13))
  {
    *((_QWORD *)v7 + 2) = v13;
    *(_DWORD *)v7 |= 2u;
  }
  if (!filesec_get_property(v5, FILESEC_MODE, &v12))
  {
    *((_QWORD *)v7 + 3) = v12;
    *(_DWORD *)v7 |= 0x10u;
  }
  if (!filesec_get_property(v5, FILESEC_UUID, v7 + 32))
    *(_DWORD *)v7 |= 4u;
  if (!filesec_get_property(v5, FILESEC_GRPUUID, v7 + 48))
    *(_DWORD *)v7 |= 8u;
  objc_msgSend(a3, "encodeBytes:length:forKey:", v7, v8, CFSTR("NS.filesec"));
  CFAllocatorDeallocate((CFAllocatorRef)&__kCFAllocatorSystemDefault, v7);
}

- (__NSFileSecurity)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
