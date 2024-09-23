@implementation AUAudioUnitBus_XPC

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_element, CFSTR("element"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedChannelLayoutTags, CFSTR("supportedChannelLayoutTags"));

}

- (AUAudioUnitBus_XPC)initWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  AUAudioUnitBus_XPC *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id AVAudioFormatClass;
  objc_super v16;

  v4 = a3;
  if ((v5 & 1) == 0
  {
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AUAudioUnitBus_XPC initWithCoder:]::layoutTagArrayClasses = objc_msgSend(v11, "initWithObjects:", v12, v13, 0);

  }
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E60]);
    AVAudioFormatClass = getAVAudioFormatClass();
    -[AUAudioUnitBus_XPC initWithCoder:]::formatClasses = objc_msgSend(v14, "initWithObjects:", AVAudioFormatClass, getAVAudioChannelLayoutClass(), 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitBus_XPC;
  v7 = -[AUAudioUnitBus_XPC init](&v16, sel_init);
  if (v7)
  {
    v7->_scope = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scope"));
    v7->_element = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("element"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[AUAudioUnitBus_XPC initWithCoder:]::formatClasses, CFSTR("format"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_format, v8);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", -[AUAudioUnitBus_XPC initWithCoder:]::layoutTagArrayClasses, CFSTR("supportedChannelLayoutTags"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v7->_supportedChannelLayoutTags, v9);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AUAudioUnitBus_XPC;
  -[AUAudioUnitBus dealloc](&v2, sel_dealloc);
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  id v10;
  char *WeakRetained;
  std::recursive_mutex *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD *v22;
  void *v23;
  _BYTE v24[24];
  _BYTE *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AUAudioUnitBus_XPC;
  -[AUAudioUnitBus addObserver:forKeyPath:options:context:](&v20, sel_addObserver_forKeyPath_options_context_, a3, v10, a5, a6);
  WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_audioUnit);
  v12 = (std::recursive_mutex *)(WeakRetained + 584);
  std::recursive_mutex::lock((std::recursive_mutex *)(WeakRetained + 584));

  +[AUAudioUnitProperty propertyWithKey:scope:element:](AUAudioUnitProperty, "propertyWithKey:scope:element:", v10, self->_scope, self->_element);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
  v21[0] = &off_1E2913638;
  v21[1] = &__block_literal_global_3748;
  v22 = v21;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v23, v14, (uint64_t)v21);
  v15 = v22;
  if (v22 == v21)
  {
    v16 = 4;
    v15 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_6:

  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addPropertyObserver:context:reply:", v13, a6, &__block_literal_global_16);

  v18 = v25;
  if (v25 == v24)
  {
    v19 = 4;
    v18 = v24;
    goto LABEL_10;
  }
  if (v25)
  {
    v19 = 5;
LABEL_10:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }

  std::recursive_mutex::unlock(v12);
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4 context:(void *)a5
{
  id v8;
  id WeakRetained;
  BOOL v10;
  char *v11;
  std::recursive_mutex *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  objc_super v20;
  _QWORD v21[3];
  _QWORD *v22;
  void *v23;
  _BYTE v24[24];
  _BYTE *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  self->_removingObserverWithContext = 1;
  v20.receiver = self;
  v20.super_class = (Class)AUAudioUnitBus_XPC;
  -[AUAudioUnitBus removeObserver:forKeyPath:context:](&v20, sel_removeObserver_forKeyPath_context_, a3, v8, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  v10 = WeakRetained == 0;

  if (!v10)
  {
    v11 = (char *)objc_loadWeakRetained((id *)&self->_audioUnit);
    v12 = (std::recursive_mutex *)(v11 + 584);
    std::recursive_mutex::lock((std::recursive_mutex *)(v11 + 584));

    +[AUAudioUnitProperty propertyWithKey:scope:element:](AUAudioUnitProperty, "propertyWithKey:scope:element:", v8, self->_scope, self->_element);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
    v21[0] = &off_1E2913638;
    v21[1] = &__block_literal_global_19;
    v22 = v21;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v23, v14, (uint64_t)v21);
    v15 = v22;
    if (v22 == v21)
    {
      v16 = 4;
      v15 = v21;
    }
    else
    {
      if (!v22)
        goto LABEL_7;
      v16 = 5;
    }
    (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_7:

    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removePropertyObserver:context:reply:", v13, a5, &__block_literal_global_20_3747);

    v18 = v25;
    if (v25 == v24)
    {
      v19 = 4;
      v18 = v24;
    }
    else
    {
      if (!v25)
      {
LABEL_12:

        std::recursive_mutex::unlock(v12);
        goto LABEL_13;
      }
      v19 = 5;
    }
    (*(void (**)(void))(*v18 + 8 * v19))();
    goto LABEL_12;
  }
LABEL_13:
  self->_removingObserverWithContext = 0;

}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  id v6;
  char *WeakRetained;
  std::recursive_mutex *v8;
  void *v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[3];
  _QWORD *v18;
  void *v19;
  _BYTE v20[24];
  _BYTE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUAudioUnitBus_XPC;
  -[AUAudioUnitBus removeObserver:forKeyPath:](&v16, sel_removeObserver_forKeyPath_, a3, v6);
  if (!self->_removingObserverWithContext)
  {
    WeakRetained = (char *)objc_loadWeakRetained((id *)&self->_audioUnit);
    v8 = (std::recursive_mutex *)(WeakRetained + 584);
    std::recursive_mutex::lock((std::recursive_mutex *)(WeakRetained + 584));

    +[AUAudioUnitProperty propertyWithKey:scope:element:](AUAudioUnitProperty, "propertyWithKey:scope:element:", v6, self->_scope, self->_element);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
    v17[0] = &off_1E2913638;
    v17[1] = &__block_literal_global_23_3745;
    v18 = v17;
    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::message(&v19, v10, (uint64_t)v17);
    v11 = v18;
    if (v18 == v17)
    {
      v12 = 4;
      v11 = v17;
    }
    else
    {
      if (!v18)
        goto LABEL_7;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_7:

    caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong}>::async_proxy(&v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removePropertyObserver:context:reply:", v9, 0, &__block_literal_global_24_3746);

    v14 = v21;
    if (v21 == v20)
    {
      v15 = 4;
      v14 = v20;
    }
    else
    {
      if (!v21)
      {
LABEL_12:

        std::recursive_mutex::unlock(v8);
        goto LABEL_13;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_12;
  }
LABEL_13:

}

- (BOOL)setFormat:(id)a3 error:(id *)a4
{
  AVAudioFormat *v7;
  id WeakRetained;
  id v9;
  void *v10;
  uint64_t element;
  uint64_t scope;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  BOOL v19;
  void *v21;
  _BYTE v22[24];
  _BYTE *v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = (AVAudioFormat *)a3;
  if (self->_format == v7)
    goto LABEL_17;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);

  if (!WeakRetained)
  {
    v18 = 0;
    goto LABEL_14;
  }
  v9 = objc_loadWeakRetained((id *)&self->_remoteAUXPCConnection);
  caulk::xpc::sync_message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_message(&v21, v9);

  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  element = self->_element;
  scope = self->_scope;
  caulk::xpc::message<objc_object  {objcproto22AUAudioUnitXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBusFormat:scope:format:reply:", element, scope, v7, v13);

  v14 = v25;
  v15 = v24;

  v16 = v23;
  if (v23 == v22)
  {
    v17 = 4;
    v16 = v22;
    goto LABEL_8;
  }
  if (v23)
  {
    v17 = 5;
LABEL_8:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }

  if (v15)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    v18 = v15;

    v19 = 0;
    goto LABEL_16;
  }
  v18 = v14;
LABEL_14:
  objc_storeStrong((id *)&self->_format, a3);
  if (!v18)
  {
LABEL_17:
    v19 = 1;
    goto LABEL_18;
  }
  v14 = objc_loadWeakRetained((id *)&self->_audioUnit);
  objc_msgSend(v14, "propertiesChanged:", v18);
  v19 = 1;
LABEL_16:

LABEL_18:
  return v19;
}

- (BOOL)isEnabled
{
  AUAudioUnit_XPC **p_audioUnit;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  char v8;

  p_audioUnit = &self->_audioUnit;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);

  if (!WeakRetained)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_audioUnit);
  +[AUAudioUnitProperty propertyWithKey:scope:element:](AUAudioUnitProperty, "propertyWithKey:scope:element:", CFSTR("enabled"), self->_scope, self->_element);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_getValueForProperty:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AUAudioUnit_XPC **p_audioUnit;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  p_audioUnit = &self->_audioUnit;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_audioUnit);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AUAudioUnitProperty propertyWithKey:scope:element:](AUAudioUnitProperty, "propertyWithKey:scope:element:", CFSTR("enabled"), self->_scope, self->_element);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setValue:forProperty:error:", v7, v8, 0);

  }
}

- (void)propertyChanged:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  -[AUAudioUnitBus_XPC willChangeValueForKey:](self, "willChangeValueForKey:", v4[1]);
  -[AUAudioUnitBus_XPC didChangeValueForKey:](self, "didChangeValueForKey:", v4[1]);

}

- (id)format
{
  return self->_format;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedChannelLayoutTags, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_destroyWeak((id *)&self->_remoteAUXPCConnection);
  objc_destroyWeak((id *)&self->_audioUnit);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
