@implementation WFSerializableContentProvider

- (WFSerializableContentProvider)init
{
  WFSerializableContentProvider *v2;
  uint64_t v3;
  NSMutableDictionary *entriesForClassNames;
  WFSerializableContentProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSerializableContentProvider;
  v2 = -[WFSerializableContentProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    entriesForClassNames = v2->_entriesForClassNames;
    v2->_entriesForClassNames = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)serializedRepresentationForObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSerializableContentProvider.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "wfSerializedRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFSerializableContentProvider entryConsideringSuperclassesForClass:](self, "entryConsideringSuperclassesForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "serializationBlock");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v9)[2](v9, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)objectOfClass:(Class)a3 withSerializedRepresentation:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v14;

  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSerializableContentProvider.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class objectWithWFSerializedRepresentation:](a3, "objectWithWFSerializedRepresentation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSerializableContentProvider entriesForClassNames](self, "entriesForClassNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "deserializationBlock");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v12)[2](v12, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)entryConsideringSuperclassesForClass:(Class)a3
{
  objc_class *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3)
  {
    v3 = a3;
    do
    {
      -[WFSerializableContentProvider entriesForClassNames](self, "entriesForClassNames");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = -[objc_class superclass](v3, "superclass");
      if (!v8)
        break;
      v3 = (objc_class *)v8;
    }
    while (!v7);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)registerSerializableContentClasses
{
  WFSerializableContentProviderEntry *v3;
  WFSerializableContentProviderEntry *v4;
  WFSerializableContentProviderEntry *v5;
  WFSerializableContentProviderEntry *v6;
  WFSerializableContentProviderEntry *v7;
  WFSerializableContentProviderEntry *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("MKMapItem");
  v3 = -[WFSerializableContentProviderEntry initWithSerializedRepresentationBlock:deserializationBlock:]([WFSerializableContentProviderEntry alloc], "initWithSerializedRepresentationBlock:deserializationBlock:", &__block_literal_global_65, &__block_literal_global_80);
  v12[0] = v3;
  v11[1] = CFSTR("CLLocation");
  v4 = -[WFSerializableContentProviderEntry initWithSerializedRepresentationBlock:deserializationBlock:]([WFSerializableContentProviderEntry alloc], "initWithSerializedRepresentationBlock:deserializationBlock:", &__block_literal_global_93, &__block_literal_global_96);
  v12[1] = v4;
  v11[2] = CFSTR("MPMediaItem");
  v5 = -[WFSerializableContentProviderEntry initWithSerializedRepresentationBlock:deserializationBlock:]([WFSerializableContentProviderEntry alloc], "initWithSerializedRepresentationBlock:deserializationBlock:", &__block_literal_global_99, &__block_literal_global_102);
  v12[2] = v5;
  v11[3] = CFSTR("EKCalendarItem");
  v6 = -[WFSerializableContentProviderEntry initWithSerializedRepresentationBlock:deserializationBlock:]([WFSerializableContentProviderEntry alloc], "initWithSerializedRepresentationBlock:deserializationBlock:", &__block_literal_global_105, &__block_literal_global_106);
  v12[3] = v6;
  v11[4] = CFSTR("EKEvent");
  v7 = -[WFSerializableContentProviderEntry initWithSerializedRepresentationBlock:deserializationBlock:]([WFSerializableContentProviderEntry alloc], "initWithSerializedRepresentationBlock:deserializationBlock:", &__block_literal_global_115, &__block_literal_global_116);
  v12[4] = v7;
  v11[5] = CFSTR("REMReminder");
  v8 = -[WFSerializableContentProviderEntry initWithSerializedRepresentationBlock:deserializationBlock:]([WFSerializableContentProviderEntry alloc], "initWithSerializedRepresentationBlock:deserializationBlock:", &__block_literal_global_122, &__block_literal_global_123);
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSerializableContentProvider entriesForClassNames](self, "entriesForClassNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v9);

}

- (NSMutableDictionary)entriesForClassNames
{
  return self->_entriesForClassNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesForClassNames, 0);
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_3770);
  return (id)sharedProvider_registry;
}

uint64_t __47__WFSerializableContentProvider_sharedProvider__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedProvider_registry;
  sharedProvider_registry = v0;

  return objc_msgSend((id)sharedProvider_registry, "registerSerializableContentClasses");
}

@end
