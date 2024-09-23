@implementation BWRenderListAnimator

+ (void)initialize
{
  objc_opt_class();
}

- (BWRenderListAnimator)initWithInitialParameters:(id)a3 initialRenderList:(id)a4 finalParameters:(id)a5 finalRenderList:(id)a6 animation:(int64_t)a7
{
  BWRenderListAnimator *v12;
  int64_t v13;
  uint64_t v14;
  BWRenderListRendererList *v15;
  unint64_t *v16;
  unint64_t *v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BWRenderListRendererNode *v31;
  id v32;
  BWRenderListRendererNode **p_slh_first;
  void *v34;
  BWRenderListParameterNode *v35;
  uint64_t v36;
  BWRenderListParameterList *v37;
  BWRenderListRendererNode *v38;
  id v39;
  BWRenderListRendererNode **p_var0;
  BWRenderListParameterNode *v41;
  uint64_t v42;
  BWRenderListParameterList *v43;
  BWRenderListRendererNode *v44;
  id v45;
  BWRenderListRendererNode **v46;
  BWRenderListParameterNode *v47;
  uint64_t v48;
  BWRenderListParameterList *v49;
  BWRenderListParameters *v51;
  BWRenderList *v52;
  int64_t v53;
  BWRenderListRendererList *v54;
  BWRenderListParameterList *v55;
  BWRenderListRendererNode *slh_first;
  BWRenderListParameterNode *v57;
  _QWORD *v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)BWRenderListAnimator;
  v12 = -[BWRenderListAnimator init](&v59, sel_init);
  if (!v12)
    return 0;
  v13 = (int64_t)v12;
  if (a7)
  {
    v12->_preparationMutexQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.render-list-animator.preparation", 0);
    *(_QWORD *)(v13 + 56) = a3;
    *(_QWORD *)(v13 + 48) = a4;
    *(_QWORD *)(v13 + 72) = a5;
    *(_QWORD *)(v13 + 64) = a6;
    v53 = a7;
    if ((objc_msgSend(*(id *)(v13 + 48), "affectsMetadata") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend(*(id *)(v13 + 64), "affectsMetadata");
    v52 = -[BWRenderList initWithAnimationSupported:affectsMetadata:]([BWRenderList alloc], "initWithAnimationSupported:affectsMetadata:", 1, v14);
    v15 = -[BWRenderList rendererList](v52, "rendererList");
    v16 = (unint64_t *)objc_msgSend(*(id *)(v13 + 48), "rendererList");
    v17 = (unint64_t *)objc_msgSend(*(id *)(v13 + 64), "rendererList");
    v51 = objc_alloc_init(BWRenderListParameters);
    v55 = -[BWRenderListParameters parameterList](v51, "parameterList");
    if (a3)
      v18 = a3;
    else
      v18 = a4;
    v19 = (_QWORD *)objc_msgSend(v18, "parameterList");
    if (a5)
      v20 = a5;
    else
      v20 = a6;
    v21 = (_QWORD *)objc_msgSend(v20, "parameterList");
    if (v16)
    {
      v22 = *v16;
      if (v17)
      {
LABEL_16:
        v23 = *v17;
        goto LABEL_19;
      }
    }
    else
    {
      v22 = 0;
      if (v17)
        goto LABEL_16;
    }
    v23 = 0;
LABEL_19:
    v54 = v15;
    if (v15)
    {
      slh_first = v15->slh_first;
      if (v19)
        goto LABEL_21;
    }
    else
    {
      slh_first = 0;
      if (v19)
      {
LABEL_21:
        v24 = (_QWORD *)*v19;
        if (v21)
        {
LABEL_22:
          v25 = (_QWORD *)*v21;
          goto LABEL_26;
        }
LABEL_25:
        v25 = 0;
LABEL_26:
        if (v55)
          v57 = v55->slh_first;
        else
          v57 = 0;
        while (1)
        {
          if (!(v22 | v23))
          {
            a7 = v13;
            *(_QWORD *)(v13 + 24) = v52;
            *(_QWORD *)(v13 + 32) = v51;
            -[BWRenderListAnimator _configureSpringSimulationWithAnimation:](v13, v53);
            return (BWRenderListAnimator *)a7;
          }
          if (v22)
          {
            v26 = *(void **)(v22 + 8);
            if (!v23)
              goto LABEL_31;
          }
          else
          {
            v26 = 0;
            if (!v23)
            {
LABEL_31:
              v27 = 0;
              if (!v24)
                goto LABEL_35;
              goto LABEL_32;
            }
          }
          v27 = *(void **)(v23 + 8);
          if (!v24)
          {
LABEL_35:
            v28 = 0;
            goto LABEL_36;
          }
LABEL_32:
          v28 = (void *)v24[1];
LABEL_36:
          v58 = v25;
          if (v25)
          {
            v29 = (void *)v25[1];
            if (!v26)
              goto LABEL_50;
LABEL_40:
            if (!v27)
              goto LABEL_50;
            v30 = objc_msgSend(v26, "type");
            if (v30 != objc_msgSend(v27, "type"))
              goto LABEL_50;
            v31 = (BWRenderListRendererNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
            v32 = v27;
            p_slh_first = &v54->slh_first;
            if (slh_first)
              p_slh_first = &slh_first->var0.var0;
            v31->var0.var0 = *p_slh_first;
            v31->var1 = v32;
            *p_slh_first = v31;
            if (v28)
              v34 = v28;
            else
              v34 = v29;
            v35 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
            v36 = objc_msgSend(v34, "copyWithZone:", 0);
            v37 = v55;
            if (v57)
              v37 = (BWRenderListParameterList *)v57;
            *(_QWORD *)v35 = v37->slh_first;
            *((_QWORD *)v35 + 1) = v36;
            v37->slh_first = v35;
            v22 = *(_QWORD *)v22;
            v24 = (_QWORD *)*v24;
            v23 = *(_QWORD *)v23;
            v25 = (_QWORD *)*v58;
            slh_first = v31;
            v57 = v35;
          }
          else
          {
            v29 = 0;
            if (v26)
              goto LABEL_40;
LABEL_50:
            if (v22)
            {
              v38 = (BWRenderListRendererNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              v39 = v26;
              p_var0 = &v54->slh_first;
              if (slh_first)
                p_var0 = &slh_first->var0.var0;
              v38->var0.var0 = *p_var0;
              v38->var1 = v39;
              *p_var0 = v38;
              v41 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              v42 = objc_msgSend(v28, "copyWithZone:", 0);
              v43 = v55;
              if (v57)
                v43 = (BWRenderListParameterList *)v57;
              *(_QWORD *)v41 = v43->slh_first;
              *((_QWORD *)v41 + 1) = v42;
              v43->slh_first = v41;
              v22 = *(_QWORD *)v22;
              v24 = (_QWORD *)*v24;
              slh_first = v38;
              v57 = v41;
              v25 = v58;
            }
            else if (v23)
            {
              v44 = (BWRenderListRendererNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              v45 = v27;
              v46 = &v54->slh_first;
              if (slh_first)
                v46 = &slh_first->var0.var0;
              v44->var0.var0 = *v46;
              v44->var1 = v45;
              *v46 = v44;
              v47 = (BWRenderListParameterNode *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
              v48 = objc_msgSend(v29, "copyWithZone:", 0);
              v22 = 0;
              v49 = v55;
              if (v57)
                v49 = (BWRenderListParameterList *)v57;
              *(_QWORD *)v47 = v49->slh_first;
              *((_QWORD *)v47 + 1) = v48;
              v49->slh_first = v47;
              v23 = *(_QWORD *)v23;
              v25 = (_QWORD *)*v58;
              slh_first = v44;
              v57 = v47;
            }
            else
            {
              v22 = 0;
              v23 = 0;
              v25 = v58;
            }
          }
        }
      }
    }
    v24 = 0;
    if (v21)
      goto LABEL_22;
    goto LABEL_25;
  }

  return (BWRenderListAnimator *)a7;
}

- (uint64_t)_configureSpringSimulationWithAnimation:(uint64_t)result
{
  uint64_t v3;
  BWSpringSimulation *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  int v9;
  double v10;
  double v11;
  uint64_t v12;

  if (result)
  {
    v3 = result;
    v4 = objc_alloc_init(BWSpringSimulation);
    *(_QWORD *)(v3 + 40) = v4;
    -[BWSpringSimulation resetWithInput:initialOutput:initialVelocity:](v4, "resetWithInput:initialOutput:initialVelocity:", 1.0, 0.0, 0.0);
    v5 = *(void **)(v3 + 56);
    if (!v5)
      v5 = *(void **)(v3 + 48);
    v6 = (_QWORD *)objc_msgSend(v5, "parameterList");
    v7 = *(void **)(v3 + 72);
    if (!v7)
      v7 = *(void **)(v3 + 64);
    v8 = (_QWORD *)objc_msgSend(v7, "parameterList");
    v9 = -[BWRenderListAnimator _parametersContainLiveStageRendering:](v3, v6);
    result = -[BWRenderListAnimator _parametersContainLiveStageRendering:](v3, v8);
    if (v9 == (_DWORD)result)
    {
      v12 = a2 - 1;
      if ((unint64_t)(a2 - 1) > 2)
        return result;
      v11 = dbl_1A32A21A8[v12];
      v10 = dbl_1A32A21C0[v12];
    }
    else
    {
      v10 = 15.0;
      v11 = 100.0;
    }
    objc_msgSend(*(id *)(v3 + 40), "setTension:", v11);
    return objc_msgSend(*(id *)(v3 + 40), "setFriction:", v10);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWRenderListAnimator;
  -[BWRenderListAnimator dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> prepared:%d completed:%d, inputInitialRenderListParameters:%@ inputInitialRenderList:%@, inputFinalRenderListParameters:%@, inputFinalRenderList:%@"), objc_opt_class(), self, -[BWRenderListAnimator isPrepared](self, "isPrepared"), -[BWRenderListAnimator isCompleted](self, "isCompleted"), self->_initialParameters, self->_initialRenderList, self->_finalParameters, self->_finalRenderList);
}

- (BOOL)isPrepared
{
  NSObject *preparationMutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  preparationMutexQueue = self->_preparationMutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__BWRenderListAnimator_isPrepared__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(preparationMutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__BWRenderListAnimator_isPrepared__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)setPrepared:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __36__BWRenderListAnimator_setPrepared___block_invoke;
    v3[3] = &unk_1E491EE18;
    v3[4] = a1;
    v4 = a2;
    dispatch_sync(v2, v3);
  }
}

uint64_t __36__BWRenderListAnimator_setPrepared___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (void)prepareWithInputVideoFormat:(id)a3 inputMediaPropertiesByAttachedMediaKey:(id)a4
{
  if (!-[BWRenderListAnimator isPrepared](self, "isPrepared"))
  {
    -[BWRenderList prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:](self->_initialRenderList, "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", self->_initialParameters, a3, a4);
    -[BWRenderList prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:](self->_finalRenderList, "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", self->_finalParameters, a3, a4);
    -[BWRenderList prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:](self->_interpolatingRenderList, "prepareWithParameters:forInputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", self->_interpolatingParameters, a3, a4);
    -[BWRenderListAnimator setPrepared:]((uint64_t)self, 1);
  }
}

- (uint64_t)_parametersContainLiveStageRendering:(uint64_t)a1
{
  uint64_t result;
  _QWORD *v4;
  void *v5;

  result = 0;
  if (a1 && a2)
  {
    v4 = (_QWORD *)*a2;
    if (*a2)
    {
      while (1)
      {
        v5 = (void *)v4[1];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v5, "renderingStrategy") == 5 || objc_msgSend(v5, "renderingStrategy") == 7))
        {
          break;
        }
        v4 = (_QWORD *)*v4;
        if (!v4)
          return 0;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)interpolateParameters
{
  double v3;
  float v4;
  double v5;
  double v6;
  double v7;
  void *initialParameters;
  unint64_t *v9;
  void *finalParameters;
  unint64_t *v11;
  BWRenderListParameters **p_interpolatingParameters;
  BWRenderListParameters *interpolatingParameters;
  BWRenderListParameterList *v14;
  unint64_t v15;
  unint64_t v16;
  BWRenderListParameterNode *slh_first;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  double v23;
  int v24;
  double v25;
  int v26;
  double v27;

  -[BWSpringSimulation update](self->_springSimulation, "update");
  -[BWSpringSimulation output](self->_springSimulation, "output");
  if (v3 >= 1.0 || (-[BWSpringSimulation output](self->_springSimulation, "output"), v4 = 0.0, v5 > 0.0))
  {
    -[BWSpringSimulation output](self->_springSimulation, "output");
    v4 = 1.0;
    if (v6 < 1.0)
    {
      -[BWSpringSimulation output](self->_springSimulation, "output");
      v4 = v7;
    }
  }
  if (!-[BWSpringSimulation isCompleted](self->_springSimulation, "isCompleted") && v4 <= 0.998)
  {
    initialParameters = self->_initialParameters;
    if (!initialParameters)
      initialParameters = self->_initialRenderList;
    v9 = (unint64_t *)objc_msgSend(initialParameters, "parameterList", v4);
    finalParameters = self->_finalParameters;
    if (!finalParameters)
      finalParameters = self->_finalRenderList;
    v11 = (unint64_t *)objc_msgSend(finalParameters, "parameterList");
    interpolatingParameters = self->_interpolatingParameters;
    p_interpolatingParameters = &self->_interpolatingParameters;
    v14 = -[BWRenderListParameters parameterList](interpolatingParameters, "parameterList");
    if (v9)
    {
      v15 = *v9;
      if (v11)
        goto LABEL_13;
    }
    else
    {
      v15 = 0;
      if (v11)
      {
LABEL_13:
        v16 = *v11;
        if (v14)
        {
LABEL_14:
          slh_first = v14->slh_first;
          goto LABEL_43;
        }
        goto LABEL_18;
      }
    }
    v16 = 0;
    if (v14)
      goto LABEL_14;
LABEL_18:
    slh_first = 0;
    while (1)
    {
LABEL_43:
      if (!(v15 | v16))
        return *p_interpolatingParameters;
      if (v15)
      {
        v18 = *(void **)(v15 + 8);
        if (!v16)
          goto LABEL_21;
      }
      else
      {
        v18 = 0;
        if (!v16)
        {
LABEL_21:
          v19 = 0;
          if (!slh_first)
            goto LABEL_41;
          goto LABEL_25;
        }
      }
      v19 = *(void **)(v16 + 8);
      if (!slh_first)
        goto LABEL_41;
LABEL_25:
      v20 = (void *)*((_QWORD *)slh_first + 1);
      if (v18
        && v19
        && v20
        && (v21 = objc_msgSend(v18, "type"), v21 == objc_msgSend(v19, "type"))
        && (v22 = objc_msgSend(v18, "type"), v22 == objc_msgSend(v20, "type")))
      {
        *(float *)&v23 = v4;
        objc_msgSend(v20, "updateByInterpolatingFromParameters:toParameters:withFractionComplete:", v18, v19, v23);
        v15 = *(_QWORD *)v15;
LABEL_39:
        v16 = *(_QWORD *)v16;
LABEL_40:
        slh_first = *(BWRenderListParameterNode **)slh_first;
      }
      else
      {
        if (v18)
        {
          if (v20)
          {
            v24 = objc_msgSend(v18, "type");
            if (v24 == objc_msgSend(v20, "type"))
            {
              *(float *)&v25 = v4;
              objc_msgSend(v20, "updateByInterpolatingFromParameters:toParameters:withFractionComplete:", v18, 0, v25);
              v15 = *(_QWORD *)v15;
              goto LABEL_40;
            }
          }
        }
        if (v19)
        {
          if (v20)
          {
            v26 = objc_msgSend(v19, "type");
            if (v26 == objc_msgSend(v20, "type"))
            {
              *(float *)&v27 = v4;
              objc_msgSend(v20, "updateByInterpolatingFromParameters:toParameters:withFractionComplete:", 0, v19, v27);
              goto LABEL_39;
            }
          }
        }
LABEL_41:
        if (v15 != 0 || v16 != 0)
          return *p_interpolatingParameters;
        v15 = 0;
        v16 = 0;
      }
    }
  }
  p_interpolatingParameters = &self->_interpolatingParameters;
  return *p_interpolatingParameters;
}

- (BOOL)isCompleted
{
  double v4;

  if (-[BWSpringSimulation isCompleted](self->_springSimulation, "isCompleted"))
    return 1;
  -[BWSpringSimulation output](self->_springSimulation, "output");
  return v4 > 0.998;
}

- (BWRenderList)renderList
{
  return self->_interpolatingRenderList;
}

- (BWRenderListParameters)parameters
{
  return self->_interpolatingParameters;
}

- (BWRenderList)initialRenderList
{
  return self->_initialRenderList;
}

- (BWRenderListParameters)initialParameters
{
  return self->_initialParameters;
}

- (BWRenderList)finalRenderList
{
  return self->_finalRenderList;
}

- (BWRenderListParameters)finalParameters
{
  return self->_finalParameters;
}

@end
