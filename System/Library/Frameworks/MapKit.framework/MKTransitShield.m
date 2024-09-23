@implementation MKTransitShield

- (MKTransitShield)initWithShieldType:(int64_t)a3 text:(id)a4 color:(id)a5
{
  id v8;
  id v9;
  MKTransitShield *v10;
  MKTransitShield *v11;
  uint64_t v12;
  NSString *shieldText;
  uint64_t v14;
  NSString *shieldColorString;
  MKTransitShield *v16;
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKTransitShield;
  v10 = -[MKTransitShield init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_shieldType = a3;
    v12 = objc_msgSend(v8, "copy");
    shieldText = v11->_shieldText;
    v11->_shieldText = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    shieldColorString = v11->_shieldColorString;
    v11->_shieldColorString = (NSString *)v14;

    v16 = v11;
  }

  return v11;
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (NSString)shieldColorString
{
  return self->_shieldColorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldColorString, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
}

@end
