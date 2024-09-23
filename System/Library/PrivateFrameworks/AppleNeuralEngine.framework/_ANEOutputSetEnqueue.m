@implementation _ANEOutputSetEnqueue

+ (id)new
{
  return 0;
}

- (_ANEOutputSetEnqueue)init
{

  return 0;
}

- (id)initOutputSetWithProcedureIndex:(unsigned int)a3 setIndex:(unsigned int)a4 signalValue:(unint64_t)a5 signalNotRequired:(BOOL)a6 isOpenLoop:(BOOL)a7
{
  id result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_ANEOutputSetEnqueue;
  result = -[_ANEOutputSetEnqueue init](&v13, sel_init);
  if (result)
  {
    *((_DWORD *)result + 3) = a3;
    *((_DWORD *)result + 4) = a4;
    *((_QWORD *)result + 3) = a5;
    *((_BYTE *)result + 8) = a6;
    *((_BYTE *)result + 9) = a7;
  }
  return result;
}

+ (id)outputSetWithProcedureIndex:(unsigned int)a3 setIndex:(unsigned int)a4 signalValue:(unint64_t)a5 signalNotRequired:(BOOL)a6 isOpenLoop:(BOOL)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initOutputSetWithProcedureIndex:setIndex:signalValue:signalNotRequired:isOpenLoop:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6, a7);
}

- (unsigned)procedureIndex
{
  return self->_procedureIndex;
}

- (unsigned)setIndex
{
  return self->_setIndex;
}

- (unint64_t)signalValue
{
  return self->_signalValue;
}

- (BOOL)signalNotRequired
{
  return self->_signalNotRequired;
}

- (BOOL)isOpenLoop
{
  return self->_isOpenLoop;
}

@end
