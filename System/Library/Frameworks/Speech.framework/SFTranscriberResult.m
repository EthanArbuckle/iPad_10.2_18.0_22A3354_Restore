@implementation SFTranscriberResult

- (SFTranscriberResult)initWithRange:(id *)a3 normalizedTranscriberMultisegmentResult:(id)a4 contextualizedTranscriberMultisegmentResult:(id)a5
{
  id v7;
  id v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SFTranscriberResult;
  v7 = a5;
  v8 = a4;
  v9 = -[SFTranscriberResult init](&v17, sel_init);
  v11 = *(_OWORD *)&a3->var0.var3;
  v10 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v9 + 24) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v9 + 40) = v11;
  *(_OWORD *)(v9 + 56) = v10;
  v12 = objc_msgSend(v8, "copy", v17.receiver, v17.super_class);

  v13 = (void *)*((_QWORD *)v9 + 1);
  *((_QWORD *)v9 + 1) = v12;

  v14 = objc_msgSend(v7, "copy");
  v15 = (void *)*((_QWORD *)v9 + 2);
  *((_QWORD *)v9 + 2) = v14;

  return (SFTranscriberResult *)v9;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)range
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (STTranscriberMultisegmentResult)normalizedTranscriberMultisegmentResult
{
  return self->_normalizedTranscriberMultisegmentResult;
}

- (STTranscriberMultisegmentResult)contextualizedTranscriberMultisegmentResult
{
  return self->_contextualizedTranscriberMultisegmentResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualizedTranscriberMultisegmentResult, 0);
  objc_storeStrong((id *)&self->_normalizedTranscriberMultisegmentResult, 0);
}

@end
