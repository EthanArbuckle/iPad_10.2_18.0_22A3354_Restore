@implementation EspressoTrainingConvolutionWeightsForMPS

- (EspressoTrainingConvolutionWeightsForMPS)initWithParams:(convolution_uniforms *)a3 forMode:(BOOL)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  EspressoTrainingConvolutionWeightsForMPS *result;
  objc_super v11;
  _OWORD v12[10];
  uint64_t v13;

  v5 = *(_OWORD *)&a3->low_precision_accumulation;
  v12[8] = *(_OWORD *)&a3->total_channel_bottom;
  v12[9] = v5;
  v13 = *(_QWORD *)&a3->disable_bnns_client_ptr;
  v6 = *(_OWORD *)&a3->pad.l;
  v12[4] = *(_OWORD *)&a3->fused_activation_alpha;
  v12[5] = v6;
  v7 = *(_OWORD *)&a3->has_batch_norm;
  v12[6] = *(_OWORD *)&a3->dilation_x;
  v12[7] = v7;
  v8 = *(_OWORD *)&a3->start_channel_low_priority_split;
  v12[0] = *(_OWORD *)&a3->W;
  v12[1] = v8;
  v9 = *(_OWORD *)&a3->Nx;
  v12[2] = *(_OWORD *)&a3->has_biases;
  v12[3] = v9;
  v11.receiver = self;
  v11.super_class = (Class)EspressoTrainingConvolutionWeightsForMPS;
  result = -[EspressoConvolutionWeightsForMPS initWithParams:](&v11, sel_initWithParams_, v12);
  *((_BYTE *)&result->super.data_type + 4) = a4;
  return result;
}

- (void)weights
{
  return (void *)objc_msgSend(*(id *)&self->is_training, "contents");
}

- (float)biasTerms
{
  return (float *)-[MTLBuffer contents](self->_weightsBuffer, "contents");
}

- (BOOL)ready
{
  return 1;
}

- (unsigned)weightsLayout
{
  return *((_BYTE *)&self->super.data_type + 4) == 0;
}

- (MTLBuffer)weightsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 296, 1);
}

- (void)setWeightsBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (MTLBuffer)biasesBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 304, 1);
}

- (void)setBiasesBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightsBuffer, 0);
  objc_storeStrong((id *)&self->is_training, 0);
}

@end
