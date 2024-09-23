@implementation HMDAddActionSetLogEvent

- (HMDAddActionSetLogEvent)initWithActionSetType:(id)a3 homeUUID:(id)a4
{
  id v7;
  HMDAddActionSetLogEvent *v8;
  HMDAddActionSetLogEvent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAddActionSetLogEvent;
  v8 = -[HMMHomeLogEvent initWithHomeUUID:](&v11, sel_initWithHomeUUID_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_actionSetType, a3);

  return v9;
}

- (NSString)actionSetType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetType, 0);
}

@end
