@implementation CULogHandle

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5 logFlags:(unsigned int)a6
{
  id v10;
  id v11;
  CULogHandle *v12;
  const char *v13;
  id v14;
  LogCategory *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CULogHandle *v23;
  unsigned int v25;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CULogHandle;
  v12 = -[CULogHandle init](&v26, sel_init);
  if (v12)
  {
    v25 = 0;
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v14 = objc_retainAutorelease(v11);
    v15 = (LogCategory *)LogCategoryCreateEx(v13, (const char *)objc_msgSend(v14, "UTF8String"), a5, a6, 0, (int *)&v25);
    v12->_ucatPtr = v15;
    if (!v15)
      FatalErrorF((uint64_t)"CULogHandle LogCategoryCreateEx failed: %#m", v16, v17, v18, v19, v20, v21, v22, v25);
    objc_storeStrong((id *)&v12->_categoryName, v14);
    v23 = v12;
  }

  return v12;
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logLevel:(int)a5
{
  return -[CULogHandle initWithSubsystem:category:logLevel:logFlags:](self, "initWithSubsystem:category:logLevel:logFlags:", a3, a4, *(_QWORD *)&a5, 512);
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4 logFlags:(unsigned int)a5
{
  return -[CULogHandle initWithSubsystem:category:logLevel:logFlags:](self, "initWithSubsystem:category:logLevel:logFlags:", a3, a4, 10, *(_QWORD *)&a5);
}

- (CULogHandle)initWithSubsystem:(id)a3 category:(id)a4
{
  return -[CULogHandle initWithSubsystem:category:logLevel:logFlags:](self, "initWithSubsystem:category:logLevel:logFlags:", a3, a4, 10, 512);
}

- (void)dealloc
{
  LogCategory *ucatPtr;
  objc_super v4;

  ucatPtr = self->_ucatPtr;
  self->_ucatPtr = 0;
  LogCategory_Remove(ucatPtr);
  v4.receiver = self;
  v4.super_class = (Class)CULogHandle;
  -[CULogHandle dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucatPtr;
  const char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucatPtr = (uint64_t *)&self->_ucatPtr;
  v7 = -[NSString UTF8String](self->_categoryName, "UTF8String");
  v8 = objc_retainAutorelease(v5);
  objc_msgSend(v8, "UTF8String");

  LogCategoryReplaceF(p_ucatPtr, (uint64_t)"%s-%s", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
}

- (void)ulog:(int)a3 message:(id)a4
{
  id v6;
  void *v7;
  LogCategory *ucatPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  id v15;

  v6 = a4;
  v7 = v6;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3)
  {
    v15 = v6;
    if (ucatPtr->var0 == -1)
    {
      v14 = _LogCategory_Initialize((uint64_t)ucatPtr, a3);
      v7 = v15;
      if (!v14)
        goto LABEL_5;
      ucatPtr = self->_ucatPtr;
    }
    v9 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    LogPrintF((uint64_t)ucatPtr, (uint64_t)", a3, (uint64_t)"%s", v10, v11, v12, v13, v9);
    v7 = v15;
  }
LABEL_5:

}

- (void)ulogf:(int)a3 format:(id)a4
{
  id v6;
  LogCategory *ucatPtr;
  uint64_t v8;

  v6 = a4;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3 && (ucatPtr->var0 != -1 || _LogCategory_Initialize((uint64_t)ucatPtr, a3)))
    LogPrintV((uint64_t)self->_ucatPtr, (uint64_t)", a3, objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), (uint64_t)&v8);

}

- (void)ulogv:(int)a3 format:(id)a4 args:(char *)a5
{
  id v8;
  void *v9;
  LogCategory *ucatPtr;
  _BOOL4 v11;
  id v12;

  v8 = a4;
  v9 = v8;
  ucatPtr = self->_ucatPtr;
  if (ucatPtr->var0 <= a3)
  {
    v12 = v8;
    if (ucatPtr->var0 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)ucatPtr, a3);
      v9 = v12;
      if (!v11)
        goto LABEL_5;
      ucatPtr = self->_ucatPtr;
    }
    LogPrintV((uint64_t)ucatPtr, (uint64_t)", a3, objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), (uint64_t)a5);
    v9 = v12;
  }
LABEL_5:

}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end
