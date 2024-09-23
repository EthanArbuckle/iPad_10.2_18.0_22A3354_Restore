@implementation NSKnownKeysMappingStrategy2

- (void)release
{

}

- (NSKnownKeysMappingStrategy2)retain
{
  id v3;

  v3 = *(id *)&self->super._cd_rc;
  return self;
}

- (id)_setupForKeys:(id *)a3 count:(unint64_t)a4 table:(void *)a5 inData:(id)a6
{
  self->super._length = a4;
  self->super._keys = a3;
  self->super._table = a5;
  *(_QWORD *)&self->super._cd_rc = a6;
  return self;
}

- (NSKnownKeysMappingStrategy2)init
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("You're doing it wrong"), CFSTR("Skanky class can only be used skankily."), 0));
}

- (unint64_t)retainCount
{
  return objc_msgSend(*(id *)&self->super._cd_rc, "retainCount");
}

- (BOOL)_isDeallocating
{
  return objc_msgSend(*(id *)&self->super._cd_rc, "_isDeallocating");
}

- (BOOL)_tryRetain
{
  return objc_msgSend(*(id *)&self->super._cd_rc, "_tryRetain");
}

@end
