@implementation CNPRPosterLevelSet

- (CNPRPosterLevelSet)initWithWrappedLevelSet:(id)a3
{
  id v5;
  CNPRPosterLevelSet *v6;
  CNPRPosterLevelSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRPosterLevelSet;
  v6 = -[CNPRPosterLevelSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedLevelSet, a3);

  return v7;
}

- (PRPosterLevelSet)wrappedLevelSet
{
  return self->_wrappedLevelSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedLevelSet, 0);
}

@end
