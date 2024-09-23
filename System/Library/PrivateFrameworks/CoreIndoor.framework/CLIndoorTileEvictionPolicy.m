@implementation CLIndoorTileEvictionPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorTileEvictionPolicy)init
{
  CLIndoorTileEvictionPolicy *v2;
  CLIndoorTileEvictionPolicy *v3;
  OS_xpc_object *activity;
  CLIndoorTileEvictionPolicy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLIndoorTileEvictionPolicy;
  v2 = -[CLIndoorTileEvictionPolicy init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_forceClean = 0;
    activity = v2->_activity;
    v2->_maxModifiedAge = 604800.0;
    v2->_activity = 0;

    v5 = v3;
  }

  return v3;
}

- (CLIndoorTileEvictionPolicy)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CLIndoorTileEvictionPolicy *v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  OS_xpc_object *activity;
  CLIndoorTileEvictionPolicy *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLIndoorTileEvictionPolicy;
  v8 = -[CLIndoorTileEvictionPolicy init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("_maxModifiedAge"), v6, v7);
    v8->_maxModifiedAge = v9;
    v8->_forceClean = objc_msgSend_decodeBoolForKey_(v4, v10, (uint64_t)CFSTR("_forceClean"), v11, v12);
    activity = v8->_activity;
    v8->_activity = 0;

    v14 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  id v11;

  v11 = a3;
  objc_msgSend_encodeDouble_forKey_(v11, v4, (uint64_t)CFSTR("_maxModifiedAge"), v5, v6, self->_maxModifiedAge);
  v10 = 0.0;
  if (self->_forceClean)
    v10 = 1.0;
  objc_msgSend_encodeDouble_forKey_(v11, v7, (uint64_t)CFSTR("_forceClean"), v8, v9, v10);

}

- (BOOL)tileLastModified:(double)a3 needsEvictionAt:(double)a4
{
  NSObject *v7;
  double v8;
  double maxModifiedAge;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (qword_254E3E6C0 != -1)
  {
    dispatch_once(&qword_254E3E6C0, &unk_24D5706C8);
    v7 = qword_254E3E6C8;
    if (os_log_type_enabled((os_log_t)qword_254E3E6C8, OS_LOG_TYPE_INFO))
      goto LABEL_3;
LABEL_5:
    v8 = a4 - a3;
    return v8 >= self->_maxModifiedAge;
  }
  v7 = qword_254E3E6C8;
  if (!os_log_type_enabled((os_log_t)qword_254E3E6C8, OS_LOG_TYPE_INFO))
    goto LABEL_5;
LABEL_3:
  v8 = a4 - a3;
  maxModifiedAge = self->_maxModifiedAge;
  v11 = 134350080;
  v12 = a4;
  v13 = 2050;
  v14 = a3;
  v15 = 2050;
  v16 = a4 - a3;
  v17 = 2050;
  v18 = maxModifiedAge;
  v19 = 1024;
  v20 = a4 - a3 >= maxModifiedAge;
  _os_log_impl(&dword_216456000, v7, OS_LOG_TYPE_INFO, "@EvictCheck, modified, %{public}.1f, %{public}.1f, ages, %{public}.1f, %{public}.1f, evict, %d", (uint8_t *)&v11, 0x30u);
  return v8 >= self->_maxModifiedAge;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v4 = CFSTR("YES");
  if (self->_forceClean)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (!self->_activity)
    v4 = CFSTR("NO");
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("CLIndoorTileEvictionPolicy[maxModifiedAge=%lfs,forceClean=%@,xpc_activity=%@]"), v2, v3, *(_QWORD *)&self->_maxModifiedAge, v5, v4);
}

- (double)maxModifiedAge
{
  return self->_maxModifiedAge;
}

- (void)setMaxModifiedAge:(double)a3
{
  self->_maxModifiedAge = a3;
}

- (BOOL)forceClean
{
  return self->_forceClean;
}

- (void)setForceClean:(BOOL)a3
{
  self->_forceClean = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
