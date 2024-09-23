@implementation _ML3ValidatableDatabase

- (_ML3ValidatableDatabase)initWithDatabasePath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  objc_super v13;
  char label[256];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ML3ValidatableDatabase;
  v5 = -[_ML3ValidatableDatabase init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    *((_QWORD *)v5 + 3) = 0;
    objc_msgSend(v4, "lastPathComponent");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    __sprintf_chk(label, 0, 0x100uLL, "com.apple.MusicLibrary.ValidationQueue.%s", (const char *)objc_msgSend(v8, "UTF8String"));

    v9 = dispatch_queue_create(label, 0);
    v10 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v9;

    v11 = (void *)objc_msgSend(v5, "hash");
    *((_QWORD *)v5 + 1) = v11;
    dispatch_queue_set_specific(*((dispatch_queue_t *)v5 + 4), "com.apple.MusicLibrary._ML3ValidationQueueIdentifierKey", v11, 0);
  }

  return (_ML3ValidatableDatabase *)v5;
}

- (OS_dispatch_queue)validationSerialQueue
{
  return self->_validationSerialQueue;
}

- (BOOL)currentQueueIsValidationQueue
{
  return self->_queueID == (_QWORD)dispatch_get_specific("com.apple.MusicLibrary._ML3ValidationQueueIdentifierKey");
}

- (void)setValidationState:(unint64_t)a3
{
  self->_validationState = a3;
}

- (unint64_t)validationState
{
  return self->_validationState;
}

- (_ML3ValidatableDatabase)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-init is invalid. use -initWithDatabasePath: instead."));

  return 0;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setValidationSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_validationSerialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationSerialQueue, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end
