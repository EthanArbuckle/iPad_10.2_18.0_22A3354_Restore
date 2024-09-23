@implementation EspressoTrainingInnerProductWeightsForMPS

- (EspressoTrainingInnerProductWeightsForMPS)initWithParams:(inner_product_uniforms *)a3 forMode:(BOOL)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  objc_super v9;
  _OWORD v10[8];
  int disable_bnns_client_ptr;

  v4 = *(_OWORD *)&a3->sparse_block_size_y;
  v10[6] = *(_OWORD *)&a3->n8_splitk;
  v10[7] = v4;
  disable_bnns_client_ptr = a3->disable_bnns_client_ptr;
  v5 = *(_OWORD *)&a3->use_raw_buffers;
  v10[2] = *(_OWORD *)&a3->is_lookup;
  v10[3] = v5;
  v6 = *(_OWORD *)&a3->Bbytes;
  v10[4] = *(_OWORD *)&a3->m;
  v10[5] = v6;
  v7 = *(_OWORD *)&a3->has_tanh;
  v10[0] = *(_OWORD *)&a3->nC;
  v10[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)EspressoTrainingInnerProductWeightsForMPS;
  return -[EspressoInnerProductWeightsForMPS initWithParams:](&v9, sel_initWithParams_, v10, a4);
}

- (void)weights
{
  return (void *)-[MTLBuffer contents](self->_weightsBuffer, "contents");
}

- (float)biasTerms
{
  return (float *)-[MTLBuffer contents](self->_biasesBuffer, "contents");
}

- (BOOL)ready
{
  return 1;
}

- (MTLBuffer)weightsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWeightsBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (MTLBuffer)biasesBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBiasesBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesBuffer, 0);
  objc_storeStrong((id *)&self->_weightsBuffer, 0);
}

@end
