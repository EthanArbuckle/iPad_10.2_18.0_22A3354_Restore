@implementation AXVKExplorationEdgeElement

- (AXVKExplorationEdgeElement)initWithRoad:(id)a3 betweenFirstVertex:(id)a4 andSecondVertex:(id)a5
{
  id v9;
  id v10;
  id v11;
  AXVKExplorationEdgeElement *v12;
  AXVKExplorationEdgeElement *v13;
  AXVKExplorationEdgeElement *v14;
  NSArray *vertices;
  uint64_t v16;
  NSArray *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AXVKExplorationEdgeElement;
  v12 = -[AXVKExplorationEdgeElement init](&v21, sel_init);
  v13 = v12;
  v14 = 0;
  if (v11 && v10 && v9 && v12)
  {
    objc_storeStrong((id *)&v12->_road, a3);
    vertices = v13->_vertices;
    v13->_vertices = 0;

    v22[0] = v10;
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v13->_vertices;
    v13->_vertices = (NSArray *)v16;

    objc_msgSend(v10, "neighbors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v11);

    objc_msgSend(v11, "neighbors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v10);

    v14 = v13;
  }

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXVKExplorationEdgeElement vertices](self, "vertices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXVKExplorationEdgeElement vertices](self, "vertices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p: connecting {%@} AND {%@}"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (VKRoadFeatureAccessibilityElement)road
{
  return self->_road;
}

- (void)setRoad:(id)a3
{
  objc_storeStrong((id *)&self->_road, a3);
}

- (NSArray)vertices
{
  return self->_vertices;
}

- (void)setVertices:(id)a3
{
  objc_storeStrong((id *)&self->_vertices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_road, 0);
}

@end
