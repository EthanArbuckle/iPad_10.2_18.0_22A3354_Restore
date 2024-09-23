@implementation HFMutableReorderableHomeKitItemList

- (void)setSortedHomeKitItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "na_each:", &__block_literal_global_190_1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke_2;
  v8[3] = &unk_1EA73F020;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v4, "na_each:", v8);

  v6 = (void *)objc_msgSend(v7, "copy");
  -[HFReorderableHomeKitItemList setSortedHomeKitObjectIdentifiers:](self, "setSortedHomeKitObjectIdentifiers:", v6);

}

void __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = a2;
  v3 = &unk_1F03F0850;
  v4 = v2;
  v10 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend(v4, "conformsToProtocol:", v3))
    v5 = v10;
  else
    v5 = 0;
  v6 = v10;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v9);

LABEL_7:
    v6 = 0;
  }

}

void __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F0413DE0))
    v3 = v10;
  else
    v3 = 0;
  v4 = v3;
  if (!v4)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v10, "homeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = v8;
    objc_msgSend(v8, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v4, "primaryHomeKitObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "allHomeKitObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_194_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v6);
LABEL_10:

}

uint64_t __61__HFMutableReorderableHomeKitItemList_setSortedHomeKitItems___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (void)setSortedHomeKitObjects:(id)a3
{
  id v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_195);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HFReorderableHomeKitItemList setSortedHomeKitObjectIdentifiers:](self, "setSortedHomeKitObjectIdentifiers:", v4);

}

uint64_t __63__HFMutableReorderableHomeKitItemList_setSortedHomeKitObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (id)saveWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HFReorderableHomeKitItemList sortedHomeKitObjectIdentifiers](self, "sortedHomeKitObjectIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_map:", &__block_literal_global_198_2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFReorderableHomeKitItemList _applicationDataKey](self, "_applicationDataKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqual:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFReorderableHomeKitItemList _applicationDataKey](self, "_applicationDataKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v13);

      v14 = (void *)MEMORY[0x1E0D519C0];
      v15 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_2;
      v20[3] = &unk_1EA728590;
      v21 = v5;
      v22 = v6;
      objc_msgSend(v14, "futureWithErrorOnlyHandlerAdapterBlock:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_3;
      v18[3] = &unk_1EA732620;
      v18[4] = self;
      v19 = v4;
      objc_msgSend(v16, "flatMap:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

uint64_t __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_updateApplicationData:handleError:completionHandler:", *(_QWORD *)(a1 + 40), 1, a2);
}

id __54__HFMutableReorderableHomeKitItemList_saveWithSender___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_dispatchApplicationDataDidChangeMessageWithSender:", v3);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_dispatchApplicationDataDidChangeMessageWithSender:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];

  v4 = a3;
  -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchHomeManagerObserverMessage:sender:", &__block_literal_global_204_1, v4);
  }
  else
  {
    -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) != 0)
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_2;
      v24[3] = &unk_1EA726918;
      v24[4] = self;
      objc_msgSend(v10, "dispatchHomeObserverMessage:sender:", v24, v4);

      goto LABEL_10;
    }
    -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v13, "accessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_3;
      v21[3] = &unk_1EA7277C8;
      v22 = v17;
      v23 = v14;
      v19 = v14;
      v20 = v17;
      objc_msgSend(v18, "dispatchHomeObserverMessage:sender:", v21, v4);

      goto LABEL_10;
    }

    if (!v14)
      goto LABEL_10;
    -[HFReorderableItemListAbstractBase applicationDataContainer](self, "applicationDataContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("No dispatcher for notifying observers of application data change for container: %@"), v7);
  }

LABEL_10:
}

void __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "homeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeManagerDidUpdateApplicationData:", v3);

  }
}

void __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationDataContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeDidUpdateApplicationData:", v3);

  }
}

void __90__HFMutableReorderableHomeKitItemList__dispatchApplicationDataDidChangeMessageWithSender___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateApplicationDataForRoom:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
