@implementation ADJasperColorExecutorParameters

- (id)initForDevice:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorExecutorParameters;
  v5 = -[ADExecutorParameters initForDevice:](&v9, sel_initForDevice_, v4);
  if (v5)
  {
    v6 = -[ADJasperColorPipelineParameters initForDevice:]([ADJasperColorPipelineParameters alloc], "initForDevice:", v4);
    v7 = (void *)v5[7];
    v5[7] = v6;

    *((_BYTE *)v5 + 48) = 0;
    *((_BYTE *)v5 + 50) = 1;
    *((_BYTE *)v5 + 49) = 1;
    v5[8] = 0;
  }

  return v5;
}

- (void)setDoTemporalConsistency:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint8_t v6[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "the doTemporalConsistency property is deprecated. please use temporalConsistencyMethod instead", v6, 2u);
  }
  v5 = 2;
  if (!v3)
    v5 = 0;
  self->_temporalConsistencyMethod = v5;
  self->_doTemporalConsistency = v3;
}

- (ADJasperColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (BOOL)doTemporalConsistency
{
  return self->_doTemporalConsistency;
}

- (BOOL)useAlphaMapForTemporalConsistency
{
  return self->_useAlphaMapForTemporalConsistency;
}

- (void)setUseAlphaMapForTemporalConsistency:(BOOL)a3
{
  self->_useAlphaMapForTemporalConsistency = a3;
}

- (BOOL)doComputeNormals
{
  return self->_doComputeNormals;
}

- (void)setDoComputeNormals:(BOOL)a3
{
  self->_doComputeNormals = a3;
}

- (unint64_t)temporalConsistencyMethod
{
  return self->_temporalConsistencyMethod;
}

- (void)setTemporalConsistencyMethod:(unint64_t)a3
{
  self->_temporalConsistencyMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

@end
