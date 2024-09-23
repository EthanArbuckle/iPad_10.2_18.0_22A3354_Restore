@implementation CoreDAVOrderedAction

- (CoreDAVOrderedAction)initWithAction:(int)a3 context:(id)a4 absoluteOrder:(int)a5
{
  CoreDAVOrderedAction *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreDAVOrderedAction;
  result = -[CoreDAVAction initWithAction:context:](&v7, sel_initWithAction_context_, *(_QWORD *)&a3, a4);
  if (result)
    *((_DWORD *)&result->super._ignoresGuardianRestrictions + 1) = a5;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> { Change type %d, Absolute Order %d prior url %@, Context: %@ }"), objc_opt_class(), self, self->super._action, *((unsigned int *)&self->super._ignoresGuardianRestrictions + 1), *(_QWORD *)&self->_absoluteOrder, self->super._context);
}

- (int)absoluteOrder
{
  return *((_DWORD *)&self->super._ignoresGuardianRestrictions + 1);
}

- (NSURL)priorURL
{
  return *(NSURL **)&self->_absoluteOrder;
}

- (void)setPriorURL:(id)a3
{
  objc_storeStrong((id *)&self->_absoluteOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absoluteOrder, 0);
}

@end
