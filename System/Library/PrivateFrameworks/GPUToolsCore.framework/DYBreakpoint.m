@implementation DYBreakpoint

+ (id)keyPathsForValuesAffectingName
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("fenum"));
}

- (void)_commonInit:(int)a3 backtrace:(id)a4 error:(int)a5
{
  uint64_t v5;

  self->_fenum = -1;
  self->_type = a3;
  if (a3 == 1)
  {
    v5 = 84;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v5 = 85;
LABEL_5:
    *((_BYTE *)&self->super.isa + v5) = 1;
  }
  self->_glError = a5;
  self->_backtrace = (NSArray *)a4;
}

- (id)_initWithPbuf:(Fbuf *)a3 type:(int)a4 backtrace:(id)a5 error:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  DYBreakpoint *v10;
  DYBreakpoint *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a4;
  v13.receiver = self;
  v13.super_class = (Class)DYBreakpoint;
  v10 = -[DYBreakpoint init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[DYBreakpoint _commonInit:backtrace:error:](v10, "_commonInit:backtrace:error:", v8, a5, v6);
    v11->_fenum = *((_DWORD *)a3->var0.var0 + 1);
    v11->_fbufData = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytesNoCopy:length:freeWhenDone:", a3->var0.var0, *(unsigned int *)a3->var0.var0, 0);
  }
  return v11;
}

- (id)_initWithType:(int)a3 backtrace:(id)a4 error:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  DYBreakpoint *v8;
  DYBreakpoint *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)DYBreakpoint;
  v8 = -[DYBreakpoint init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[DYBreakpoint _commonInit:backtrace:error:](v8, "_commonInit:backtrace:error:", v7, a4, v5);
  return v9;
}

- (DYBreakpoint)init
{
  DYBreakpoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYBreakpoint;
  result = -[DYBreakpoint init](&v3, sel_init);
  if (result)
    result->_fenum = -1;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYBreakpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  GPUTools::FD::Function *v8;
  _BYTE v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DYBreakpoint;
  v4 = -[DYBreakpoint init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend(v4, "setFenum:", objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("fenum")));
    *((_QWORD *)v4 + 2) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    *((_BYTE *)v4 + 84) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("breakBefore"));
    *((_BYTE *)v4 + 85) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("breakAfter"));
    *((_BYTE *)v4 + 86) = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("noExec"));
    *((_DWORD *)v4 + 20) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("type"));
    *((_DWORD *)v4 + 14) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("glError"));
    *((_QWORD *)v4 + 8) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadName"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    *((_QWORD *)v4 + 9) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("backtrace"));
    v7 = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fbuf"));
    *((_QWORD *)v4 + 5) = v7;
    if (objc_msgSend(v7, "length"))
    {
      GPUTools::FB::Decoder::Decoder(v10, objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("fbuf version")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("little endian")) ^ 1);
      v8 = (GPUTools::FD::Function *)operator new();
      GPUTools::FD::Function::Function(v8);
      *((_QWORD *)v4 + 6) = v8;
      GPUTools::FB::Decoder::Decode((GPUTools::FB::Decoder *)v10, (char *)objc_msgSend(*((id *)v4 + 5), "mutableBytes"), objc_msgSend(*((id *)v4 + 5), "length"), *((GPUTools::FD::Function **)v4 + 6));
      if (*((_DWORD *)v4 + 20) != 3)
        *((_DWORD *)v4 + 14) = *(unsigned __int16 *)(*((_QWORD *)v4 + 6) + 482);
      GPUTools::FD::IFunctionDecoder::~IFunctionDecoder((GPUTools::FD::IFunctionDecoder *)v10);
    }
  }
  return (DYBreakpoint *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableData *fbufData;

  objc_msgSend(a3, "encodeInt32:forKey:", self->_fenum, CFSTR("fenum"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicate, CFSTR("predicate"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_breakBefore, CFSTR("breakBefore"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_breakAfter, CFSTR("breakAfter"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_noExec, CFSTR("noExec"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_glError, CFSTR("glError"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_threadName, CFSTR("threadName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_backtrace, CFSTR("backtrace"));
  fbufData = self->_fbufData;
  if (fbufData)
  {
    objc_msgSend(a3, "encodeObject:forKey:", fbufData, CFSTR("fbuf"));
    objc_msgSend(a3, "encodeInt32:forKey:", 4, CFSTR("fbuf version"));
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("little endian"));
  }
}

- (void)dealloc
{
  Function *function;
  objc_super v4;

  function = self->_function;
  if (function)
  {
    GPUTools::FD::Function::~Function((GPUTools::FD::Function *)function);
    MEMORY[0x242622C98]();
  }
  v4.receiver = self;
  v4.super_class = (Class)DYBreakpoint;
  -[DYBreakpoint dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYBreakpoint;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ fenum=%d name=%@"), -[DYBreakpoint description](&v3, sel_description), self->_fenum, self->_name);
}

- (void)setFenum:(unsigned int)a3
{
  self->_fenum = a3;

  self->_name = (NSString *)(id)dy_fenum_to_function_name_nsstring(self->_fenum, 0, 0);
}

- (NSString)predicateString
{
  return self->_predicateString;
}

- (void)setPredicateString:(id)a3
{
  NSString *predicateString;
  NSPredicate *predicate;

  predicateString = self->_predicateString;
  if (predicateString != a3)
  {
    self->_predicateString = (NSString *)objc_msgSend(a3, "copy");

    -[DYBreakpoint willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("predicate"));
    predicate = self->_predicate;
    self->_predicate = (NSPredicate *)(id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", self->_predicateString);

    -[DYBreakpoint didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("predicate"));
  }
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)fenum
{
  return self->_fenum;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)breakBefore
{
  return self->_breakBefore;
}

- (void)setBreakBefore:(BOOL)a3
{
  self->_breakBefore = a3;
}

- (BOOL)breakAfter
{
  return self->_breakAfter;
}

- (void)setBreakAfter:(BOOL)a3
{
  self->_breakAfter = a3;
}

- (BOOL)noExec
{
  return self->_noExec;
}

- (void)setNoExec:(BOOL)a3
{
  self->_noExec = a3;
}

- (const)function
{
  return self->_function;
}

- (int)type
{
  return self->_type;
}

- (int)glError
{
  return self->_glError;
}

- (NSArray)backtrace
{
  return self->_backtrace;
}

- (NSString)threadName
{
  return self->_threadName;
}

@end
