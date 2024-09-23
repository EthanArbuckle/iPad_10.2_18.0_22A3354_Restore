@implementation CMMotionAlarm

- (CMMotionAlarm)initWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6
{
  int v7;

  v7 = 1;
  return (CMMotionAlarm *)objc_msgSend_initWithName_type_duration_repeats_alarmId_bundleId_state_(self, a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, a6, 0, &stru_1E295ADC8, v7);
}

- (CMMotionAlarm)initWithName:(id)a3 type:(unsigned int)a4 duration:(unsigned int)a5 repeats:(BOOL)a6 alarmId:(unint64_t)a7 bundleId:(id)a8 state:(int)a9
{
  _BOOL4 v11;
  unsigned int v12;
  SEL v15;
  void *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CMMotionAlarm *v24;
  unsigned int v25;
  unint64_t v26;
  const char *v27;
  uint64_t v28;
  __CFString *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  CMMotionAlarm *v40;
  NSString *v41;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  objc_super v58;
  int v59;
  uint64_t v60;
  __int16 v61;
  unsigned int v62;
  __int16 v63;
  unsigned int v64;
  __int16 v65;
  _BOOL4 v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  unsigned int v74;
  __int16 v75;
  unsigned int v76;
  __int16 v77;
  _BOOL4 v78;
  __int16 v79;
  unint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v11 = a6;
  v12 = a5;
  v15 = a2;
  v83 = *MEMORY[0x1E0C80C00];
  if (a6 && a4 != 15 && a4 != 19)
  {
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)v15, (uint64_t)self, (uint64_t)CFSTR("CMMotionAlarm.mm"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type == kCMMotionAlarmTypeTimer || type == kCMMotionAlarmTypeClassATimer"));
  }
  if (!a3)
  {
    v43 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v43, v44, (uint64_t)v15, (uint64_t)self, (uint64_t)CFSTR("CMMotionAlarm.mm"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));
  }
  if (a4 >= 0x1C)
  {
    v45 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)v15, (uint64_t)self, (uint64_t)CFSTR("CMMotionAlarm.mm"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type < kMotionAlarmTypeCount"));
  }
  if (!a8)
  {
    if (qword_1EE16D3F8 != -1)
      dispatch_once(&qword_1EE16D3F8, &unk_1E29543A8);
    v19 = qword_1EE16D3F0;
    if (os_log_type_enabled((os_log_t)qword_1EE16D3F0, OS_LOG_TYPE_FAULT))
    {
      v24 = self;
      v25 = v12;
      v26 = a7;
      v27 = v15;
      v28 = objc_msgSend_UTF8String(a3, v20, v21, v22, v23);
      v29 = sub_18F46B3E4(a9);
      *(_DWORD *)buf = 136447490;
      v72 = v28;
      v15 = v27;
      a7 = v26;
      v12 = v25;
      self = v24;
      a8 = 0;
      v73 = 1026;
      v74 = a4;
      v75 = 1026;
      v76 = v12;
      v77 = 1026;
      v78 = v11;
      v79 = 2050;
      v80 = a7;
      v81 = 2082;
      v82 = objc_msgSend_UTF8String(v29, v30, v31, v32, v33);
      _os_log_impl(&dword_18F1DC000, v19, OS_LOG_TYPE_FAULT, "Invalid CMMotionAlarm with nil bundle id! name: %{public}s, type: %{public}d, duration %{public}d, repeats: %{public}d, alarmId: %{public}llu, state: %{public}s", buf, 0x32u);
    }
    if (sub_18F1FCA08(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE16D3F8 != -1)
        dispatch_once(&qword_1EE16D3F8, &unk_1E29543A8);
      v51 = objc_msgSend_UTF8String(a3, v47, v48, v49, v50);
      v52 = sub_18F46B3E4(a9);
      v59 = 136447490;
      v60 = v51;
      v61 = 1026;
      v62 = a4;
      v63 = 1026;
      v64 = v12;
      v65 = 1026;
      v66 = v11;
      v67 = 2050;
      v68 = a7;
      v69 = 2082;
      v70 = objc_msgSend_UTF8String(v52, v53, v54, v55, v56);
      v57 = (char *)_os_log_send_and_compose_impl();
      sub_18F419700("Generic", 1, 0, 0, "-[CMMotionAlarm initWithName:type:duration:repeats:alarmId:bundleId:state:]", "CoreLocation: %s\n", v57);
      if (v57 != (char *)buf)
        free(v57);
    }
    sub_18F1F77DC();
    if (sub_18F375B58())
    {
      v38 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v34, v35, v36, v37);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)v15, (uint64_t)self, (uint64_t)CFSTR("CMMotionAlarm.mm"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("false"));
    }
  }
  v58.receiver = self;
  v58.super_class = (Class)CMMotionAlarm;
  v40 = -[CMMotionAlarm init](&v58, sel_init);
  if (v40)
  {
    v41 = (NSString *)a3;
    v40->_duration = v12;
    v40->_type = a4;
    v40->_repeats = v11;
    v40->_name = v41;
    v40->_alarmId = a7;
    v40->_bundleId = (NSString *)a8;
    v40->_state = a9;
  }
  return v40;
}

- (void)dealloc
{
  objc_super v3;

  self->_manager = 0;
  self->_bundleId = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMMotionAlarm;
  -[CMMotionAlarm dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionAlarm)initWithCoder:(id)a3
{
  CMMotionAlarm *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CMMotionAlarm;
  v4 = -[CMMotionAlarm init](&v33, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("kCMMotionAlarmName"), v7);
    v4->_type = objc_msgSend_decodeIntegerForKey_(a3, v8, (uint64_t)CFSTR("kCMMotionAlarmType"), v9, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, (uint64_t)CFSTR("kCMMotionAlarmDuration"), v12, v13);
    v4->_duration = v14;
    v4->_repeats = objc_msgSend_decodeBoolForKey_(a3, v15, (uint64_t)CFSTR("kCMMotionAlarmRepeats"), v16, v17);
    v18 = objc_opt_class();
    v21 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, (uint64_t)CFSTR("kCMMotionAlarmId"), v20);
    v4->_alarmId = objc_msgSend_unsignedLongLongValue(v21, v22, v23, v24, v25);
    v26 = objc_opt_class();
    v4->_bundleId = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("kCMMotionAlarmBundleId"), v28);
    v4->_state = objc_msgSend_decodeIntegerForKey_(a3, v29, (uint64_t)CFSTR("kCMMotionAlarmState"), v30, v31);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_name, (uint64_t)CFSTR("kCMMotionAlarmName"), v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_type, (uint64_t)CFSTR("kCMMotionAlarmType"), v7);
  LODWORD(v8) = self->_duration;
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("kCMMotionAlarmDuration"), v10, v11, (double)v8);
  objc_msgSend_encodeBool_forKey_(a3, v12, self->_repeats, (uint64_t)CFSTR("kCMMotionAlarmRepeats"), v13);
  v17 = objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v14, self->_alarmId, v15, v16);
  objc_msgSend_encodeObject_forKey_(a3, v18, v17, (uint64_t)CFSTR("kCMMotionAlarmId"), v19);
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_bundleId, (uint64_t)CFSTR("kCMMotionAlarmBundleId"), v21);
  objc_msgSend_encodeInteger_forKey_(a3, v22, self->_state, (uint64_t)CFSTR("kCMMotionAlarmState"), v23);
}

- (BOOL)isValid
{
  return self->_alarmId && self->_manager != 0;
}

- (BOOL)acknowledgeWithError:(id *)a3
{
  return ((uint64_t (*)(CMMotionAlarmManager *, char *, CMMotionAlarm *, id *))MEMORY[0x1E0DE7D20])(self->_manager, sel_acknowledgeAlarm_error_, self, a3);
}

- (BOOL)unregisterWithError:(id *)a3
{
  return ((uint64_t (*)(CMMotionAlarmManager *, char *, CMMotionAlarm *, id *))MEMORY[0x1E0DE7D20])(self->_manager, sel_unregisterAlarm_error_, self, a3);
}

- (void)copyPropertiesFromAlarm:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  self->_type = objc_msgSend_type(a3, a2, (uint64_t)a3, v3, v4);
  self->_duration = objc_msgSend_duration(a3, v7, v8, v9, v10);
  self->_repeats = objc_msgSend_repeats(a3, v11, v12, v13, v14);
  v19 = objc_msgSend_alarmId(a3, v15, v16, v17, v18);
  objc_msgSend_setAlarmId_(self, v20, v19, v21, v22);
  v27 = objc_msgSend_bundleId(a3, v23, v24, v25, v26);
  objc_msgSend_setBundleId_(self, v28, v27, v29, v30);
  v35 = objc_msgSend_state(a3, v31, v32, v33, v34);
  MEMORY[0x1E0DE7D20](self, sel_setState_, v35, v36, v37);
}

- (id)description
{
  void *v2;
  _BOOL8 repeats;
  NSString *name;
  unint64_t alarmId;
  NSString *bundleId;
  uint64_t type;
  uint64_t duration;
  __CFString *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (void *)MEMORY[0x1E0CB3940];
  repeats = self->_repeats;
  name = self->_name;
  alarmId = self->_alarmId;
  bundleId = self->_bundleId;
  type = self->_type;
  duration = self->_duration;
  v9 = sub_18F46B3E4(self->_state);
  return (id)objc_msgSend_stringWithFormat_(v2, v10, (uint64_t)CFSTR("Name: %@, Type: %d, Duration: %d, Repeats: %d, AlarmID: %llu, BundleID: %@, AlarmState: %@"), v11, v12, name, type, duration, repeats, alarmId, bundleId, v9);
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)alarmId
{
  return self->_alarmId;
}

- (void)setAlarmId:(unint64_t)a3
{
  self->_alarmId = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (CMMotionAlarmManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
