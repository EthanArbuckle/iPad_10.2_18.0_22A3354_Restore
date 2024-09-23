@implementation HMDMediaDestinationControllerAggregateDataGenerator

- (id)aggregateDataWithDestinations:(id)a3 controllers:(id)a4 groups:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaGroupsAggregateData *v12;
  HMDMediaGroupsAggregateData *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  HMDMediaDestinationControllerAggregateDataGenerator *v19;
  id v20;

  v8 = a3;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __104__HMDMediaDestinationControllerAggregateDataGenerator_aggregateDataWithDestinations_controllers_groups___block_invoke;
  v18 = &unk_24E79A638;
  v19 = self;
  v20 = v8;
  v9 = v8;
  v10 = a5;
  objc_msgSend(a4, "na_map:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [HMDMediaGroupsAggregateData alloc];
  v13 = -[HMDMediaGroupsAggregateData initWithDestinations:destinationControllersData:groups:](v12, "initWithDestinations:destinationControllersData:groups:", v9, v11, v10, v15, v16, v17, v18, v19);

  return v13;
}

- (id)validDestinationForDestinationControllerData:(id)a3 inDestinations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __115__HMDMediaDestinationControllerAggregateDataGenerator_validDestinationForDestinationControllerData_inDestinations___block_invoke;
  v9[3] = &unk_24E79A660;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a4, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __115__HMDMediaDestinationControllerAggregateDataGenerator_validDestinationForDestinationControllerData_inDestinations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "availableDestinationIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5)
    && objc_msgSend(v3, "containsHomeTheaterSupportedOptions"))
  {
    objc_msgSend(v3, "audioGroupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hmf_isEqualToUUID:", v7))
    {
      objc_msgSend(v3, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "destinationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "hmf_isEqualToUUID:", v9) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(v3, "parentIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "destinationIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "hmf_isEqualToUUID:", v12);

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

id __104__HMDMediaDestinationControllerAggregateDataGenerator_aggregateDataWithDestinations_controllers_groups___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  objc_msgSend(v3, "destinationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "validDestinationForDestinationControllerData:inDestinations:", v3, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDestinationIdentifier:", v8);

    }
    else
    {
      objc_msgSend(v6, "setDestinationIdentifier:", 0);
    }

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

@end
