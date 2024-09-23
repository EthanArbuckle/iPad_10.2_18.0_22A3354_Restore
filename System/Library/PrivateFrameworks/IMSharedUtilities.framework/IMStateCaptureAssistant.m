@implementation IMStateCaptureAssistant

- (IMStateCaptureAssistant)initWithObject:(id)a3 title:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMStateCaptureAssistant *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IMStateCaptureAssistant;
  v11 = -[IMStateCaptureAssistant init](&v13, sel_init);
  if (v11)
    v11->_handle = objc_msgSend((id)objc_opt_class(), "registerStateCaptureBlockWithObject:title:queue:", v8, v9, v10);

  return v11;
}

+ (unint64_t)registerStateCaptureBlockWithObject:(id)a3 title:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  unint64_t v15;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 || (dispatch_get_global_queue(-32768, 0), (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    location = 0;
    objc_initWeak(&location, v7);
    v10 = (void *)objc_msgSend(v8, "copy");
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v12;

    objc_copyWeak(&v17, &location);
    v8 = v14;
    v15 = os_state_add_handler();

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[IMStateCaptureAssistant deregister](self, "deregister");
  v3.receiver = self;
  v3.super_class = (Class)IMStateCaptureAssistant;
  -[IMStateCaptureAssistant dealloc](&v3, sel_dealloc);
}

- (void)deregister
{
  if (self->_handle)
  {
    os_state_remove_handler();
    self->_handle = 0;
  }
}

- (unint64_t)handle
{
  return self->_handle;
}

- (void)setHandle:(unint64_t)a3
{
  self->_handle = a3;
}

@end
