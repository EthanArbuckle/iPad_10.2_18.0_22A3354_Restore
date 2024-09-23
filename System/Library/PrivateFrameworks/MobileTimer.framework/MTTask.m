@implementation MTTask

+ (id)taskWithIdentifier:(id)a3 completableBlock:(id)a4
{
  return (id)objc_msgSend(a1, "taskWithIdentifier:delay:completableBlock:", a3, a4, 0.0);
}

+ (id)taskWithIdentifier:(id)a3 delay:(double)a4 completableBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setIdentifier:", v8);

  objc_msgSend(v9, "setDelay:", a4);
  objc_msgSend(v9, "setCompletableBlock:", v7);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTTask identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTask delay](self, "delay");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ delay:%f>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (id)completableBlock
{
  return self->_completableBlock;
}

- (void)setCompletableBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MTGCDTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completableBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
