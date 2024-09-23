@implementation MPMediaAPIParserLayer

+ (id)layerWithKey:(id)a3 ofType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setKey:", v5);
    objc_msgSend(v7, "setType:", a4);
  }

  return v7;
}

+ (id)layerWithFirstObjectOfType:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "setType:", a3);
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
}

@end
