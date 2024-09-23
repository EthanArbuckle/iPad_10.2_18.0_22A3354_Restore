@implementation IMPowerAssertion

- (IMPowerAssertion)initWithIdentifier:(id)a3 timeout:(double)a4
{
  id v6;
  IMPowerAssertion *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *identifier;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMPowerAssertion;
  v7 = -[IMPowerAssertion init](&v24, sel_init);
  if (v7)
  {
    if (a4 == 0.0)
    {
      if (qword_1EE1DDED8 != -1)
        dispatch_once(&qword_1EE1DDED8, &unk_1E2C43048);
      if (off_1EE1DDED0(CFSTR("PreventUserIdleSystemSleep"), 255, v6, &v7->_assertion))
      {
LABEL_6:
        v7->_assertion = 0;
        _IMWarn(CFSTR("Unable to create the power assertion for \"%@\" (%d)."), (uint64_t)v8, v9, v10, v11, v12, v13, v14, (char)v6);

        v7 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      if (qword_1EE1DD568 != -1)
        dispatch_once(&qword_1EE1DD568, &unk_1E2C431A8);
      if (off_1EE1DD560(CFSTR("PreventUserIdleSystemSleep"), v6, v6, 0, 0, CFSTR("TimeoutActionTurnOff"), &v7->_assertion, a4))goto LABEL_6;
    }
    v15 = objc_msgSend_copy(v6, v8, v9, v10);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v15;

    v17 = (void *)MEMORY[0x19400E788]();
    if (_IMWillLog(CFSTR("Power")))
      _IMAlwaysLog(0, CFSTR("Power"), CFSTR("Created power assertion with identifier: %@"), v18, v19, v20, v21, v22, (char)v6);
    IMLogBacktrace(CFSTR("Power"));
    objc_autoreleasePoolPop(v17);
  }
LABEL_13:

  return v7;
}

- (IMPowerAssertion)initWithIdentifier:(id)a3
{
  return (IMPowerAssertion *)((uint64_t (*)(IMPowerAssertion *, char *, id))MEMORY[0x1E0DE7D20])(self, sel_initWithIdentifier_timeout_, a3);
}

- (IMPowerAssertion)initWithIdentifier:(id)a3 timeoutSec:(double)a4 properties:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  IMPowerAssertion *v13;
  uint64_t v14;
  NSString *identifier;
  id v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSDictionary *properties;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  IMPowerAssertion *v56;
  objc_super v58;

  v8 = a3;
  v9 = a5;
  v58.receiver = self;
  v58.super_class = (Class)IMPowerAssertion;
  v13 = -[IMPowerAssertion init](&v58, sel_init);
  if (!v13)
    goto LABEL_15;
  v14 = objc_msgSend_copy(v8, v10, v11, v12);
  identifier = v13->_identifier;
  v13->_identifier = (NSString *)v14;

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_setValue_forKey_(v16, v17, (uint64_t)CFSTR("PreventUserIdleSystemSleep"), (uint64_t)CFSTR("AssertType"));
  objc_msgSend_setValue_forKey_(v16, v18, (uint64_t)v8, (uint64_t)CFSTR("AssertName"));
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v19, v20, v21, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v16, v23, (uint64_t)v22, (uint64_t)CFSTR("TimeoutSeconds"));

  objc_msgSend_objectForKeyedSubscript_(v9, v24, (uint64_t)CFSTR("IMPowerAssertionPropertyPIDKey"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v27, (uint64_t)CFSTR("IMPowerAssertionPropertyPIDKey"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v30, (uint64_t)v29, (uint64_t)CFSTR("AssertPID"));

  }
  objc_msgSend_objectForKeyedSubscript_(v9, v27, (uint64_t)CFSTR("IMPowerAssertionPropertyOnBehalfOfPIDKey"), v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v32, (uint64_t)CFSTR("IMPowerAssertionPropertyOnBehalfOfPIDKey"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v35, (uint64_t)v34, (uint64_t)CFSTR("AssertionOnBehalfOfPID"));

  }
  objc_msgSend_objectForKeyedSubscript_(v9, v32, (uint64_t)CFSTR("IMPowerAssertionPropertyFrameworkIDKey"), v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v37, (uint64_t)CFSTR("IMPowerAssertionPropertyFrameworkIDKey"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v40, (uint64_t)v39, (uint64_t)CFSTR("FrameworkBundleID"));

  }
  objc_msgSend_objectForKeyedSubscript_(v9, v37, (uint64_t)CFSTR("IMPowerAssertionPropertyOnBehalfOfPIDReasonKey"), v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend_objectForKeyedSubscript_(v9, v42, (uint64_t)CFSTR("IMPowerAssertionPropertyOnBehalfOfPIDReasonKey"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v16, v46, (uint64_t)v45, (uint64_t)CFSTR("AssertionOnBehalfOfPIDReason"));

  }
  v47 = objc_msgSend_copy(v16, v42, v43, v44);
  properties = v13->_properties;
  v13->_properties = (NSDictionary *)v47;

  if (qword_1EE1DDEE8 != -1)
    dispatch_once(&qword_1EE1DDEE8, &unk_1E2C466C8);
  if (!off_1EE1DDEE0(v13->_properties, &v13->_assertion))
  {

LABEL_15:
    v56 = v13;
    goto LABEL_16;
  }
  v13->_assertion = 0;
  _IMWarn(CFSTR("Unable to create the power assertion for \"%@\" (%d)."), v49, v50, v51, v52, v53, v54, v55, (char)v8);

  v56 = 0;
LABEL_16:

  return v56;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  if (_IMWillLog(CFSTR("Power")))
    _IMAlwaysLog(0, CFSTR("Power"), CFSTR("Releasing power assertion with identifier: %@"), v3, v4, v5, v6, v7, (char)self->_identifier);
  IMLogBacktrace(CFSTR("Power"));
  if (self->_assertion)
  {
    if (qword_1EE1DD578 != -1)
      dispatch_once(&qword_1EE1DD578, &unk_1E2C466E8);
    if (off_1EE1DD570(self->_assertion))
      _IMWarn(CFSTR("Unable to properly release the power assertion for \"%@\" (%d).  Dropping it instead."), v8, v9, v10, v11, v12, v13, v14, (char)self->_identifier);
  }
  v15.receiver = self;
  v15.super_class = (Class)IMPowerAssertion;
  -[IMPowerAssertion dealloc](&v15, sel_dealloc);
}

- (id)description
{
  uint64_t v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<IMPowerAssertion: %p> Identifier: %@"), v2, self, self->_identifier);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
