@implementation AFClientPluginManager

+ (id)clientPluginManagerWithFactoryInitializationBlock:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CPSystemRootDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = CFSTR("System");
  v12[2] = CFSTR("/Library/Assistant/UIPlugins");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("SiriDomains");
  v11[1] = CFSTR("SiriDisambiguationDomains");
  v11[2] = CFSTR("SiriProviderDomains");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AFPluginManager pluginManagerForPath:domainKeys:factoryInitializationBlock:](AFClientPluginManager, "pluginManagerForPath:domainKeys:factoryInitializationBlock:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)speakableNamespaceProviderForAceObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  AFClientPluginManager *v13;
  uint64_t *v14;
  SEL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__36690;
  v20 = __Block_byref_object_dispose__36691;
  v21 = 0;
  objc_msgSend(v5, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodedClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__AFClientPluginManager_AceFactorySupport__speakableNamespaceProviderForAceObject___block_invoke;
  v11[3] = &unk_1E3A35230;
  v14 = &v16;
  v8 = v5;
  v15 = a2;
  v12 = v8;
  v13 = self;
  -[AFPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:](self, "enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:", CFSTR("SiriProviderDomains"), v6, v7, v11);

  v9 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __83__AFClientPluginManager_AceFactorySupport__speakableNamespaceProviderForAceObject___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE432738)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "speakableNamespaceProviderForAceObject:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v8 == v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("AFClientPluginManager.m"), 49, CFSTR("Plugin factory %@ must return a new allocated instance of id<AFSpeakableNamespaceProvider> from speakableNamespaceProviderForAceObject:"), objc_opt_class());

      v8 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
      if (!v8)
        goto LABEL_7;
    }
    else if (!v8)
    {
      goto LABEL_7;
    }
    if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EE3FB150) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("AFClientPluginManager.m"), 50, CFSTR("instance must conform to AFSpeakableNamespaceProvider, %@"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

    }
  }
LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    *a3 = 1;

}

@end
