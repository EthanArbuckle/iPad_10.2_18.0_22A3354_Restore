@implementation CNUIUserActionFaceTimeVideoTarget

id __79___CNUIUserActionFaceTimeVideoTarget_actionsForContact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  CNHandle *v6;
  void *v7;
  void *v8;
  CNHandle *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[CNHandle handleTypeForPropertyKey:](CNHandle, "handleTypeForPropertyKey:", v4);

  v6 = [CNHandle alloc];
  objc_msgSend(v3, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cnui_URLDestinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNHandle initWithStringValue:type:](v6, "initWithStringValue:type:", v8, v5);

  objc_msgSend(MEMORY[0x1E0C99E98], "_cnui_faceTimeVideoURLFutureWithHandle:contact:", v9, *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C96658];
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v11, v3, v12, v10, 5, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
