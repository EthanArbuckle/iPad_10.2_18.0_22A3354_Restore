@implementation MCLURLRequestRewriteRule

- (MCLURLRequestRewriteRule)initWithMatchExpression:(id)a3 block:(id)a4
{
  MCLURLRequestRewriteRule *v4;
  void *v5;
  id block;
  MCLURLRequestRewriteRule *v8;
  objc_super v10;
  id v11;
  id location[2];
  MCLURLRequestRewriteRule *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)MCLURLRequestRewriteRule;
  v13 = -[MCLURLRequestRewriteRule init](&v10, sel_init);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    objc_storeStrong((id *)&v13->_matchPattern, location[0]);
    v5 = _Block_copy(v11);
    block = v13->_block;
    v13->_block = v5;

  }
  v8 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

+ (id)urlRequestRewriteRuleWithMatchPattern:(id)a3 block:(id)a4
{
  id v4;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  Class v14;

  v14 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  v9 = 0;
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", location[0], 1, &v9);
  objc_storeStrong(&v11, v9);
  v10 = v8;
  if (v11)
  {
    NSLog(CFSTR("Error compiling regular expression.Error: %@"), v11);
    objc_storeStrong(&v11, 0);
  }
  v4 = [v14 alloc];
  v6 = (id)objc_msgSend(v4, "initWithMatchExpression:block:", v10, v12);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (void)rewriteURLRequest:(id)a3
{
  id location[2];
  MCLURLRequestRewriteRule *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_block)
    (*((void (**)(void))v4->_block + 2))();
  objc_storeStrong(location, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (NSRegularExpression)matchPattern
{
  return self->_matchPattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchPattern, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
