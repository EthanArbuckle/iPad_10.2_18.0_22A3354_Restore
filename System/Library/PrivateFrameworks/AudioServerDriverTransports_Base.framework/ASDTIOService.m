@implementation ASDTIOService

+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForIOObject:andIDValue:", v4, v6);

  return v7;
}

- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  ASDTIOService *v10;
  ASDTIOService *v11;
  objc_super v13;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = v7;
  if (!(_DWORD)v4 || !v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTIOService initForIOObject:andIDValue:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDTIOService.m"), 39, CFSTR("Invalid arugments."));

  }
  v13.receiver = self;
  v13.super_class = (Class)ASDTIOService;
  v10 = -[ASDTIOService init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[ASDTIOService setIdValue:](v10, "setIdValue:", v8);
    -[ASDTIOService setIoObject:](v11, "setIoObject:", v4);
    -[ASDTIOService retainIOService](v11, "retainIOService");
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[ASDTIOService releaseIOService](self, "releaseIOService");
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOService;
  -[ASDTIOService dealloc](&v3, sel_dealloc);
}

- (void)retainIOService
{
  IOObjectRetain(-[ASDTIOService ioObject](self, "ioObject"));
}

- (void)releaseIOService
{
  if (-[ASDTIOService ioObject](self, "ioObject"))
    IOObjectRelease(-[ASDTIOService ioObject](self, "ioObject"));
}

- (unsigned)ioObject
{
  return self->_ioObject;
}

- (void)setIoObject:(unsigned int)a3
{
  self->_ioObject = a3;
}

- (ASDTIOServiceID)idValue
{
  return self->_idValue;
}

- (void)setIdValue:(id)a3
{
  objc_storeStrong((id *)&self->_idValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idValue, 0);
}

- (void)initForIOObject:andIDValue:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid arugments.", v0, 2u);
}

@end
