@implementation ACCAssistiveTouchAccessory

- (ACCAssistiveTouchAccessory)initWithAccessoryUID:(id)a3
{
  id v5;
  ACCAssistiveTouchAccessory *v6;
  ACCAssistiveTouchAccessory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCAssistiveTouchAccessory;
  v6 = -[ACCAssistiveTouchAccessory init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryUID, a3);
    v7->_desiredAssistiveTouchState = 0;
  }

  return v7;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUID, a3);
}

- (BOOL)desiredAssistiveTouchState
{
  return self->_desiredAssistiveTouchState;
}

- (void)setDesiredAssistiveTouchState:(BOOL)a3
{
  self->_desiredAssistiveTouchState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end
