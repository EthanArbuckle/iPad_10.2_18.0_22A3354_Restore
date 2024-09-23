@implementation _LTDisambiguationUserSelection

- (_LTDisambiguationUserSelection)initWithEdge:(id)a3 sourceSnippet:(id)a4 linkIndex:(unint64_t)a5
{
  id v8;
  id v9;
  _LTDisambiguationUserSelection *v10;
  uint64_t v11;
  _LTDirectedEdge *edge;
  uint64_t v13;
  NSString *sourceSnippet;
  _LTDisambiguationUserSelection *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_LTDisambiguationUserSelection;
  v10 = -[_LTDisambiguationUserSelection init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    edge = v10->_edge;
    v10->_edge = (_LTDirectedEdge *)v11;

    v13 = objc_msgSend(v9, "copy");
    sourceSnippet = v10->_sourceSnippet;
    v10->_sourceSnippet = (NSString *)v13;

    v10->_linkIndex = a5;
    v15 = v10;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[_LTDisambiguationUserSelection edge](self, "edge");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "edge");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      -[_LTDisambiguationUserSelection sourceSnippet](self, "sourceSnippet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceSnippet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        v9 = -[_LTDisambiguationUserSelection linkIndex](self, "linkIndex");
        v10 = v9 == objc_msgSend(v4, "linkIndex");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[_LTDisambiguationUserSelection edge](self, "edge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_LTDisambiguationUserSelection sourceSnippet](self, "sourceSnippet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[_LTDisambiguationUserSelection linkIndex](self, "linkIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LTDisambiguationUserSelection *v3;
  void *v4;
  void *v5;
  _LTDisambiguationUserSelection *v6;

  v3 = self;
  v4 = (void *)-[_LTDirectedEdge copy](v3->_edge, "copy");
  v5 = (void *)-[NSString copy](v3->_sourceSnippet, "copy");
  v6 = -[_LTDisambiguationUserSelection initWithEdge:sourceSnippet:linkIndex:](v3, "initWithEdge:sourceSnippet:linkIndex:", v4, v5, v3->_linkIndex);

  return v6;
}

- (_LTDirectedEdge)edge
{
  return self->_edge;
}

- (NSString)sourceSnippet
{
  return self->_sourceSnippet;
}

- (unint64_t)linkIndex
{
  return self->_linkIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSnippet, 0);
  objc_storeStrong((id *)&self->_edge, 0);
}

@end
