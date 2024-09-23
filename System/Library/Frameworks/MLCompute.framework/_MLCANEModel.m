@implementation _MLCANEModel

+ (id)objectWithModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 plist:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = *(_QWORD *)&a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModel:options:qos:plist:", v12, v11, v6, v10);

  return v13;
}

- (_MLCANEModel)initWithModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 plist:(id)a6
{
  id v11;
  id v12;
  id v13;
  _MLCANEModel *v14;
  _MLCANEModel *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_MLCANEModel;
  v14 = -[_MLCANEModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_anefModel, a3);
    objc_storeStrong((id *)&v15->_options, a4);
    v15->_qos = a5;
    objc_storeStrong((id *)&v15->_plist, a6);
  }

  return v15;
}

- (void)dealloc
{
  _ANEInMemoryModel *anefModel;
  uint64_t qos;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  _ANEInMemoryModel *v10;
  objc_super v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _ANEInMemoryModel *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  anefModel = self->_anefModel;
  qos = self->_qos;
  v12 = 0;
  v6 = -[_ANEInMemoryModel unloadWithQoS:error:](anefModel, "unloadWithQoS:error:", qos, &v12);
  v7 = v12;
  if ((v6 & 1) == 0)
  {
    +[MLCLog framework](MLCLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_anefModel;
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_1D4999000, v8, OS_LOG_TYPE_ERROR, "%@: failed to unload model=%@ : error=%@", buf, 0x20u);

    }
  }

  v11.receiver = self;
  v11.super_class = (Class)_MLCANEModel;
  -[_MLCANEModel dealloc](&v11, sel_dealloc);
}

- (_ANEInMemoryModel)anefModel
{
  return self->_anefModel;
}

- (NSDictionary)options
{
  return self->_options;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSDictionary)plist
{
  return self->_plist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_anefModel, 0);
}

@end
