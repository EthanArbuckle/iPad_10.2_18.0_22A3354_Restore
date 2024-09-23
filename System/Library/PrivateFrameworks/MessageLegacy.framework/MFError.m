@implementation MFError

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5
{
  return (MFError *)objc_msgSend(a1, "errorWithDomain:code:localizedDescription:title:userInfo:", a3, a4, a5, 0, 0);
}

+ (MFError)errorWithDomain:(id)a3 code:(int64_t)a4 localizedDescription:(id)a5 title:(id)a6 userInfo:(id)a7
{
  MFError *v13;
  __CFDictionary *MutableCopy;
  __CFDictionary *v15;
  NSObject *v16;

  if (!a3)
    return 0;
  if (!((unint64_t)a5 | (unint64_t)a6))
    return (MFError *)objc_msgSend(a1, "errorWithDomain:code:userInfo:", a3, a4, a7);
  if (a7)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)a7);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v15 = MutableCopy;
  if (a5)
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E0CB2D50], a5);
  if (a6)
    CFDictionarySetValue(v15, CFSTR("_MFShortDescription"), a6);
  v13 = (MFError *)objc_msgSend(a1, "errorWithDomain:code:localizedDescription:title:userInfo:", a3, a4, 0, 0, v15);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("MFNoErrorLog")) & 1) == 0)
  {
    v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[MFError errorWithDomain:code:localizedDescription:title:userInfo:].cold.1(v13, v16);
  }

  return v13;
}

- (MFError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  objc_super v10;

  if (initWithDomain_code_userInfo__onceToken != -1)
    dispatch_once(&initWithDomain_code_userInfo__onceToken, &__block_literal_global_13);
  v10.receiver = self;
  v10.super_class = (Class)MFError;
  return -[MFError initWithDomain:code:userInfo:](&v10, sel_initWithDomain_code_userInfo_, a3, a4, a5);
}

uint64_t __40__MFError_initWithDomain_code_userInfo___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "ef_setDecoder:forDomain:", &__block_literal_global_11, CFSTR("MFMessageErrorDomain"));
}

__CFString *__40__MFError_initWithDomain_code_userInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((a2 - 1028) >= 0x20)
    return (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown Error Code %d"), a2);
  else
    return off_1E81CB138[(int)a2 - 1028];
}

+ (MFError)errorWithException:(id)a3
{
  return (MFError *)objc_msgSend(a1, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1029, objc_msgSend(a3, "reason"));
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  _setUserInfoObjectForKey((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)userInfo
{
  id v3;
  NSMutableDictionary *moreUserInfo;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFError;
  v3 = -[MFError userInfo](&v7, sel_userInfo);
  moreUserInfo = self->_moreUserInfo;
  if (moreUserInfo)
  {
    if (v3)
    {
      v5 = (id)-[NSMutableDictionary mutableCopyWithZone:](moreUserInfo, "mutableCopyWithZone:", 0);
      objc_msgSend(v5, "addEntriesFromDictionary:", v3);
      return v5;
    }
    else
    {
      return (id)-[NSMutableDictionary copyWithZone:](moreUserInfo, "copyWithZone:", 0);
    }
  }
  return v3;
}

- (id)localizedDescription
{
  id result;
  objc_super v4;

  result = (id)-[NSMutableDictionary objectForKey:](self->_moreUserInfo, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFError;
    return -[MFError localizedDescription](&v4, sel_localizedDescription);
  }
  return result;
}

- (id)recoveryAttempter
{
  id v2;
  NSString *v3;

  v2 = -[MFError userInfo](self, "userInfo");
  v3 = (NSString *)(id)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CB3148]);
  if (!v3)
  {
    v3 = (NSString *)objc_msgSend(v2, "objectForKey:", CFSTR("RecoveryAttemptorClassName"));
    if (v3)
      v3 = (NSString *)objc_alloc_init(NSClassFromString(v3));
  }
  return v3;
}

- (id)mf_moreInfo
{
  id result;
  objc_super v4;

  result = (id)-[NSMutableDictionary objectForKey:](self->_moreUserInfo, "objectForKey:", CFSTR("_MFMoreInfo"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFError;
    return -[NSError mf_moreInfo](&v4, sel_mf_moreInfo);
  }
  return result;
}

- (id)mf_shortDescription
{
  id result;
  objc_super v4;

  result = (id)-[NSMutableDictionary objectForKey:](self->_moreUserInfo, "objectForKey:", CFSTR("_MFShortDescription"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)MFError;
    return -[NSError mf_shortDescription](&v4, sel_mf_shortDescription);
  }
  return result;
}

- (void)setLocalizedDescription:(id)a3
{
  _setUserInfoObjectForKey((uint64_t)self, (uint64_t)a3, *MEMORY[0x1E0CB2D50]);
}

- (void)setMoreInfo:(id)a3
{
  _setUserInfoObjectForKey((uint64_t)self, (uint64_t)a3, (uint64_t)CFSTR("_MFMoreInfo"));
}

- (void)setShortDescription:(id)a3
{
  _setUserInfoObjectForKey((uint64_t)self, (uint64_t)a3, (uint64_t)CFSTR("_MFShortDescription"));
}

- (void)useGenericDescription:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v9;

  v4 = -[MFError localizedDescription](self, "localizedDescription");
  if (v4 && (v5 = v4, (objc_msgSend(v4, "isEqualToString:", &stru_1E81CBE50) & 1) == 0))
  {
    v7 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3940]), "initWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("MSG_SERVER_ERROR"), (uint64_t)CFSTR("%@\n\nThe server error encountered was: %@"), CFSTR("Delayed")), a3, v5);
  }
  else
  {
    v6 = a3;
    v7 = a3;
  }
  v9 = v7;
  -[MFError setLocalizedDescription:](self, "setLocalizedDescription:", v7);

}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFError;
  -[MFError dealloc](&v3, sel_dealloc);
}

+ (void)errorWithDomain:(void *)a1 code:(NSObject *)a2 localizedDescription:title:userInfo:.cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend(a1, "ef_publicDescription");
  _os_log_error_impl(&dword_1C8839000, a2, OS_LOG_TYPE_ERROR, "Created error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
