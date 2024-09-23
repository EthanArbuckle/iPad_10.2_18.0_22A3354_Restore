@implementation DUCategoryResultObjC

- (DUCategoryResultObjC)init
{
  DUCategoryResultObjC *v2;
  _TtC21DocumentUnderstanding16DUCategoryResult *v3;
  _TtC21DocumentUnderstanding16DUCategoryResult *underlying;
  DUCategoryResultObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUCategoryResultObjC;
  v2 = -[DUCategoryResultObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding16DUCategoryResult);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)categoryIdentifier
{
  return -[DUCategoryResult categoryIdentifier](self->_underlying, "categoryIdentifier");
}

- (void)setCategoryIdentifier:(id)a3
{
  -[DUCategoryResult setCategoryIdentifier:](self->_underlying, "setCategoryIdentifier:", a3);
}

- (double)categoryConfidence
{
  double result;

  -[DUCategoryResult categoryConfidence](self->_underlying, "categoryConfidence");
  return result;
}

- (void)setCategoryConfidence:(double)a3
{
  -[DUCategoryResult setCategoryConfidence:](self->_underlying, "setCategoryConfidence:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
