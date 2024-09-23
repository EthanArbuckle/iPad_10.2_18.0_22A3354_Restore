@implementation CMViewObstructedStateEvent

- (CMViewObstructedStateEvent)initWithShouldSupress:(BOOL)a3 currentState:(unsigned __int8)a4 orientation:(id)a5 motionType:(id)a6 lux:(float)a7 pocketProbability:(float)a8 meanProbabilitiesFloatArray:(id)a9
{
  uint64_t v14;
  _BOOL8 v15;
  CMViewObstructedStateEvent *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CMViewObstructedStateEvent *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v44;

  v14 = a4;
  v15 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CMViewObstructedStateEvent;
  v16 = -[CMViewObstructedStateEvent init](&v44, sel_init);
  v20 = v16;
  if (v16)
  {
    objc_msgSend_setShouldSuppress_(v16, v17, v15, v18, v19);
    objc_msgSend_setCurrentState_(v20, v21, v14, v22, v23);
    objc_msgSend_setOrientation_(v20, v24, (uint64_t)a5, v25, v26);
    objc_msgSend_setMotionType_(v20, v27, (uint64_t)a6, v28, v29);
    *(float *)&v30 = a7;
    objc_msgSend_setLux_(v20, v31, v32, v33, v34, v30);
    *(float *)&v35 = a8;
    objc_msgSend_setPocketProbability_(v20, v36, v37, v38, v39, v35);
    objc_msgSend_setMeanProbabilities_(v20, v40, (uint64_t)a9, v41, v42);
  }
  return v20;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSArray *meanProbabilities;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  float v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  NSString *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("["), v2, v3);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  meanProbabilities = self->_meanProbabilities;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(meanProbabilities, v7, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    v13 = v8;
    v14 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(meanProbabilities);
        objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v30 + 1) + 8 * i), v9, v10, v11, v12);
        v5 = (void *)objc_msgSend_stringByAppendingFormat_(v5, v17, (uint64_t)CFSTR("%f,"), v18, v19, v16);
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(meanProbabilities, v9, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v13);
  }
  v20 = objc_msgSend_length(v5, v9, v10, v11, v12);
  v22 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v5, v21, v20 - 1, 1, (uint64_t)CFSTR("]"));
  v23 = (void *)MEMORY[0x1E0CB3940];
  v24 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v24);
  return (id)objc_msgSend_stringWithFormat_(v23, v26, (uint64_t)CFSTR("%@ shouldSuppress=%u,CurrentState=%u,Orientation=%@,MotionType=%@,Lux=%f,PocketProbability=%f,MeanProbabilities=%@"), v27, v28, v25, self->_shouldSuppress, self->_currentState, self->_orientation, self->_motionType, self->_lux, self->_pocketProbability, v22);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMViewObstructedStateEvent;
  -[CMViewObstructedStateEvent dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldSuppress
{
  return self->_shouldSuppress;
}

- (void)setShouldSuppress:(BOOL)a3
{
  self->_shouldSuppress = a3;
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unsigned __int8)a3
{
  self->_currentState = a3;
}

- (NSString)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (float)lux
{
  return self->_lux;
}

- (void)setLux:(float)a3
{
  self->_lux = a3;
}

- (float)pocketProbability
{
  return self->_pocketProbability;
}

- (void)setPocketProbability:(float)a3
{
  self->_pocketProbability = a3;
}

- (NSArray)meanProbabilities
{
  return self->_meanProbabilities;
}

- (void)setMeanProbabilities:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
