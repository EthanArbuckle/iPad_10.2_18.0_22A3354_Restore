@implementation _LTSELFLoggingInvocationOptions

- (_LTSELFLoggingInvocationOptions)initWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 translateAppContext:(id)a6
{
  id v11;
  _LTSELFLoggingInvocationOptions *v12;
  _LTSELFLoggingInvocationOptions *v13;
  _LTSELFLoggingInvocationOptions *v14;
  objc_super v16;

  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_LTSELFLoggingInvocationOptions;
  v12 = -[_LTSELFLoggingInvocationOptions init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_task = a3;
    v12->_inputMode = a4;
    v12->_invocationType = a5;
    objc_storeStrong((id *)&v12->_translateAppContext, a6);
    v14 = v13;
  }

  return v13;
}

- (_LTSELFLoggingInvocationOptions)initWithCoder:(id)a3
{
  id v4;
  _LTSELFLoggingInvocationOptions *v5;
  uint64_t v6;
  _LTSELFLoggingTranslateAppContext *translateAppContext;
  _LTSELFLoggingInvocationOptions *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LTSELFLoggingInvocationOptions;
  v5 = -[_LTSELFLoggingInvocationOptions init](&v10, sel_init);
  if (v5)
  {
    v5->_task = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("task"));
    v5->_inputMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputMode"));
    v5->_invocationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("invocationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("translateAppContext"));
    v6 = objc_claimAutoreleasedReturnValue();
    translateAppContext = v5->_translateAppContext;
    v5->_translateAppContext = (_LTSELFLoggingTranslateAppContext *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t task;
  id v5;

  task = self->_task;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", task, CFSTR("task"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_inputMode, CFSTR("inputMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_invocationType, CFSTR("invocationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_translateAppContext, CFSTR("translateAppContext"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)task
{
  return self->_task;
}

- (int64_t)inputMode
{
  return self->_inputMode;
}

- (int64_t)invocationType
{
  return self->_invocationType;
}

- (_LTSELFLoggingTranslateAppContext)translateAppContext
{
  return self->_translateAppContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translateAppContext, 0);
}

@end
