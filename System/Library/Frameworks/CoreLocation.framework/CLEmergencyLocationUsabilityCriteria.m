@implementation CLEmergencyLocationUsabilityCriteria

- (CLEmergencyLocationUsabilityCriteria)init
{
  CLEmergencyLocationUsabilityCriteria *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLEmergencyLocationUsabilityCriteria;
  result = -[CLEmergencyLocationUsabilityCriteria init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_vuncCheckRequiredForUsability = 256;
    *(_OWORD *)&result->_maxUsableAge = xmmword_18F776330;
    result->_maxUsableVunc = 30.0;
    result->_minUsableIntegrity = 50;
  }
  return result;
}

- (void)printUsabilityCriteria:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
  v5 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend_vuncCheckRequiredForUsability(self, v6, v7, v8);
    v13 = objc_msgSend_altitudeStitchingEnabled(self, v10, v11, v12);
    objc_msgSend_maxUsableAge(self, v14, v15, v16);
    v18 = v17;
    objc_msgSend_maxUsableHunc(self, v19, v20, v21);
    v23 = v22;
    objc_msgSend_maxUsableVunc(self, v24, v25, v26);
    *(_DWORD *)buf = 138544898;
    v51 = a3;
    v52 = 1026;
    v53 = v9;
    v54 = 1026;
    v55 = v13;
    v56 = 2050;
    v57 = v18;
    v58 = 2050;
    v59 = v23;
    v60 = 2050;
    v61 = v30;
    v62 = 1026;
    v63 = objc_msgSend_minUsableIntegrity(self, v27, v28, v29);
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@,vuncCheckRequiredForUsability,%{public}d,altitudeStitchingEnabled,%{public}d,maxUsableAge,%{public}f,maxUsableHunc,%{public}f,maxUsableVunc,%{public}f,minUsableIntegrity,%{public}d", buf, 0x3Cu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990C70);
    objc_msgSend_vuncCheckRequiredForUsability(self, v31, v32, v33);
    objc_msgSend_altitudeStitchingEnabled(self, v34, v35, v36);
    objc_msgSend_maxUsableAge(self, v37, v38, v39);
    objc_msgSend_maxUsableHunc(self, v40, v41, v42);
    objc_msgSend_maxUsableVunc(self, v43, v44, v45);
    objc_msgSend_minUsableIntegrity(self, v46, v47, v48);
    v49 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEmergencyLocationUsabilityCriteria printUsabilityCriteria:]", "CoreLocation: %s\n", v49);
    if (v49 != (char *)buf)
      free(v49);
  }
}

- (BOOL)vuncCheckRequiredForUsability
{
  return self->_vuncCheckRequiredForUsability;
}

- (void)setVuncCheckRequiredForUsability:(BOOL)a3
{
  self->_vuncCheckRequiredForUsability = a3;
}

- (BOOL)altitudeStitchingEnabled
{
  return self->_altitudeStitchingEnabled;
}

- (void)setAltitudeStitchingEnabled:(BOOL)a3
{
  self->_altitudeStitchingEnabled = a3;
}

- (double)maxUsableAge
{
  return self->_maxUsableAge;
}

- (void)setMaxUsableAge:(double)a3
{
  self->_maxUsableAge = a3;
}

- (double)maxUsableHunc
{
  return self->_maxUsableHunc;
}

- (void)setMaxUsableHunc:(double)a3
{
  self->_maxUsableHunc = a3;
}

- (double)maxUsableVunc
{
  return self->_maxUsableVunc;
}

- (void)setMaxUsableVunc:(double)a3
{
  self->_maxUsableVunc = a3;
}

- (unsigned)minUsableIntegrity
{
  return self->_minUsableIntegrity;
}

- (void)setMinUsableIntegrity:(unsigned int)a3
{
  self->_minUsableIntegrity = a3;
}

@end
