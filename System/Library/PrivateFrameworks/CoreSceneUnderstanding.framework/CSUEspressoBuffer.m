@implementation CSUEspressoBuffer

- (CSUEspressoBuffer)initWithEspressoBuffer:(id *)a3
{
  char *v4;
  CSUEspressoBuffer *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CSUEspressoBuffer;
  v4 = -[CSUEspressoBuffer init](&v16, sel_init);
  v5 = (CSUEspressoBuffer *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0;
    v7 = *(_OWORD *)a3->var2;
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->var2[2];
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    v8 = *(_OWORD *)a3->var3;
    v9 = *(_OWORD *)&a3->var3[2];
    v10 = *(_OWORD *)&a3->var4;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->var6;
    *(_OWORD *)(v4 + 88) = v10;
    *(_OWORD *)(v4 + 72) = v9;
    *(_OWORD *)(v4 + 56) = v8;
    v11 = *(_OWORD *)&a3->var8;
    v12 = *(_OWORD *)&a3->var10;
    v13 = *(_OWORD *)&a3->var12;
    *((_QWORD *)v4 + 21) = *(_QWORD *)&a3->var14;
    *(_OWORD *)(v4 + 152) = v13;
    *(_OWORD *)(v4 + 136) = v12;
    *(_OWORD *)(v4 + 120) = v11;
    v14 = v4;
  }

  return v5;
}

+ (id)fromEspressoBuffer:(id *)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v14[10];
  uint64_t v15;

  v4 = objc_alloc((Class)a1);
  v5 = *(_OWORD *)&a3->var12;
  v14[8] = *(_OWORD *)&a3->var10;
  v14[9] = v5;
  v15 = *(_QWORD *)&a3->var14;
  v6 = *(_OWORD *)&a3->var4;
  v14[4] = *(_OWORD *)&a3->var3[2];
  v14[5] = v6;
  v7 = *(_OWORD *)&a3->var8;
  v14[6] = *(_OWORD *)&a3->var6;
  v14[7] = v7;
  v8 = *(_OWORD *)a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v8;
  v9 = *(_OWORD *)a3->var3;
  v14[2] = *(_OWORD *)&a3->var2[2];
  v14[3] = v9;
  return (id)objc_msgSend_initWithEspressoBuffer_(v4, v10, (uint64_t)v14, v11, v12);
}

- (const)espressoBuffer
{
  return (const $FD4688982923A924290ECB669CAF1EC2 *)&self->_buffer;
}

- (void)accessDataUsingBlock:(id)a3
{
  void (**v4)(id, void *, unint64_t);

  v4 = (void (**)(id, void *, unint64_t))a3;
  espresso_buffer_get_rank();
  v4[2](v4, self->_buffer.data, 4 * self->_buffer.stride_sequence_length * self->_buffer.sequence_length);

}

@end
