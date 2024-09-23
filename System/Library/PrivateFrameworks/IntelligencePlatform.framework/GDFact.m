@implementation GDFact

- (GDFact)initWithPredicate:(unint64_t)a3 object:(id)a4
{
  id v7;
  GDFact *v8;
  GDFact *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GDFact;
  v8 = -[GDFact init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_predicate = a3;
    objc_storeStrong((id *)&v8->_object, a4);
  }

  return v9;
}

- (unint64_t)predicate
{
  return self->_predicate;
}

- (GDFactObject)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
}

@end
