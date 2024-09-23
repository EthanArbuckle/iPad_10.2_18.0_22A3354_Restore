@implementation NSXPCStoreConnectionInfo

- (id)persistentStoreCoordinator
{
  return -[NSXPCStoreServerPerConnectionCache coordinator](self->_cache, "coordinator");
}

- (id)entitlements
{
  return self->_entitlements;
}

- (id)initForToken:(id *)a3 entitlementNames:(id)a4 cache:(id)a5
{
  char *v8;
  _QWORD *v9;
  __int128 v10;
  const __CFAllocator **v11;
  const __CFAllocator *v12;
  __int128 v13;
  __SecTask *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __SecTask *v21;
  CFDictionaryRef v22;
  audit_token_t token;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)NSXPCStoreConnectionInfo;
  v8 = -[NSXPCStoreConnectionInfo init](&v25, sel_init);
  v9 = v8;
  if (!v8)
    return v9;
  *((_DWORD *)v8 + 16) = 0;
  v10 = *(_OWORD *)a3->var0;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a3->var0[4];
  v11 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
  *(_OWORD *)(v8 + 24) = v10;
  v12 = *v11;
  v13 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v13;
  v14 = SecTaskCreateWithAuditToken(v12, &token);
  v21 = v14;
  *(_QWORD *)token.val = 0;
  if (!a4)
  {
    if (v9[1])
      goto LABEL_5;
    goto LABEL_4;
  }
  v22 = SecTaskCopyValuesForEntitlements(v14, (CFArrayRef)a4, (CFErrorRef *)&token);
  v9[1] = v22;
  if (!v22)
LABEL_4:
    v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
LABEL_5:
  if (*(_QWORD *)token.val)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Error while copying values for entitlements, %@"), v15, v16, v17, v18, v19, v20, *(uint64_t *)token.val);
    CFRelease(*(CFTypeRef *)token.val);
  }
  CFRelease(v21);
  v9[2] = a5;
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->_userInfo = 0;
  self->_entitlements = 0;

  self->_cache = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreConnectionInfo;
  -[NSXPCStoreConnectionInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSXPCStoreServerConnectionInfo: \n\tentitlements = %@ ;\n\tcoordinator = %@ ;\n\tuserInfo = %@>"),
               self->_entitlements,
               -[NSXPCStoreServerPerConnectionCache coordinator](self->_cache, "coordinator"),
               self->_userInfo);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (id)userInfo
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_userInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

@end
