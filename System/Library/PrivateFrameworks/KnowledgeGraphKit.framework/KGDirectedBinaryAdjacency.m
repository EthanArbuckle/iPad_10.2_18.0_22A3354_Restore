@implementation KGDirectedBinaryAdjacency

- (KGDirectedBinaryAdjacency)init
{
  KGDirectedBinaryAdjacency *v2;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v3;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KGDirectedBinaryAdjacency;
  v2 = -[KGDirectedBinaryAdjacency init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency);
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = v3;

  }
  return v2;
}

- (KGDirectedBinaryAdjacency)initWithUnderlyingObject:(id)a3
{
  id v5;
  KGDirectedBinaryAdjacency *v6;
  KGDirectedBinaryAdjacency *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGDirectedBinaryAdjacency;
  v6 = -[KGDirectedBinaryAdjacency init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingObject, a3);

  return v7;
}

- (unint64_t)hash
{
  return -[KGWrapperDirectedBinaryAdjacency hash](self->_underlyingObject, "hash");
}

- (NSString)description
{
  return -[KGWrapperDirectedBinaryAdjacency description](self->_underlyingObject, "description");
}

- (KGElementIdentifierSet)sources
{
  return -[KGWrapperDirectedBinaryAdjacency sources](self->_underlyingObject, "sources");
}

- (KGElementIdentifierSet)targets
{
  return -[KGWrapperDirectedBinaryAdjacency targets](self->_underlyingObject, "targets");
}

- (unint64_t)sourcesCount
{
  return -[KGWrapperDirectedBinaryAdjacency sourcesCount](self->_underlyingObject, "sourcesCount");
}

- (id)intersectingTargetsWith:(id)a3
{
  void *v3;
  KGDirectedBinaryAdjacency *v4;

  -[KGWrapperDirectedBinaryAdjacency intersectingTargetsWith:](self->_underlyingObject, "intersectingTargetsWith:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);

  return v4;
}

- (id)intersectingSourcesWith:(id)a3
{
  void *v3;
  KGDirectedBinaryAdjacency *v4;

  -[KGWrapperDirectedBinaryAdjacency intersectingSourcesWith:](self->_underlyingObject, "intersectingSourcesWith:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);

  return v4;
}

- (id)subtractingTargetsWith:(id)a3
{
  uint64_t v3;
  KGDirectedBinaryAdjacency *v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *underlyingObject;

  -[KGWrapperDirectedBinaryAdjacency subtractingTargetsWith:](self->_underlyingObject, "subtractingTargetsWith:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);
  underlyingObject = v4->_underlyingObject;
  v4->_underlyingObject = (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *)v3;

  return v4;
}

- (id)subtractingSourcesWith:(id)a3
{
  uint64_t v3;
  KGDirectedBinaryAdjacency *v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *underlyingObject;

  -[KGWrapperDirectedBinaryAdjacency subtractingSourcesWith:](self->_underlyingObject, "subtractingSourcesWith:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);
  underlyingObject = v4->_underlyingObject;
  v4->_underlyingObject = (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *)v3;

  return v4;
}

- (id)joinOnTargetsOfAdjacency:(id)a3
{
  void *v3;
  KGDirectedBinaryAdjacency *v4;

  -[KGWrapperDirectedBinaryAdjacency joinOnTargetsOfAdjacency:](self->_underlyingObject, "joinOnTargetsOfAdjacency:", *((_QWORD *)a3 + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);

  return v4;
}

- (void)enumerateTargetsBySourceWith:(id)a3
{
  -[KGWrapperDirectedBinaryAdjacency enumerateTargetsBySourceWith:](self->_underlyingObject, "enumerateTargetsBySourceWith:", a3);
}

- (BOOL)containsSource:(unint64_t)a3 target:(unint64_t)a4
{
  return -[KGWrapperDirectedBinaryAdjacency containsSource:target:](self->_underlyingObject, "containsSource:target:", a3, a4);
}

- (id)targetsForSources:(id)a3
{
  return -[KGWrapperDirectedBinaryAdjacency targetsForSources:](self->_underlyingObject, "targetsForSources:", a3);
}

- (id)targetsForSourceIdentifier:(unint64_t)a3
{
  return -[KGWrapperDirectedBinaryAdjacency targetsForSourceIdentifier:](self->_underlyingObject, "targetsForSourceIdentifier:", a3);
}

- (id)transposed
{
  void *v2;
  KGDirectedBinaryAdjacency *v3;

  -[KGWrapperDirectedBinaryAdjacency transposed](self->_underlyingObject, "transposed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v2);

  return v3;
}

- (id)differenceWith:(id)a3
{
  void *v3;
  KGDirectedBinaryAdjacency *v4;

  -[KGWrapperDirectedBinaryAdjacency differenceWith:](self->_underlyingObject, "differenceWith:", *((_QWORD *)a3 + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);

  return v4;
}

- (id)unionWith:(id)a3
{
  void *v3;
  KGDirectedBinaryAdjacency *v4;

  -[KGWrapperDirectedBinaryAdjacency unionWith:](self->_underlyingObject, "unionWith:", *((_QWORD *)a3 + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);

  return v4;
}

- (id)targetsWithMinimumCount:(unint64_t)a3
{
  return -[KGWrapperDirectedBinaryAdjacency targetsWithMinimumCount:](self->_underlyingObject, "targetsWithMinimumCount:", a3);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[KGWrapperDirectedBinaryAdjacency isEqual:](self->_underlyingObject, "isEqual:", v4[1]);

  return v5;
}

- (id)mutableCopy
{
  KGMutableDirectedBinaryAdjacency *v3;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *v4;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *underlyingObject;

  v3 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  v4 = -[KGWrapperDirectedBinaryAdjacency mutableCopy](self->_underlyingObject, "mutableCopy");
  underlyingObject = v3->super._underlyingObject;
  v3->super._underlyingObject = v4;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

+ (id)identityWith:(id)a3
{
  void *v3;
  KGDirectedBinaryAdjacency *v4;

  +[KGWrapperDirectedBinaryAdjacency identityWith:](_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency, "identityWith:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KGDirectedBinaryAdjacency initWithUnderlyingObject:]([KGDirectedBinaryAdjacency alloc], "initWithUnderlyingObject:", v3);

  return v4;
}

@end
