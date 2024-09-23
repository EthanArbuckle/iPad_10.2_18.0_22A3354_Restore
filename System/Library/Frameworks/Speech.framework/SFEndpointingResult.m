@implementation SFEndpointingResult

- (SFEndpointingResult)initWithRange:(id *)a3 wordCount:(int64_t)a4 eosLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7
{
  id v12;
  char *v13;
  SFEndpointingResult *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  NSArray *pauseCounts;
  objc_super v20;

  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFEndpointingResult;
  v13 = -[SFEndpointingResult init](&v20, sel_init);
  v14 = (SFEndpointingResult *)v13;
  if (v13)
  {
    v15 = *(_OWORD *)&a3->var0.var0;
    v16 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v13 + 72) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v13 + 56) = v16;
    *(_OWORD *)(v13 + 40) = v15;
    *((_QWORD *)v13 + 1) = a4;
    *((double *)v13 + 2) = a5;
    v17 = objc_msgSend(v12, "copy");
    pauseCounts = v14->_pauseCounts;
    v14->_pauseCounts = (NSArray *)v17;

    v14->_silencePosterior = a7;
  }

  return v14;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)range
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (double)eosLikelihood
{
  return self->_eosLikelihood;
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseCounts, 0);
}

@end
