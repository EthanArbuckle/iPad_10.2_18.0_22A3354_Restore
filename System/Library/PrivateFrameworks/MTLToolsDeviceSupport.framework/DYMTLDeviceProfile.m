@implementation DYMTLDeviceProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYMTLDeviceProfile)initWithCoder:(id)a3
{
  id v4;
  DYMTLDeviceProfile *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSNumber *registryID;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *supportedFeatureSets;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *supportedGPUFamilies;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *defaultSamplePositions;
  DYMTLDeviceProfile *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DYMTLDeviceProfile;
  v5 = -[DYMTLDeviceProfile init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registryID"));
    v8 = objc_claimAutoreleasedReturnValue();
    registryID = v5->_registryID;
    v5->_registryID = (NSNumber *)v8;

    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("supportedFeatureSets"));
    v13 = objc_claimAutoreleasedReturnValue();
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = (NSArray *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("supportedGPUFamilies"));
    v18 = objc_claimAutoreleasedReturnValue();
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = (NSArray *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("defaultSamplePositions"));
    v25 = objc_claimAutoreleasedReturnValue();
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v25;

    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedFeatureSets, CFSTR("supportedFeatureSets"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedGPUFamilies, CFSTR("supportedGPUFamilies"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultSamplePositions, CFSTR("defaultSamplePositions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_registryID, CFSTR("registryID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = objc_opt_new();
  if (v4)
  {
    v5 = -[NSString copy](self->_name, "copy");
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;

    *(_QWORD *)(v4 + 8) = self->_streamRef;
    v7 = -[NSArray copy](self->_supportedFeatureSets, "copy");
    v8 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v7;

    v9 = -[NSDictionary copy](self->_defaultSamplePositions, "copy");
    v10 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v9;

    objc_storeStrong((id *)(v4 + 48), self->_registryID);
    v11 = (id)v4;
  }

  return (id)v4;
}

- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    v5 = v4;
    objc_msgSend(v5, "supportedGPUFamilies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "supportedGPUFamilies");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke;
      v11[3] = &unk_251122F40;
      v11[4] = self;
      v11[5] = &v12;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
    }
    else
    {
      objc_msgSend(v5, "supportedFeatureSets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke_2;
      v10[3] = &unk_251122F40;
      v10[4] = self;
      v10[5] = &v12;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
    }

    v8 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (DYMTLDeviceProfile)initWithDevice:(id)a3
{
  id v4;
  DYMTLDeviceProfile *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSNumber *registryID;
  NSArray *v10;
  NSArray *supportedFeatureSets;
  NSArray *v12;
  NSArray *supportedGPUFamilies;
  uint64_t i;
  uint64_t v15;
  NSArray *v16;
  void *v17;
  uint64_t j;
  uint64_t v19;
  NSArray *v20;
  void *v21;
  NSArray *v22;
  size_t k;
  float *v24;
  id v25;
  float *v26;
  size_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDictionary *defaultSamplePositions;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DYMTLDeviceProfile;
  v5 = -[DYMTLDeviceProfile init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "registryID"));
    v8 = objc_claimAutoreleasedReturnValue();
    registryID = v5->_registryID;
    v5->_registryID = (NSNumber *)v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = v10;

    v12 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = v12;

    for (i = 0; i != 17; ++i)
    {
      v15 = -[DYMTLDeviceProfile initWithDevice:]::availableFeatures[i];
      if (objc_msgSend(v4, "supportsFeatureSet:", v15))
      {
        v16 = v5->_supportedFeatureSets;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v16, "addObject:", v17);

      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      for (j = 0; j != 18; ++j)
      {
        v19 = -[DYMTLDeviceProfile initWithDevice:]::availableGPUFamilies[j];
        if (objc_msgSend(v4, "supportsFamily:", v19))
        {
          v20 = v5->_supportedGPUFamilies;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v20, "addObject:", v21);

        }
      }
    }
    else
    {
      v22 = v5->_supportedGPUFamilies;
      v5->_supportedGPUFamilies = 0;

    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      for (k = 1; k <= objc_msgSend(v4, "maxCustomSamplePositions"); ++k)
      {
        if (objc_msgSend(v4, "supportsTextureSampleCount:", k))
        {
          v24 = (float *)malloc_type_calloc(k, 8uLL, 0x100004000313F17uLL);
          objc_msgSend(v4, "getDefaultSamplePositions:count:", v24, k);
          v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          if (k)
          {
            v26 = v24 + 1;
            v27 = k;
            do
            {
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *(v26 - 1), *v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v28);

              v26 += 2;
              --v27;
            }
            while (v27);
          }
          free(v24);
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v25);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", k);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKey:", v29, v30);

        }
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v34);
    v31 = objc_claimAutoreleasedReturnValue();
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v31;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v31.receiver = self;
  v31.super_class = (Class)DYMTLDeviceProfile;
  -[DYMTLDeviceProfile description](&v31, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ name=%@ featureProfile="), v4, self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_supportedFeatureSets;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu "), objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9), "unsignedLongValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingString:", v11);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v5);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_supportedGPUFamilies)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GPUFamilies="));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = self->_supportedGPUFamilies;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        v17 = v12;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu "), objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "unsignedLongValue"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingString:", v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          ++v16;
          v17 = v12;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v22 = (id)v20;
  }

  return (NSString *)v22;
}

- (NSString)descriptionForBugReport
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Metal device: %@\n"), self->_name);
  if (self->_supportedGPUFamilies)
  {
    objc_msgSend(v3, "appendString:", CFSTR("    Supported GPU families:"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_supportedGPUFamilies;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", GPUTools::MTL::GetMTLGPUFamilyAsString((GPUTools::MTL *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "unsignedLongLongValue"), 1));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  return (NSString *)v3;
}

- (NSString)displayName
{
  return self->_name;
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x24BE39298];
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;
  NSNumber *registryID;
  char v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    registryID = self->_registryID;
    if (registryID)
      v8 = -[NSNumber isEqual:](registryID, "isEqual:", v4[6]);
    else
      v8 = -[NSString isEqualToString:](self->_name, "isEqualToString:", v4[5]);
    v6 = v8;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (NSArray)supportedFeatureSets
{
  return self->_supportedFeatureSets;
}

- (NSArray)supportedGPUFamilies
{
  return self->_supportedGPUFamilies;
}

- (NSDictionary)defaultSamplePositions
{
  return self->_defaultSamplePositions;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)registryID
{
  return self->_registryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultSamplePositions, 0);
  objc_storeStrong((id *)&self->_supportedGPUFamilies, 0);
  objc_storeStrong((id *)&self->_supportedFeatureSets, 0);
}

@end
