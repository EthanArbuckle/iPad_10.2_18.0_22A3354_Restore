@implementation STTranscriberMultisegmentResult

- (STTranscriberMultisegmentResult)initWithSegments:(id)a3 transcriptions:(id)a4 earResultType:(unint64_t)a5 nBestChoices:(id)a6 recognitionAudioRange:(id *)a7
{
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)STTranscriberMultisegmentResult;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = -[STTranscriberMultisegmentResult init](&v24, sel_init);
  v15 = objc_msgSend(v13, "copy", v24.receiver, v24.super_class);

  v16 = (void *)*((_QWORD *)v14 + 1);
  *((_QWORD *)v14 + 1) = v15;

  v17 = objc_msgSend(v12, "copy");
  v18 = (void *)*((_QWORD *)v14 + 2);
  *((_QWORD *)v14 + 2) = v17;

  *((_QWORD *)v14 + 3) = a5;
  v19 = objc_msgSend(v11, "copy");

  v20 = (void *)*((_QWORD *)v14 + 4);
  *((_QWORD *)v14 + 4) = v19;

  v21 = *(_OWORD *)&a7->var0.var0;
  v22 = *(_OWORD *)&a7->var0.var3;
  *(_OWORD *)(v14 + 72) = *(_OWORD *)&a7->var1.var1;
  *(_OWORD *)(v14 + 56) = v22;
  *(_OWORD *)(v14 + 40) = v21;
  return (STTranscriberMultisegmentResult *)v14;
}

- (NSArray)segments
{
  return self->_segments;
}

- (NSArray)transcriptions
{
  return self->_transcriptions;
}

- (unint64_t)earResultType
{
  return self->_earResultType;
}

- (NSArray)nBestChoices
{
  return self->_nBestChoices;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)recognitionAudioRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nBestChoices, 0);
  objc_storeStrong((id *)&self->_transcriptions, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
