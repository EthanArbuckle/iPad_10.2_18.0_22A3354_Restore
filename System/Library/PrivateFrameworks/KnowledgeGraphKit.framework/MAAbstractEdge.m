@implementation MAAbstractEdge

- (MAAbstractEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 minimum:(unint64_t)a8 maximum:(unint64_t)a9 directed:(BOOL)a10
{
  id v15;
  id v16;
  double v17;
  MAAbstractEdge *v18;
  MAAbstractEdge *v19;
  objc_super v21;

  v15 = a4;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MAAbstractEdge;
  LODWORD(v17) = 1.0;
  v18 = -[MAConcreteEdge initWithLabel:sourceNode:targetNode:domain:weight:properties:](&v21, sel_initWithLabel_sourceNode_targetNode_domain_weight_properties_, a3, 0, 0, 1, MEMORY[0x1E0C9AA70], v17);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_sourceAbstractNode, v15);
    objc_storeWeak((id *)&v19->_targetAbstractNode, v16);
    v19->_minimum = a8;
    v19->_maximum = a9;
    v19->_isDirected = a10;
  }

  return v19;
}

- (MAAbstractEdge)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MAAbstractEdge;
  LODWORD(v6) = 1.0;
  return -[MAConcreteEdge initWithLabel:sourceNode:targetNode:domain:weight:properties:](&v8, sel_initWithLabel_sourceNode_targetNode_domain_weight_properties_, a3, 0, 0, a4, a6, v6);
}

- (id)sourceNode
{
  return objc_loadWeakRetained((id *)&self->_sourceAbstractNode);
}

- (id)targetNode
{
  return objc_loadWeakRetained((id *)&self->_targetAbstractNode);
}

- (id)oppositeNode:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MAAbstractEdge;
  -[MAEdge oppositeNode:](&v4, sel_oppositeNode_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)minimum
{
  return self->_minimum;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (BOOL)isDirected
{
  return self->_isDirected;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetAbstractNode);
  objc_destroyWeak((id *)&self->_sourceAbstractNode);
}

@end
