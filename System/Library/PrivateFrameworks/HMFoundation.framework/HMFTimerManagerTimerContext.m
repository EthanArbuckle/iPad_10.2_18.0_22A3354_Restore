@implementation HMFTimerManagerTimerContext

+ (id)comparator
{
  if (_MergedGlobals_54 != -1)
    dispatch_once(&_MergedGlobals_54, &__block_literal_global_1);
  return (id)MEMORY[0x1A1AC373C](qword_1ED0130D8);
}

void __41__HMFTimerManagerTimerContext_comparator__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED0130D8;
  qword_1ED0130D8 = (uint64_t)&__block_literal_global_2;

}

uint64_t __41__HMFTimerManagerTimerContext_comparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "expirationTime");
  v7 = v6;
  objc_msgSend(v5, "expirationTime");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "expirationTime");
    v11 = v10;
    objc_msgSend(v5, "expirationTime");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

- (HMFTimerManagerTimerContext)initWithObject:(id)a3 expirationTime:(double)a4
{
  id v7;
  HMFTimerManagerTimerContext *v8;
  HMFTimerManagerTimerContext *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMFTimerManagerTimerContext;
  v8 = -[HMFTimerManagerTimerContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_object, a3);
    v9->_expirationTime = a4;
  }

  return v9;
}

- (NSObject)object
{
  return objc_getProperty(self, a2, 8, 1);
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
