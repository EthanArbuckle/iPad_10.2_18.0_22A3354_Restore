@implementation ICCRRegister

+ (id)registerWithType:(unint64_t)a3 contents:(id)a4
{
  return +[ICCRRegister registerWithType:contents:document:](ICCRRegister, "registerWithType:contents:document:", a3, a4, 0);
}

+ (id)registerWithType:(unint64_t)a3 contents:(id)a4 document:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a5;
  if (a3 > 4)
    v9 = 0;
  else
    v9 = (void *)objc_msgSend(objc_alloc(*off_1E76C8D08[a3]), "initWithContents:document:", v7, v8);

  return v9;
}

- (ICCRRegister)initWithDocument:(id)a3
{
  id v4;
  ICCRRegister *v5;
  ICCRRegister *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCRRegister;
  v5 = -[ICCRRegister init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_document, v4);

  return v6;
}

- (BOOL)isEqualContents:(id)a3
{
  return 0;
}

- (void)mergeWith:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Subclass must implement."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Subclass must implement."), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)walkGraph:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Subclass must implement."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)tombstone
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot tombstone a non-value / non-identified object."), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Subclass must implement."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (ICCRRegister)initWithICCRCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Subclass must implement."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (ICCRDocument)document
{
  return (ICCRDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->_document, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_document);
}

@end
