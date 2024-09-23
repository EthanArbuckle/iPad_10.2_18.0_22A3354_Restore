@implementation JFXCompositionSeekRequest

- (JFXCompositionSeekRequest)initWithBlock:(id)a3 withSeekTime:(int)a4
{
  JFXCompositionSeekRequest *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXCompositionSeekRequest;
  result = -[JFXCompositionPlayerRequest initWithBlock:ofType:](&v6, sel_initWithBlock_ofType_, a3, 4);
  if (result)
    result->_seekTime = a4;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)JFXCompositionSeekRequest;
  -[JFXCompositionPlayerRequest description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ seekTime:%d>"), v4, -[JFXCompositionSeekRequest seekTime](self, "seekTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int)seekTime
{
  return self->_seekTime;
}

- (void)setSeekTime:(int)a3
{
  self->_seekTime = a3;
}

@end
