@implementation HMMTRMutableDeviceTopology

- (void)setHAPServiceTypes:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology hapServiceTypes](self, "hapServiceTypes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)setClustersInUse:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology clustersInUse](self, "clustersInUse");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)setHAPCategories:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology hapCategories](self, "hapCategories");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)setHAPDisabledCharacteristics:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology hapDisabledCharacteristics](self, "hapDisabledCharacteristics");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)setDeviceFeatureMapValues:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology deviceFeatureMapValues](self, "deviceFeatureMapValues");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)setDeviceAttributeValues:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology deviceAttributeValues](self, "deviceAttributeValues");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)addHAPDisabledCharacteristic:(id)a3 atEndpoint:(id)a4 hapServiceType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMMTRDeviceTopology hapDisabledCharacteristics](self, "hapDisabledCharacteristics");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v13);
}

- (void)addDeviceFeatureMapValue:(id)a3 clusterClassName:(id)a4 atEndpoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMMTRDeviceTopology deviceFeatureMapValues](self, "deviceFeatureMapValues");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObject:", v13);
}

- (void)addDeviceAttributeValues:(id)a3 clusterClassName:(id)a4 attributeName:(id)a5 atEndpoint:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR(":"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceTopology deviceAttributeValues](self, "deviceAttributeValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@:%@"), v12, v11, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObject:", v16);
}

- (void)setNodeLabel:(id)a3 atEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology nodeLabels](self, "nodeLabels");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v8);
}

- (void)setPartsList:(id)a3 atEndpoint:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  objc_msgSend(v6, "arrayWithArray:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceTopology partsList](self, "partsList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
}

- (void)setFixedLabels:(id)a3 atEndpoint:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  objc_msgSend(v6, "arrayWithArray:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceTopology fixedLabels](self, "fixedLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
}

- (void)setVersion:(id)a3 for:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMMTRDeviceTopology versions](self, "versions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (void)setOTARequestorEnabled:(BOOL)a3 atEndpoint:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMMTRDeviceTopology otaRequestorEndpoints](self, "otaRequestorEndpoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);
}

- (id)storeForNodeId:(id)a3 server:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = a4;
  -[HMMTRDeviceTopology _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 100, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setTopology:", v8);

  return 0;
}

@end
