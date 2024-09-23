@implementation HMIStationaryObject

- (HMIStationaryObject)initWithEvent:(id)a3 time:(id *)a4
{
  id v7;
  HMIStationaryObject *v8;
  HMIStationaryObject *v9;
  int64_t var3;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMIStationaryObject;
  v8 = -[HMIStationaryObject init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_event, a3);
    var3 = a4->var3;
    *(_OWORD *)&v9->_time.value = *(_OWORD *)&a4->var0;
    v9->_time.epoch = var3;
  }

  return v9;
}

- (HMIVideoAnalyzerEvent)event
{
  return (HMIVideoAnalyzerEvent *)objc_getProperty(self, a2, 8, 1);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
