@implementation NBHashBucketer

- (NBHashBucketer)init
{
  NBHashBucketer *v2;
  NBObjCHashBucketer *v3;
  NBObjCHashBucketer *bucketer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NBHashBucketer;
  v2 = -[NBHashBucketer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NBObjCHashBucketer);
    bucketer = v2->_bucketer;
    v2->_bucketer = v3;

  }
  return v2;
}

- (unint64_t)bucketForHash:(id)a3 bucketCount:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a3;
  -[NBHashBucketer bucketer](self, "bucketer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "bucketForHash:bucketCount:", v6, a4);

  return v8;
}

- (NBObjCHashBucketer)bucketer
{
  return self->_bucketer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketer, 0);
}

@end
