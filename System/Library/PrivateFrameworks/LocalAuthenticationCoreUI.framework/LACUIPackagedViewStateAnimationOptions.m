@implementation LACUIPackagedViewStateAnimationOptions

- (LACUIPackagedViewStateAnimationOptions)init
{
  return -[LACUIPackagedViewStateAnimationOptions initWithMaxDuration:](self, "initWithMaxDuration:", &unk_2511004C8);
}

- (LACUIPackagedViewStateAnimationOptions)initWithMaxDuration:(id)a3
{
  id v5;
  LACUIPackagedViewStateAnimationOptions *v6;
  LACUIPackagedViewStateAnimationOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIPackagedViewStateAnimationOptions;
  v6 = -[LACUIPackagedViewStateAnimationOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_maxDuration, a3);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  float v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[LACUIPackagedViewStateAnimationOptions maxDuration](self, "maxDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %p; maxDuration:%.2f>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
  objc_storeStrong((id *)&self->_maxDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDuration, 0);
}

@end
