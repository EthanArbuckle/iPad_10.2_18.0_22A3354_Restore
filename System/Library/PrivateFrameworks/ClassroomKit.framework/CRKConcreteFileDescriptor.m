@implementation CRKConcreteFileDescriptor

- (void)dealloc
{
  objc_super v3;

  -[CRKConcreteFileDescriptor close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteFileDescriptor;
  -[CRKConcreteFileDescriptor dealloc](&v3, sel_dealloc);
}

- (CRKConcreteFileDescriptor)initWithRawValue:(int)a3
{
  uint64_t v3;
  CRKConcreteFileDescriptor *v4;
  uint64_t v5;
  NSNumber *backingValue;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKConcreteFileDescriptor;
  v4 = -[CRKConcreteFileDescriptor init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    backingValue = v4->_backingValue;
    v4->_backingValue = (NSNumber *)v5;

  }
  return v4;
}

- (int)rawValue
{
  void *v4;
  void *v5;
  int v6;
  void *v8;

  -[CRKConcreteFileDescriptor backingValue](self, "backingValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKConcreteFileDescriptor.m"), 45, CFSTR("Attempted to access raw value after closing file descriptor"));

  }
  -[CRKConcreteFileDescriptor backingValue](self, "backingValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

- (void)close
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "verboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Failed to close file descriptor. Error: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (BOOL)fetchFlags:(unsigned int *)a3 error:(id *)a4
{
  int v6;
  stat v8;

  v6 = fstat(-[CRKConcreteFileDescriptor rawValue](self, "rawValue", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0),
         &v8);
  if (v6)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crk_errorWithPOSIXCode:", *__error());
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a3)
  {
    *a3 = v8.st_flags;
  }
  return v6 == 0;
}

- (BOOL)changeFlags:(unsigned int)a3 error:(id *)a4
{
  int v5;
  int v6;

  v5 = fchflags(-[CRKConcreteFileDescriptor rawValue](self, "rawValue"), a3);
  v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crk_errorWithPOSIXCode:", *__error());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (NSNumber)backingValue
{
  return self->_backingValue;
}

- (void)setBackingValue:(id)a3
{
  objc_storeStrong((id *)&self->_backingValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingValue, 0);
}

@end
