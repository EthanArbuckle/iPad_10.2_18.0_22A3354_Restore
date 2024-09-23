@implementation DEDialogState

- (DEDialogState)initWithCatId:(id)a3
{
  id v4;
  DEDialogState *v5;
  DEDialogState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDialogState;
  v5 = -[DEDialogState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[DEDialogState setCatId:](v5, "setCatId:", v4);

  return v6;
}

- (DialogStateUseCase)getUseCase
{
  DialogStateUseCase *v4;
  siri::dialogengine *v5;
  id v6;

  if (*(_QWORD *)&self->var0.var1)
  {
    v4 = self;
    +[DEBundle frameworkUserSettings](DEBundle, "frameworkUserSettings");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryForKey:", *(_QWORD *)&v4->var0.var1);
    v5 = (siri::dialogengine *)objc_claimAutoreleasedReturnValue();
    siri::dialogengine::DialogStateUseCaseFromNSDictionary(v5, retstr);

  }
  else
  {
    retstr->var0.var0 = 0;
    retstr->var0.var1 = 0.0;
    retstr->var1.var0.var1.var0.var0 = 0;
    retstr->var1.var0.var0 = &retstr->var1.var0.var1;
    retstr->var2.var0.var1.var0.var0 = 0;
    retstr->var1.var0.var2.var0 = 0;
    retstr->var2.var0.var0 = &retstr->var2.var0.var1;
    retstr->var3.var0.var2.var0 = 0;
    retstr->var3.var0.var1.var0.var0 = 0;
    retstr->var2.var0.var2.var0 = 0;
    retstr->var3.var0.var0 = &retstr->var3.var0.var1;
  }
  return self;
}

- (DialogStateFamily)getFamily
{
  NSString *catId;
  unint64_t v3;
  void *v4;
  void **v5;
  void *v6;
  siri::dialogengine *v7;
  NSDictionary *v8;
  uint64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  void *__p[2];
  unsigned __int8 v15;
  void *v16[2];
  char v17;
  DialogStateFamily result;

  catId = self->_catId;
  if (!catId)
  {
    v9 = 0;
    v11 = 0.0;
    goto LABEL_13;
  }
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)-[NSString UTF8String](catId, "UTF8String"));
  siri::dialogengine::GetFamilyIdFromCatId((unsigned __int8 *)v16, (uint64_t)__p);
  v3 = v15;
  if ((v15 & 0x80u) != 0)
    v3 = (unint64_t)__p[1];
  if (v3)
  {
    +[DEBundle frameworkUserSettings](DEBundle, "frameworkUserSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v15 & 0x80u) == 0)
      v5 = __p;
    else
      v5 = (void **)__p[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryForKey:", v6);
    v7 = (siri::dialogengine *)objc_claimAutoreleasedReturnValue();
    v9 = siri::dialogengine::DialogStateFamilyFromNSDictionary(v7, v8);
    v11 = v10;

    if ((v15 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = 0;
  v11 = 0.0;
  if ((v15 & 0x80) != 0)
LABEL_9:
    operator delete(__p[0]);
LABEL_10:
  if (v17 < 0)
    operator delete(v16[0]);
LABEL_13:
  v12 = v9;
  v13 = v11;
  result.var0.var1 = v13;
  result.var0.var0 = v12;
  return result;
}

- (NSString)catId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCatId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catId, 0);
}

@end
