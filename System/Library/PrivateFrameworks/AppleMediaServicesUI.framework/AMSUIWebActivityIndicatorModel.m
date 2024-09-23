@implementation AMSUIWebActivityIndicatorModel

- (AMSUIWebActivityIndicatorModel)initWithJSObject:(id)a3 context:(id)a4
{
  id v5;
  AMSUIWebActivityIndicatorModel *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebActivityIndicatorModel;
  v6 = -[AMSUIWebActivityIndicatorModel init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("animate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("animate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_animate = objc_msgSend(v8, "BOOLValue");

    }
    else
    {
      v6->_animate = 1;
    }

  }
  return v6;
}

- (NSString)debugDescription
{
  _BOOL4 v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("animate");
  v2 = -[AMSUIWebActivityIndicatorModel animate](self, "animate");
  v3 = CFSTR("false");
  if (v2)
    v3 = CFSTR("true");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

@end
