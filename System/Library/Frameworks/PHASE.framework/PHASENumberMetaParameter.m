@implementation PHASENumberMetaParameter

- (PHASENumberMetaParameter)init
{
  -[PHASENumberMetaParameter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASENumberMetaParameter)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASENumberMetaParameter)initWithUID:(id)a3 delegate:(id)a4
{
  -[PHASENumberMetaParameter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (PHASENumberMetaParameter)initWithUID:(id)a3 value:(double)a4 rangeMin:(double)a5 rangeMax:(double)a6 delegate:(id)a7
{
  id v12;
  id v13;
  PHASENumberMetaParameter *v14;
  PHASENumberMetaParameter *v15;
  void *v16;
  PHASENumberMetaParameter *v17;
  objc_super v19;

  v12 = a3;
  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PHASENumberMetaParameter;
  v14 = -[PHASEMetaParameter initWithUID:delegate:](&v19, sel_initWithUID_delegate_, v12, v13);
  v15 = v14;
  if (v14)
  {
    v14->_minimum = a5;
    v14->_maximum = a6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASEMetaParameter setValue:](v15, "setValue:", v16);

    v17 = v15;
  }

  return v15;
}

- (void)fadeToValue:(double)value duration:(NSTimeInterval)duration
{
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHASEMetaParameter setLocalValueOnly:](self, "setLocalValueOnly:");

  -[PHASEMetaParameter delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PHASEMetaParameter identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetaParameter:value:withTimeInterval:", v7, value, duration);

}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

@end
