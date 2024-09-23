@implementation PARAsyncCard

- (PARAsyncCard)initWithCoder:(id)a3
{
  id v4;
  PARAsyncCard *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PARAsyncCard;
  v5 = -[PARAsyncCard initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_scale"));
    v5->_scale = v6;
    v5->_clientQueryId = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_clientQueryId"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARAsyncCard;
  v4 = a3;
  -[PARAsyncCard encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_scale"), self->_scale, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_clientQueryId, CFSTR("_clientQueryId"));

}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unint64_t)clientQueryId
{
  return self->_clientQueryId;
}

+ (id)cardWithTitle:(id)a3 url:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7
{
  id v10;
  id v11;
  PARAsyncCard *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(PARAsyncCard);
  -[PARAsyncCard setType:](v12, "setType:", 2);
  -[PARAsyncCard setSource:](v12, "setSource:", 1);
  -[PARAsyncCard setTitle:](v12, "setTitle:", v11);

  v13 = (void *)objc_msgSend(v10, "copy");
  -[PARAsyncCard setUrlValue:](v12, "setUrlValue:", v13);

  -[PARAsyncCard setQueryId:](v12, "setQueryId:", a7);
  v12->_scale = a6;
  return v12;
}

+ (id)cardWithTitle:(id)a3 url:(id)a4 session:(id)a5 scale:(double)a6 queryId:(unint64_t)a7 clientQueryId:(unint64_t)a8
{
  id result;

  result = (id)objc_msgSend(a1, "cardWithTitle:url:session:scale:queryId:", a3, a4, a5, a7, a6);
  if (result)
    *((_QWORD *)result + 25) = a8;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
