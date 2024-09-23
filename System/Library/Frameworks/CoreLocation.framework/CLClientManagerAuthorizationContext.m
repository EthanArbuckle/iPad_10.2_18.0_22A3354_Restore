@implementation CLClientManagerAuthorizationContext

- (CLClientManagerAuthorizationContext)initWithInUseLevel:(int)a3 registrationResult:(int)a4 transientAwareRegistrationResult:(int)a5 serviceMaskTuple:(CLClientServiceTypeMaskTuple)a6 diagnosticMask:(unint64_t)a7 authorizedForWidgetUpdates:(BOOL)a8
{
  unint64_t var1;
  unint64_t var0;
  CLClientManagerAuthorizationContext *result;
  objc_super v15;

  var1 = a6.var1;
  var0 = a6.var0;
  v15.receiver = self;
  v15.super_class = (Class)CLClientManagerAuthorizationContext;
  result = -[CLClientManagerAuthorizationContext init](&v15, sel_init);
  if (result)
  {
    result->_registrationResult = a4;
    result->_inUseLevel = a3;
    result->_effectiveServiceMask = var0;
    result->_provisionalServiceMask = var1;
    result->_transientAwareRegistrationResult = a5;
    result->_diagnosticMask = a7;
    result->_authorizedForWidgetUpdates = a8;
  }
  return result;
}

- (id)authorizationContextByANDingServiceMaskTuple:(CLClientServiceTypeMaskTuple)a3
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  CLClientManagerAuthorizationContext *v9;
  const char *v10;
  char v11;

  v3 = self;
  v4 = *((_QWORD *)self + 5);
  v5 = *((_QWORD *)self + 6);
  v6 = v4 & a3.var0;
  v7 = v5 & a3.var1;
  if ((v4 & a3.var0) != v4 || v7 != v5)
  {
    v9 = [CLClientManagerAuthorizationContext alloc];
    v11 = v3[8];
    return (id)objc_msgSend_initWithInUseLevel_registrationResult_transientAwareRegistrationResult_serviceMaskTuple_diagnosticMask_authorizedForWidgetUpdates_(v9, v10, *((unsigned int *)v3 + 5), *((unsigned int *)v3 + 4), *((unsigned int *)v3 + 3), v6, v7, *((_QWORD *)v3 + 3), v11);
  }
  return self;
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("AuthContext InUse:%d  RegResult:%d(%d) EffectiveMask:%d  ProvisionalMask:%d  DiagnosticMask:%d"), v2, self->_inUseLevel, self->_registrationResult, self->_transientAwareRegistrationResult, self->_effectiveServiceMask, self->_provisionalServiceMask, self->_diagnosticMask);
}

- (BOOL)isNonProvisionallyAuthorizedForServiceTypeMask:(unint64_t)a3
{
  uint64_t v3;

  return (a3 & ~objc_msgSend_effectiveServiceMask(self, a2, a3, v3)) == 0;
}

- (BOOL)isNonProvisionallyAuthorizedForServiceType:(unint64_t)a3
{
  return ((uint64_t (*)(CLClientManagerAuthorizationContext *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_isNonProvisionallyAuthorizedForServiceTypeMask_, 1 << a3);
}

- (BOOL)isAuthorizedForServiceTypeMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = objc_msgSend_effectiveServiceMask(self, a2, a3, v3);
  return (a3 & ~(objc_msgSend_provisionalServiceMask(self, v7, v8, v9) | v6)) == 0;
}

- (BOOL)isAuthorizedForServiceType:(unint64_t)a3
{
  return ((uint64_t (*)(CLClientManagerAuthorizationContext *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_isAuthorizedForServiceTypeMask_, 1 << a3);
}

- (BOOL)inUseLevelIsAtLeast:(int)a3
{
  return self->_inUseLevel >= a3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  int isMemberOfClass;

  v5 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(a3, v6, v5, v7);
  if (isMemberOfClass)
    LOBYTE(isMemberOfClass) = self->_inUseLevel == *((_DWORD *)a3 + 5)
                           && self->_staticServiceMask == *((_QWORD *)a3 + 4)
                           && self->_effectiveServiceMask == *((_QWORD *)a3 + 5)
                           && self->_provisionalServiceMask == *((_QWORD *)a3 + 6)
                           && self->_registrationResult == *((_DWORD *)a3 + 4)
                           && self->_authorizedForWidgetUpdates == *((unsigned __int8 *)a3 + 8)
                           && self->_transientAwareRegistrationResult == *((_DWORD *)a3 + 3)
                           && self->_diagnosticMask == *((_QWORD *)a3 + 3);
  return isMemberOfClass;
}

- (id)getStateSummary
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;

  v5 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_inUseLevel, v7);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v9, v8, (uint64_t)CFSTR("InUseLevel"));
  v12 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v10, self->_effectiveServiceMask, v11);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v13, v12, (uint64_t)CFSTR("EffectiveServiceMask"));
  v16 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v14, self->_provisionalServiceMask, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v17, v16, (uint64_t)CFSTR("ProvisionalServiceMask"));
  v20 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v18, self->_registrationResult, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v21, v20, (uint64_t)CFSTR("RegistrationResult"));
  v24 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v22, self->_transientAwareRegistrationResult, v23);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v25, v24, (uint64_t)CFSTR("TransientAwareRegistrationResult"));
  v28 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v26, self->_diagnosticMask, v27);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v29, v28, (uint64_t)CFSTR("DiagnosticMask"));
  v32 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v30, self->_authorizedForWidgetUpdates, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v33, v32, (uint64_t)CFSTR("AuthorizedForWidgetUpdates"));
  return v5;
}

- (int)transientAwareRegistrationResult
{
  return self->_transientAwareRegistrationResult;
}

- (int)registrationResult
{
  return self->_registrationResult;
}

- (BOOL)authorizedForWidgetUpdates
{
  return self->_authorizedForWidgetUpdates;
}

- (int)inUseLevel
{
  return self->_inUseLevel;
}

- (unint64_t)diagnosticMask
{
  return self->_diagnosticMask;
}

- (unint64_t)staticServiceMask
{
  return self->_staticServiceMask;
}

- (unint64_t)effectiveServiceMask
{
  return self->_effectiveServiceMask;
}

- (unint64_t)provisionalServiceMask
{
  return self->_provisionalServiceMask;
}

@end
