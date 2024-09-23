@implementation MBException

- (MBException)initWithCode:(int)a3 format:(id)a4
{
  uint64_t v5;

  return -[MBException initWithCode:format:args:](self, "initWithCode:format:args:", *(_QWORD *)&a3, a4, &v5);
}

- (MBException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v5;
  id v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v5 = *(_QWORD *)&a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", a4, a5);
  v10 = CFSTR("MBErrorCode");
  v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v9.receiver = self;
  v9.super_class = (Class)MBException;
  return -[MBException initWithName:reason:userInfo:](&v9, sel_initWithName_reason_userInfo_, CFSTR("MBException"), v7, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
}

- (int)errorCode
{
  return objc_msgSend((id)objc_msgSend((id)-[MBException userInfo](self, "userInfo"), "objectForKeyedSubscript:", CFSTR("MBErrorCode")), "intValue");
}

- (id)error
{
  return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", -[MBException errorCode](self, "errorCode"), CFSTR("%@"), -[MBException reason](self, "reason"));
}

@end
