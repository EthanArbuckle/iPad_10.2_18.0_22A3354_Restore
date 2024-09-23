@implementation JFXCompositionPlayableElementUpdateRequest

- (JFXCompositionPlayableElementUpdateRequest)initWithBlock:(id)a3 withClip:(id)a4
{
  id v6;
  JFXCompositionPlayableElementUpdateRequest *v7;
  uint64_t v8;
  NSString *clipUUID;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JFXCompositionPlayableElementUpdateRequest;
  v7 = -[JFXCompositionPlayerRequest initWithBlock:ofType:](&v11, sel_initWithBlock_ofType_, a3, 5);
  if (v7)
  {
    objc_msgSend(v6, "uuid");
    v8 = objc_claimAutoreleasedReturnValue();
    clipUUID = v7->_clipUUID;
    v7->_clipUUID = (NSString *)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)JFXCompositionPlayableElementUpdateRequest;
  -[JFXCompositionPlayerRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXCompositionPlayableElementUpdateRequest clipUUID](self, "clipUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ clipID:%@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)clipUUID
{
  return self->_clipUUID;
}

- (void)setClipUUID:(id)a3
{
  objc_storeStrong((id *)&self->_clipUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipUUID, 0);
}

@end
