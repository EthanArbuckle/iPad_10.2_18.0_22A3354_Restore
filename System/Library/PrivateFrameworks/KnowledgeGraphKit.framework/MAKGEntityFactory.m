@implementation MAKGEntityFactory

- (MAKGEntityFactory)initWithSpecification:(id)a3
{
  id v5;
  MAKGEntityFactory *v6;
  MAKGEntityFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAKGEntityFactory;
  v6 = -[MAKGEntityFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specification, a3);

  return v7;
}

- (id)nodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  id v17;
  int v18;
  id v19;
  unsigned __int16 v20;

  v20 = 1;
  v19 = 0;
  v8 = a5;
  MALabelAndDomainFromKGLabels(a4, &v19, &v20);
  v9 = v19;
  v10 = -[MAGraphSpecification nodeClassWithLabel:domain:](self->_specification, "nodeClassWithLabel:domain:", v9, v20);
  v18 = 0;
  v17 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:maProperties:maWeight:](MAKGWeightConversion, "maPropertiesAndWeightForKGProperties:maProperties:maWeight:", v8, &v17, &v18);

  v11 = v17;
  v12 = [v10 alloc];
  LODWORD(v13) = v18;
  v14 = (void *)objc_msgSend(v12, "initWithLabel:domain:weight:properties:", v9, v20, v11, v13);
  objc_msgSend(v14, "setIdentifier:", a3);
  -[MAGraphSpecification rootGraphReference](self->_specification, "rootGraphReference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setGraphReference:", v15);
  return v14;
}

- (id)edgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MAGraphSpecification *specification;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  id v24;
  int v25;
  id v26;
  unsigned __int16 v27;

  v27 = 1;
  v26 = 0;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  MALabelAndDomainFromKGLabels(a4, &v26, &v27);
  v15 = v26;
  v25 = 0;
  v24 = 0;
  +[MAKGWeightConversion maPropertiesAndWeightForKGProperties:maProperties:maWeight:](MAKGWeightConversion, "maPropertiesAndWeightForKGProperties:maProperties:maWeight:", v14, &v24, &v25);

  specification = self->_specification;
  v17 = v27;
  v18 = v24;
  v19 = objc_alloc(-[MAGraphSpecification edgeClassWithLabel:domain:](specification, "edgeClassWithLabel:domain:", v15, v17));
  LODWORD(v20) = v25;
  v21 = (void *)objc_msgSend(v19, "initWithLabel:sourceNode:targetNode:domain:weight:properties:", v15, v13, v12, v27, v18, v20);

  objc_msgSend(v21, "setIdentifier:", a3);
  -[MAGraphSpecification rootGraphReference](self->_specification, "rootGraphReference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setGraphReference:", v22);
  return v21;
}

- (MAGraphSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
}

@end
