@implementation _DPWordRecorder

- (_DPWordRecorder)init
{

  return 0;
}

- (_DPWordRecorder)initWithKey:(id)a3
{
  return -[_DPWordRecorder initWithKey:databaseDirectoryPath:readOnly:](self, "initWithKey:databaseDirectoryPath:readOnly:", a3, 0, 0);
}

- (BOOL)record:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256B78]();
  -[_DPDataRecorder recordWords:](self->_recorder, "recordWords:", v4);
  objc_autoreleasePoolPop(v5);

  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { recorder=%@ }"), v5, self->_recorder);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_DPWordRecorder)initWithKey:(id)a3 databaseDirectoryPath:(id)a4 readOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _DPWordRecorder *v10;
  void *v11;
  _DPDatabaseRecorder *v12;
  _DPDataRecorder *recorder;
  _DPXPCRecorder *v14;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_DPWordRecorder;
  v10 = -[_DPWordRecorder init](&v16, sel_init);
  if (v10)
  {
    if (v9)
    {
      +[_DPStorage storageWithDirectory:readOnly:](_DPStorage, "storageWithDirectory:readOnly:", v9, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[_DPDatabaseRecorder initWithKey:storage:]([_DPDatabaseRecorder alloc], "initWithKey:storage:", v8, v11);
      recorder = v10->_recorder;
      v10->_recorder = &v12->super;

    }
    else
    {
      v14 = -[_DPXPCRecorder initWithKey:]([_DPXPCRecorder alloc], "initWithKey:", v8);
      v11 = v10->_recorder;
      v10->_recorder = &v14->super;
    }

    v10->_wordFragmentWidth = -[_DPDataRecorder fragmentWidth](v10->_recorder, "fragmentWidth");
  }

  return v10;
}

- (unint64_t)wordFragmentWidth
{
  return self->_wordFragmentWidth;
}

- (_DPDataRecorder)recorder
{
  return self->_recorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recorder, 0);
}

@end
