@implementation MLModelStructureProgramArgument

- (MLModelStructureProgramArgument)initWithBindings:(id)a3
{
  id v4;
  MLModelStructureProgramArgument *v5;
  uint64_t v6;
  NSArray *bindings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgramArgument;
  v5 = -[MLModelStructureProgramArgument init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bindings = v5->_bindings;
    v5->_bindings = (NSArray *)v6;

  }
  return v5;
}

- (MLModelStructureProgramArgument)initWithMILArguments:(const void *)a3
{
  void *v5;
  MIL::IRArgument **v6;
  MIL::IRArgument **v7;
  void *v8;
  uint64_t Name;
  uint64_t v10;
  MLModelStructureProgramValue *v11;
  MLModelStructureProgramBinding *v12;
  MLModelStructureProgramArgument *v13;
  NSObject *v15;
  uint8_t v16[16];

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(MIL::IRArgument ***)a3;
  v7 = (MIL::IRArgument **)*((_QWORD *)a3 + 1);
  if (*(MIL::IRArgument ***)a3 == v7)
  {
LABEL_10:
    self = -[MLModelStructureProgramArgument initWithBindings:](self, "initWithBindings:", v5);
    v13 = self;
    goto LABEL_11;
  }
  while (1)
  {
    if ((*(uint64_t (**)(MIL::IRArgument *))(*(_QWORD *)*v6 + 32))(*v6))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      Name = MIL::IRArgument::GetName(*v6);
      if (*(char *)(Name + 23) >= 0)
        v10 = Name;
      else
        v10 = *(_QWORD *)Name;
      objc_msgSend(v8, "stringWithUTF8String:", v10);
      v11 = (MLModelStructureProgramValue *)objc_claimAutoreleasedReturnValue();
      v12 = -[MLModelStructureProgramBinding initWithName:]([MLModelStructureProgramBinding alloc], "initWithName:", v11);
      objc_msgSend(v5, "addObject:", v12);
      goto LABEL_9;
    }
    if (!(*(uint64_t (**)(MIL::IRArgument *))(*(_QWORD *)*v6 + 40))(*v6))
      break;
    v11 = -[MLModelStructureProgramValue initWithMILValue:]([MLModelStructureProgramValue alloc], "initWithMILValue:", MIL::IRArgument::GetValue(*v6));
    v12 = -[MLModelStructureProgramBinding initWithValue:]([MLModelStructureProgramBinding alloc], "initWithValue:", v11);
    objc_msgSend(v5, "addObject:", v12);
LABEL_9:

    v6 += 2;
    if (v6 == v7)
      goto LABEL_10;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "This is a logic error, encountered unexpected value when constructing MLModelStructureProgramArgument.", v16, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This is a logic error, encountered unexpected value when constructing MLModelStructureProgramArgument."));
  v13 = 0;
LABEL_11:

  return v13;
}

- (NSArray)bindings
{
  return self->_bindings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindings, 0);
}

@end
