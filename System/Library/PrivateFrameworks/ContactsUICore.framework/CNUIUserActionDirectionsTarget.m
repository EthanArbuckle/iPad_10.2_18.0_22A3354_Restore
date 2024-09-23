@implementation CNUIUserActionDirectionsTarget

id __92___CNUIUserActionDirectionsTarget_actionsForPostalAddresses_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "mapsUrlFromLabeledValue:contact:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97280];
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *MEMORY[0x1E0C967F0];
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0C96608];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:isSensitive:group:options:", v10, v9, v11, v12, 1, 11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
