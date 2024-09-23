@implementation KGMutableDirectedBinaryAdjacency

- (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency)mutableUnderlyingObject
{
  return (_TtC17KnowledgeGraphKit39KGWrapperMutableDirectedBinaryAdjacency *)self->super._underlyingObject;
}

- (KGMutableDirectedBinaryAdjacency)init
{
  KGMutableDirectedBinaryAdjacency *v2;
  uint64_t v3;
  _TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KGMutableDirectedBinaryAdjacency;
  v2 = -[KGDirectedBinaryAdjacency init](&v6, sel_init);
  v3 = objc_opt_new();
  underlyingObject = v2->super._underlyingObject;
  v2->super._underlyingObject = (_TtC17KnowledgeGraphKit32KGWrapperDirectedBinaryAdjacency *)v3;

  return v2;
}

- (void)insertSource:(unint64_t)a3 target:(unint64_t)a4
{
  id v6;

  -[KGMutableDirectedBinaryAdjacency mutableUnderlyingObject](self, "mutableUnderlyingObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSource:target:", a3, a4);

}

- (void)removeSource:(unint64_t)a3 target:(unint64_t)a4
{
  id v6;

  -[KGMutableDirectedBinaryAdjacency mutableUnderlyingObject](self, "mutableUnderlyingObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeSource:target:", a3, a4);

}

- (void)formUnionWith:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[KGMutableDirectedBinaryAdjacency mutableUnderlyingObject](self, "mutableUnderlyingObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4[1];

  objc_msgSend(v6, "formUnionWith:", v5);
}

- (void)subtract:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[KGMutableDirectedBinaryAdjacency mutableUnderlyingObject](self, "mutableUnderlyingObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4[1];

  objc_msgSend(v6, "subtract:", v5);
}

- (void)setTargets:(id)a3 forSource:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[KGMutableDirectedBinaryAdjacency mutableUnderlyingObject](self, "mutableUnderlyingObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTargets:forSource:", v6, a4);

}

- (void)removeTargetsForSource:(unint64_t)a3
{
  id v4;

  -[KGMutableDirectedBinaryAdjacency mutableUnderlyingObject](self, "mutableUnderlyingObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTargetsForSource:", a3);

}

@end
