@implementation CCUIPPTTest

+ (id)testWithName:(id)a3 beginSignpost:(unint64_t)a4 endSignpost:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:beginSignpost:endSignpost:", v8, a4, a5);

  return v9;
}

- (id)_initWithName:(id)a3 beginSignpost:(unint64_t)a4 endSignpost:(unint64_t)a5
{
  id v8;
  CCUIPPTTest *v9;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCUIPPTTest;
  v9 = -[CCUIPPTTest init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v9->_beginSignpost = a4;
    v9->_endSignpost = a5;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)beginSignpost
{
  return self->_beginSignpost;
}

- (unint64_t)endSignpost
{
  return self->_endSignpost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
