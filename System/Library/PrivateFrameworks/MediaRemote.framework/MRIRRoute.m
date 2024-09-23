@implementation MRIRRoute

+ (id)routeWithCandidate:(id)a3
{
  id v3;
  MRIRRoute *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MRIRRoute);
  objc_msgSend(v3, "candidateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRRoute setRouteIdentifier:](v4, "setRouteIdentifier:", v5);

  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "nodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "msv_map:", &__block_literal_global_99);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRRoute setNodes:](v4, "setNodes:", v9);

  -[MRIRRoute setDonateAsCandidate:](v4, "setDonateAsCandidate:", 1);
  return v4;
}

MRIRNode *__32__MRIRRoute_routeWithCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRIRNode *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = objc_alloc_init(MRIRNode);
  objc_msgSend(v2, "avOutpuDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRNode setAvOutputDeviceIdentifier:](v3, "setAvOutputDeviceIdentifier:", v4);

  objc_msgSend(v2, "rapportIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRNode setRapportIdentifier:](v3, "setRapportIdentifier:", v5);

  objc_msgSend(v2, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRIRNode setIdsIdentifier:](v3, "setIdsIdentifier:", v6);
  return v3;
}

+ (id)routeWithEndpoint:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MRRouteRepresentable.m"), 75, CFSTR("endpoint cannot be nil"));

  }
  objc_msgSend(v5, "resolvedOutputDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "routeWithOutputDevices:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)routeWithOutputDevices:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  MRIRRoute *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v3 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v3, "msv_compactMap:", &__block_literal_global_92_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    v10 = 1;
    v11 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v13, "clusterType"))
        {
          objc_msgSend(v13, "clusterCompositionOutputDevices");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)v14;
          if (v14)
            v16 = (void *)v14;
          else
            v16 = v11;
          v17 = v16;

          objc_msgSend(v5, "addObjectsFromArray:", v17);
          v18 = objc_msgSend(v17, "count");
          if (v18 != objc_msgSend(v13, "configuredClusterSize"))
          {
            _MRLogForCategory(0xDuLL);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "uid");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v17, "count");
              v33 = objc_msgSend(v13, "configuredClusterSize");
              objc_msgSend(v13, "debugDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v40 = v20;
              v41 = 2048;
              v42 = v34;
              v43 = 2048;
              v44 = v33;
              v45 = 2112;
              v46 = v21;
              _os_log_error_impl(&dword_193827000, v19, OS_LOG_TYPE_ERROR, "[MRDRRC].IRR Donations disallowed, cluster %@ has %lu members, expected %lu; device: %@",
                buf,
                0x2Au);

            }
            v10 = 0;
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 1;
  }

  v22 = objc_msgSend(v5, "mr_all:", &__block_literal_global_96_0);
  objc_msgSend(v5, "msv_compactMap:", &__block_literal_global_97);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MRIRRoute);
  objc_msgSend(v32, "componentsJoinedByString:", CFSTR("|"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRRoute setRouteIdentifier:](v24, "setRouteIdentifier:", v25);

  -[MRIRRoute setDonateAsCandidate:](v24, "setDonateAsCandidate:", v22 & v10);
  objc_msgSend(v31, "msv_firstWhere:", &__block_literal_global_98_0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26 && objc_msgSend(v31, "count") != 1)
    -[MRIRRoute setDonateAsCandidate:](v24, "setDonateAsCandidate:", 0);
  v27 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v23, "msv_map:", &__block_literal_global_100);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRRoute setNodes:](v24, "setNodes:", v29);

  return v24;
}

__CFString *__36__MRIRRoute_routeWithOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;

  v2 = a2;
  if (objc_msgSend(v2, "deviceType") == 4)
  {
    v3 = CFSTR("Speaker");
  }
  else
  {
    objc_msgSend(v2, "uid");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

BOOL __36__MRIRRoute_routeWithOutputDevices___block_invoke_94(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "deviceType") == 1 || objc_msgSend(v2, "deviceType") == 4;

  return v3;
}

__CFString *__36__MRIRRoute_routeWithOutputDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;

  v2 = a2;
  if (objc_msgSend(v2, "deviceType") == 4)
  {
    v3 = CFSTR("Speaker");
  }
  else
  {
    objc_msgSend(v2, "uid");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __36__MRIRRoute_routeWithOutputDevices___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "deviceType") == 1)
    v3 = objc_msgSend(v2, "supportsBufferedAirPlay") ^ 1;
  else
    v3 = 0;

  return v3;
}

MRIRNode *__36__MRIRRoute_routeWithOutputDevices___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  MRIRNode *v3;

  v2 = a2;
  v3 = objc_alloc_init(MRIRNode);
  -[MRIRNode setAvOutputDeviceIdentifier:](v3, "setAvOutputDeviceIdentifier:", v2);

  return v3;
}

+ (id)debugRouteWithDebugIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MRIRRoute *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MRIRRoute);
  -[MRIRRoute setRouteIdentifier:](v7, "setRouteIdentifier:", v4);
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "msv_map:", &__block_literal_global_105);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRIRRoute setNodes:](v7, "setNodes:", v10);

  -[MRIRRoute setDonateAsCandidate:](v7, "setDonateAsCandidate:", 1);
  return v7;
}

MRIRNode *__43__MRIRRoute_debugRouteWithDebugIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRIRNode *v3;

  v2 = a2;
  v3 = objc_alloc_init(MRIRNode);
  -[MRIRNode setAvOutputDeviceIdentifier:](v3, "setAvOutputDeviceIdentifier:", v2);

  return v3;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRIRRoute routeIdentifier](self, "routeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("routeIdentifier: %@"), v7);

  -[MRIRRoute nodes](self, "nodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", nodes: %@"), v8);

  v9 = -[MRIRRoute donateAsCandidate](self, "donateAsCandidate");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  objc_msgSend(v6, "appendFormat:", CFSTR(", donateAsCandidate: %@"), v10);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  MRIRRoute *v4;
  MRIRRoute *v5;
  MRIRRoute *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (MRIRRoute *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else if (-[MRIRRoute conformsToProtocol:](v4, "conformsToProtocol:", &unk_1EE2F5C60))
  {
    v6 = v5;
    -[MRIRRoute routeIdentifier](self, "routeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIRRoute routeIdentifier](v6, "routeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
      v9 = 1;
    else
      v9 = objc_msgSend(v7, "isEqual:", v8);

    -[MRIRRoute nodes](self, "nodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRIRRoute nodes](v6, "nodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {
      -[MRIRRoute nodes](self, "nodes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRIRRoute nodes](v6, "nodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 &= objc_msgSend(v12, "isEqualToSet:", v13);

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_routeIdentifier, a3);
}

- (NSSet)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
}

- (BOOL)donateAsCandidate
{
  return self->_donateAsCandidate;
}

- (void)setDonateAsCandidate:(BOOL)a3
{
  self->_donateAsCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end
