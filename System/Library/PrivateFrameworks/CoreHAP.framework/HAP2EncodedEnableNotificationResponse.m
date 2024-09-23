@implementation HAP2EncodedEnableNotificationResponse

- (HAP2EncodedEnableNotificationResponse)initWithNotificationResponses:(id)a3
{
  return -[HAP2EncodedEnableNotificationResponse initWithNotificationResponses:updatedValues:](self, "initWithNotificationResponses:updatedValues:", a3, 0);
}

- (HAP2EncodedEnableNotificationResponse)initWithNotificationResponses:(id)a3 updatedValues:(id)a4
{
  id v7;
  HAP2EncodedEnableNotificationResponse *v8;
  HAP2EncodedEnableNotificationResponse *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2EncodedEnableNotificationResponse;
  v8 = -[HAP2EncodedCharacteristicResponse initWithCharacteristics:](&v11, sel_initWithCharacteristics_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_updatedValues, a4);

  return v9;
}

- (NSSet)updatedValues
{
  return self->_updatedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueResponses, 0);
  objc_storeStrong((id *)&self->_updatedValues, 0);
}

@end
