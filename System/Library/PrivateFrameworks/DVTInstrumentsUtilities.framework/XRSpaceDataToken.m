@implementation XRSpaceDataToken

- (unint64_t)hash
{
  return self->_seq;
}

- (BOOL)isEqual:(id)a3
{
  XRSpaceDataToken *v4;
  BOOL v5;

  v4 = (XRSpaceDataToken *)a3;
  v5 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (self->_tag != v4->_tag || self->_seq != v4->_seq))
      v5 = 0;
  }

  return v5;
}

- (XRSpaceDataToken)initWithSpaceTag:(id)a3 sequenceID:(unint64_t)a4
{
  id v7;
  XRSpaceDataToken *v8;
  XRSpaceDataToken *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)XRSpaceDataToken;
  v8 = -[XRSpaceDataToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_tag, a3);
    v9->_seq = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tag, 0);
}

@end
