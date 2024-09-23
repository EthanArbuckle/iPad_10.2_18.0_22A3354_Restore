@implementation MRAVRoutingDiscoverySession

uint64_t __64__MRAVRoutingDiscoverySession_logEndpointsChanged_oldEndpoints___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __72__MRAVRoutingDiscoverySession_logOutputDevicesChanged_oldOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uid");
}

void __52__MRAVRoutingDiscoverySession_setEndpointsSnapshot___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

uint64_t __64__MRAVRoutingDiscoverySession_logEndpointsChanged_oldEndpoints___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

uint64_t __64__MRAVRoutingDiscoverySession_logEndpointsChanged_oldEndpoints___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "outputDeviceUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDeviceUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToArray:", v6) ^ 1;
  return v7;
}

uint64_t __72__MRAVRoutingDiscoverySession_logOutputDevicesChanged_oldOutputDevices___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

uint64_t __72__MRAVRoutingDiscoverySession_logOutputDevicesChanged_oldOutputDevices___block_invoke_2()
{
  return 0;
}

void __56__MRAVRoutingDiscoverySession_endpointsChangedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__MRAVRoutingDiscoverySession_outputDevicesChangedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__MRAVRoutingDiscoverySession_outputDevicesSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__MRAVRoutingDiscoverySession_endpointsSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__MRAVRoutingDiscoverySession_endpointsAddedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__MRAVRoutingDiscoverySession_outputDevicesRemovedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__MRAVRoutingDiscoverySession_endpointsModifiedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__MRAVRoutingDiscoverySession_endpointsRemovedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__MRAVRoutingDiscoverySession_outputDevicesModifiedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58__MRAVRoutingDiscoverySession_outputDevicesAddedCallbacks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)notifyAvailableEndpointsChanged:(id)a3 discoveredEndpoints:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unsigned int v46;
  id v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRAVRoutingDiscoverySession.m"), 637, CFSTR("Mismatch between available and discovered endpoint counts"));

  }
  v10 = -[MRAVRoutingDiscoverySession discoveryMode](self, "discoveryMode");
  if (v10)
    v11 = 1;
  else
    v11 = -[MRAVRoutingDiscoverySession alwaysAllowUpdates](self, "alwaysAllowUpdates");
  -[MRAVRoutingDiscoverySession endpointsSnapshot](self, "endpointsSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mr_distantEndpoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySession setEndpointsSnapshot:](self, "setEndpointsSnapshot:", v13);
  if (v11)
  {
    v47 = v8;
    v46 = v10;
    v45 = (uint64_t)v12;
    if (self->_previousEndpointsDiscoveryMode == v10)
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v14, "calculateDiscoveryUpdates") ^ 1;

    }
    else
    {
      v48 = 1;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v21, "uniqueIdentifier", v45);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v18);
    }

    -[MRAVRoutingDiscoverySession endpointsRemovedCallbacks](self, "endpointsRemovedCallbacks");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[MRAVRoutingDiscoverySession endpointsChangedCallbacks](self, "endpointsChangedCallbacks");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");

    if (v24 + v26)
    {
      v12 = (void *)v45;
      -[MRAVRoutingDiscoverySession _determineRemovedOutputDevices:previousOutputDevices:]((uint64_t)self, v13, v45);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
        -[MRAVRoutingDiscoverySession endpointsRemovedCallbacks](self, "endpointsRemovedCallbacks");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v28, v27, self->_calloutQueue);

        v48 = 1;
      }

    }
    else
    {
      v12 = (void *)v45;
    }
    -[MRAVRoutingDiscoverySession endpointsAddedCallbacks](self, "endpointsAddedCallbacks", v45);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");
    -[MRAVRoutingDiscoverySession endpointsChangedCallbacks](self, "endpointsChangedCallbacks");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v30 + v32)
    {
      -[MRAVRoutingDiscoverySession _determineAddedOutputDevices:previousOutputDevices:]((uint64_t)self, (uint64_t)v13, v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "mr_replaceEndpointsWithEndpoints:", v15);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v34, "count"))
      {
        -[MRAVRoutingDiscoverySession endpointsAddedCallbacks](self, "endpointsAddedCallbacks");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v35, v34, self->_calloutQueue);

        v48 = 1;
      }

    }
    -[MRAVRoutingDiscoverySession endpointsModifiedCallbacks](self, "endpointsModifiedCallbacks");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    -[MRAVRoutingDiscoverySession endpointsChangedCallbacks](self, "endpointsChangedCallbacks");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");

    if (v37 + v39)
    {
      -[MRAVRoutingDiscoverySession _determineModifiedEndpoints:previousEndpoints:]((uint64_t)self, v13, v12);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "mr_replaceEndpointsWithEndpoints:", v15);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v46;
      if (objc_msgSend(v41, "count"))
      {
        -[MRAVRoutingDiscoverySession endpointsModifiedCallbacks](self, "endpointsModifiedCallbacks");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v42, v41, self->_calloutQueue);

      }
      else
      {

        if ((v48 & 1) == 0)
        {
LABEL_33:

          v8 = v47;
          goto LABEL_34;
        }
      }
    }
    else
    {
      v10 = v46;
      if (!v48)
        goto LABEL_33;
    }
    -[MRAVRoutingDiscoverySession endpointsChangedCallbacks](self, "endpointsChangedCallbacks");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoutingDiscoverySession _performEndpointsCallbacks:withEndpoints:onQueue:]((uint64_t)self, v43, v16, self->_calloutQueue);

    goto LABEL_33;
  }
LABEL_34:
  self->_previousEndpointsDiscoveryMode = v10;
  -[MRAVRoutingDiscoverySession logEndpointsChanged:oldEndpoints:](self, "logEndpointsChanged:oldEndpoints:", v7, v12);

}

- (NSMutableDictionary)endpointsChangedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVRoutingDiscoverySession_endpointsChangedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (void)notifyOutputDevicesChanged:(id)a3
{
  id v4;
  unsigned int v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MRAVRoutingDiscoverySession discoveryMode](self, "discoveryMode");
  if (v5)
    v6 = 1;
  else
    v6 = -[MRAVRoutingDiscoverySession alwaysAllowUpdates](self, "alwaysAllowUpdates");
  -[MRAVRoutingDiscoverySession outputDevicesSnapshot](self, "outputDevicesSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mr_distantOutputDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRAVRoutingDiscoverySession setOutputDevicesSnapshot:](self, "setOutputDevicesSnapshot:", v8);
  if (v6)
  {
    v41 = v7;
    LODWORD(v39) = v5;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v15, "uid", v39);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v12);
    }

    v5 = v39;
    if (self->_previousOutputDevicesDiscoveryMode == (_DWORD)v39)
    {
      +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v39) = objc_msgSend(v17, "calculateDiscoveryUpdates") ^ 1;

    }
    else
    {
      HIDWORD(v39) = 1;
    }
    -[MRAVRoutingDiscoverySession outputDevicesRemovedCallbacks](self, "outputDevicesRemovedCallbacks", v39);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");
    -[MRAVRoutingDiscoverySession outputDevicesChangedCallbacks](self, "outputDevicesChangedCallbacks");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v19 + v21)
    {
      -[MRAVRoutingDiscoverySession _determineRemovedOutputDevices:previousOutputDevices:]((uint64_t)self, v8, (uint64_t)v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        -[MRAVRoutingDiscoverySession outputDevicesRemovedCallbacks](self, "outputDevicesRemovedCallbacks");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v23, v22, self->_calloutQueue);

        v40 = 1;
      }

    }
    -[MRAVRoutingDiscoverySession outputDevicesAddedCallbacks](self, "outputDevicesAddedCallbacks");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    -[MRAVRoutingDiscoverySession outputDevicesChangedCallbacks](self, "outputDevicesChangedCallbacks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v25 + v27)
    {
      -[MRAVRoutingDiscoverySession _determineAddedOutputDevices:previousOutputDevices:]((uint64_t)self, (uint64_t)v8, v41);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "mr_replaceOutputDevicesWithOutputDevices:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v29, "count"))
      {
        -[MRAVRoutingDiscoverySession outputDevicesAddedCallbacks](self, "outputDevicesAddedCallbacks");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v30, v29, self->_calloutQueue);

        v40 = 1;
      }

    }
    -[MRAVRoutingDiscoverySession outputDevicesModifiedCallbacks](self, "outputDevicesModifiedCallbacks");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");
    -[MRAVRoutingDiscoverySession outputDevicesChangedCallbacks](self, "outputDevicesChangedCallbacks");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v32 + v34)
    {
      v7 = v41;
      -[MRAVRoutingDiscoverySession _determineModifiedOutputDevices:previousOutputDevices:]((uint64_t)self, v8, v41);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "mr_replaceOutputDevicesWithOutputDevices:", v9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v36, "count"))
      {
        -[MRAVRoutingDiscoverySession outputDevicesModifiedCallbacks](self, "outputDevicesModifiedCallbacks");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v37, v36, self->_calloutQueue);

      }
      else
      {

        if ((v40 & 1) == 0)
        {
LABEL_32:

          goto LABEL_33;
        }
      }
    }
    else
    {
      v7 = v41;
      if (!v40)
        goto LABEL_32;
    }
    -[MRAVRoutingDiscoverySession outputDevicesChangedCallbacks](self, "outputDevicesChangedCallbacks");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRAVRoutingDiscoverySession _performOutputDevicesCallbacks:withOutputDevices:onQueue:]((uint64_t)self, v38, v10, self->_calloutQueue);

    goto LABEL_32;
  }
LABEL_33:
  self->_previousOutputDevicesDiscoveryMode = v5;
  -[MRAVRoutingDiscoverySession logOutputDevicesChanged:oldOutputDevices:](self, "logOutputDevicesChanged:oldOutputDevices:", v4, v7);

}

- (NSMutableDictionary)outputDevicesChangedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVRoutingDiscoverySession_outputDevicesChangedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (BOOL)alwaysAllowUpdates
{
  return self->_alwaysAllowUpdates;
}

- (void)setOutputDevicesSnapshot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)logOutputDevicesChanged:(id)a3 oldOutputDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  MRAVRoutingDiscoverySession *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self
    && (-[MRAVRoutingDiscoverySession alwaysLogUpdates](self, "alwaysLogUpdates")
     || -[MRAVRoutingDiscoverySession discoveryMode](self, "discoveryMode")
     || -[MRAVRoutingDiscoverySession alwaysAllowUpdates](self, "alwaysAllowUpdates")))
  {
    if (v7)
      v8 = v7;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v8, "changeDescriptionTo:keyBlock:isUpdatedBlock:descriptionBlock:", v6, &__block_literal_global_106, &__block_literal_global_108, &__block_literal_global_109_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      MRLogCategoryDiscoveryUpdates();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Output devices changed\n%{public}@", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (NSArray)outputDevicesSnapshot
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__MRAVRoutingDiscoverySession_outputDevicesSnapshot__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setEndpointsSnapshot:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRAVRoutingDiscoverySession_setEndpointsSnapshot___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)logEndpointsChanged:(id)a3 oldEndpoints:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  MRAVRoutingDiscoverySession *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self
    && (-[MRAVRoutingDiscoverySession alwaysLogUpdates](self, "alwaysLogUpdates")
     || -[MRAVRoutingDiscoverySession discoveryMode](self, "discoveryMode")
     || -[MRAVRoutingDiscoverySession alwaysAllowUpdates](self, "alwaysAllowUpdates")))
  {
    if (v7)
      v8 = v7;
    else
      v8 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v8, "changeDescriptionTo:keyBlock:isUpdatedBlock:descriptionBlock:", v6, &__block_literal_global_111_0, &__block_literal_global_113_0, &__block_literal_global_115_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      MRLogCategoryDiscoveryUpdates();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = self;
        v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Endpoints changed\n%{public}@", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (NSArray)endpointsSnapshot
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__MRAVRoutingDiscoverySession_endpointsSnapshot__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSMutableDictionary)endpointsAddedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__MRAVRoutingDiscoverySession_endpointsAddedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)endpointsRemovedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVRoutingDiscoverySession_endpointsRemovedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)endpointsModifiedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__MRAVRoutingDiscoverySession_endpointsModifiedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (id)_determineRemovedOutputDevices:(uint64_t)a3 previousOutputDevices:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    v5 = a2;
    objc_msgSend(v4, "setWithArray:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "minusSet:", v7);
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_determineModifiedEndpoints:(void *)a3 previousEndpoints:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__MRAVRoutingDiscoverySession__determineModifiedEndpoints_previousEndpoints___block_invoke;
    v9[3] = &unk_1E30CBFE0;
    v10 = v5;
    objc_msgSend(a2, "mr_filter:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __77__MRAVRoutingDiscoverySession__determineModifiedEndpoints_previousEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToEndpoint:", v6) ^ 1;

  }
  return v5;
}

- (id)_determineAddedOutputDevices:(void *)a3 previousOutputDevices:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a1)
  {
    v4 = (void *)MEMORY[0x1E0C99E20];
    v5 = a3;
    objc_msgSend(v4, "setWithArray:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "minusSet:", v7);
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSMutableDictionary)outputDevicesRemovedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVRoutingDiscoverySession_outputDevicesRemovedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)outputDevicesModifiedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MRAVRoutingDiscoverySession_outputDevicesModifiedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (NSMutableDictionary)outputDevicesAddedCallbacks
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVRoutingDiscoverySession_outputDevicesAddedCallbacks__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (void)_performEndpointsCallbacks:(void *)a3 withEndpoints:(void *)a4 onQueue:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void (**v15)(_QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[4];
  id v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__MRAVRoutingDiscoverySession__performEndpointsCallbacks_withEndpoints_onQueue___block_invoke;
      block[3] = &unk_1E30C5F40;
      v21 = v7;
      v22 = v8;
      dispatch_async(v10, block);

    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v7);
            objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
            v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id))v15)[2](v15, v8);

          }
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
        }
        while (v12);
      }
    }
  }

}

- (id)_determineModifiedOutputDevices:(void *)a3 previousOutputDevices:
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__MRAVRoutingDiscoverySession__determineModifiedOutputDevices_previousOutputDevices___block_invoke;
    v9[3] = &unk_1E30CC008;
    v10 = v5;
    v11 = a1;
    objc_msgSend(a2, "mr_filter:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_performOutputDevicesCallbacks:(void *)a3 withOutputDevices:(void *)a4 onQueue:
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void (**v15)(_QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[4];
  id v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__MRAVRoutingDiscoverySession__performOutputDevicesCallbacks_withOutputDevices_onQueue___block_invoke;
      block[3] = &unk_1E30C5F40;
      v21 = v7;
      v22 = v8;
      dispatch_async(v10, block);

    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v7);
            objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
            v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, id))v15)[2](v15, v8);

          }
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
        }
        while (v12);
      }
    }
  }

}

- (NSMapTable)clientDiscoveryStates
{
  return self->_clientDiscoveryStates;
}

- (MRAVRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v4;
  MRAVRoutingDiscoverySession *v5;
  id v6;
  objc_class *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  id v13;
  objc_class *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *calloutQueue;
  NSMutableDictionary *v20;
  NSMutableDictionary *endpointsChangedCallbacks;
  NSMutableDictionary *v22;
  NSMutableDictionary *endpointsAddedCallbacks;
  NSMutableDictionary *v24;
  NSMutableDictionary *endpointsRemovedCallbacks;
  NSMutableDictionary *v26;
  NSMutableDictionary *endpointsModifiedCallbacks;
  NSMutableDictionary *v28;
  NSMutableDictionary *outputDevicesChangedCallbacks;
  NSMutableDictionary *v30;
  NSMutableDictionary *outputDevicesAddedCallbacks;
  NSMutableDictionary *v32;
  NSMutableDictionary *outputDevicesRemovedCallbacks;
  NSMutableDictionary *v34;
  NSMutableDictionary *outputDevicesModifiedCallbacks;
  NSArray *v36;
  NSArray *endpointsSnapshot;
  NSArray *v38;
  NSArray *outputDevicesSnapshot;
  uint64_t v40;
  MRAVRoutingDiscoverySessionConfiguration *configuration;
  uint64_t v42;
  NSMapTable *clientDiscoveryStates;
  void *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MRAVRoutingDiscoverySession;
  v5 = -[MRAVRoutingDiscoverySession init](&v46, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (objc_class *)objc_opt_class();
    v8 = objc_retainAutorelease((id)objc_msgSend(v6, "initWithFormat:", CFSTR("%s.serialQueue"), class_getName(v7)));
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = (objc_class *)objc_opt_class();
    v15 = objc_retainAutorelease((id)objc_msgSend(v13, "initWithFormat:", CFSTR("%s.calloutQueue"), class_getName(v14)));
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointsChangedCallbacks = v5->_endpointsChangedCallbacks;
    v5->_endpointsChangedCallbacks = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointsAddedCallbacks = v5->_endpointsAddedCallbacks;
    v5->_endpointsAddedCallbacks = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointsRemovedCallbacks = v5->_endpointsRemovedCallbacks;
    v5->_endpointsRemovedCallbacks = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endpointsModifiedCallbacks = v5->_endpointsModifiedCallbacks;
    v5->_endpointsModifiedCallbacks = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outputDevicesChangedCallbacks = v5->_outputDevicesChangedCallbacks;
    v5->_outputDevicesChangedCallbacks = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outputDevicesAddedCallbacks = v5->_outputDevicesAddedCallbacks;
    v5->_outputDevicesAddedCallbacks = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outputDevicesRemovedCallbacks = v5->_outputDevicesRemovedCallbacks;
    v5->_outputDevicesRemovedCallbacks = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outputDevicesModifiedCallbacks = v5->_outputDevicesModifiedCallbacks;
    v5->_outputDevicesModifiedCallbacks = v34;

    v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    endpointsSnapshot = v5->_endpointsSnapshot;
    v5->_endpointsSnapshot = v36;

    v38 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    outputDevicesSnapshot = v5->_outputDevicesSnapshot;
    v5->_outputDevicesSnapshot = v38;

    v40 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (MRAVRoutingDiscoverySessionConfiguration *)v40;

    v5->_alwaysAllowUpdates = objc_msgSend(v4, "alwaysAllowUpdates");
    v5->_populatesExternalDevice = objc_msgSend(v4, "populatesExternalDevice");
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v42 = objc_claimAutoreleasedReturnValue();
    clientDiscoveryStates = v5->_clientDiscoveryStates;
    v5->_clientDiscoveryStates = (NSMapTable *)v42;

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addDiscoverySession:", v5);

  }
  return v5;
}

+ (id)discoverySessionWithConfiguration:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  MRAVRoutingDiscoverySessionWrapper *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "discoverySessionFactories");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        if (v10)
        {
          v11 = v10;

          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (objc_msgSend(v4, "isLocal", (_QWORD)v15) && (objc_msgSend(v4, "features") & 8) == 0)
    objc_msgSend(v4, "features");
  v11 = objc_opt_class();
  if (v11)
  {
LABEL_14:
    objc_msgSend(a1, "sharedDiscoverySessionForClass:configuration:", v11, v4, (_QWORD)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MRAVRoutingDiscoverySessionWrapper initWithSession:configuration:]([MRAVRoutingDiscoverySessionWrapper alloc], "initWithSession:configuration:", v12, v4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)sharedDiscoverySessionForClass:(Class)a3 configuration:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  v7 = (void *)sharedSessionsByClass;
  if (!sharedSessionsByClass)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)sharedSessionsByClass;
    sharedSessionsByClass = v8;

    v7 = (void *)sharedSessionsByClass;
  }
  objc_msgSend(v7, "objectForKey:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedSessionsByClass, "setObject:forKey:", v10, a3);
  }
  objc_msgSend(v10, "objectForKey:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = (void *)objc_msgSend([a3 alloc], "initWithConfiguration:", v5);
    objc_msgSend(v10, "setObject:forKey:", v11, v5);
  }

  objc_sync_exit(v6);
  return v11;
}

+ (NSMutableArray)discoverySessionFactories
{
  if (discoverySessionFactories_onceToken != -1)
    dispatch_once(&discoverySessionFactories_onceToken, &__block_literal_global_68);
  return (NSMutableArray *)(id)discoverySessionFactories_factories;
}

void __56__MRAVRoutingDiscoverySession_discoverySessionFactories__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)discoverySessionFactories_factories;
  discoverySessionFactories_factories = (uint64_t)v0;

}

void __80__MRAVRoutingDiscoverySession__performEndpointsCallbacks_withEndpoints_onQueue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __88__MRAVRoutingDiscoverySession__performOutputDevicesCallbacks_withOutputDevices_onQueue___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v7[2](v7, *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "availableEndpoints");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "availableOutputDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (id)addEndpointsChangedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  id v7;
  NSObject *calloutQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__28;
  v21 = __Block_byref_object_dispose__28;
  v22 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v16 = &v17;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __59__MRAVRoutingDiscoverySession_addEndpointsChangedCallback___block_invoke_2;
  v12[3] = &unk_1E30C5B40;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  dispatch_async(calloutQueue, v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(v5, "setObject:forKey:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientDiscoveryStates, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_outputDevicesModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesChangedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsModifiedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsRemovedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsAddedCallbacks, 0);
  objc_storeStrong((id *)&self->_endpointsChangedCallbacks, 0);
  objc_storeStrong((id *)&self->_outputDevicesSnapshot, 0);
  objc_storeStrong((id *)&self->_endpointsSnapshot, 0);
}

- (id)addOutputDevicesChangedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  id v7;
  NSObject *calloutQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__28;
  v21 = __Block_byref_object_dispose__28;
  v22 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v16 = &v17;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __63__MRAVRoutingDiscoverySession_addOutputDevicesChangedCallback___block_invoke_2;
  v12[3] = &unk_1E30C5B40;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  dispatch_async(calloutQueue, v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ (id)discoverySessionWithEndpointFeatures:(unsigned int)a3 enableThrottling:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:](MRAVRoutingDiscoverySessionConfiguration, "configurationWithEndpointFeatures:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnableThrottling:", v4);
  objc_msgSend(a1, "discoverySessionWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)discoverySessionWithEndpointFeatures:(unsigned int)a3
{
  void *v4;
  void *v5;

  +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:](MRAVRoutingDiscoverySessionConfiguration, "configurationWithEndpointFeatures:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "discoverySessionWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MRAVRoutingDiscoverySession)initWithFeatures:(unsigned int)a3
{
  void *v4;
  MRAVRoutingDiscoverySession *v5;

  +[MRAVRoutingDiscoverySessionConfiguration configurationWithEndpointFeatures:](MRAVRoutingDiscoverySessionConfiguration, "configurationWithEndpointFeatures:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRAVRoutingDiscoverySession initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (void)removeEndpointsChangedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRAVRoutingDiscoverySession_removeEndpointsChangedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __62__MRAVRoutingDiscoverySession_removeEndpointsChangedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)removeOutputDevicesChangedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRAVRoutingDiscoverySession_removeOutputDevicesChangedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __66__MRAVRoutingDiscoverySession_removeOutputDevicesChangedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)addEndpointsAddedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  id v7;
  NSObject *calloutQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__28;
  v21 = __Block_byref_object_dispose__28;
  v22 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v16 = &v17;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke_2;
  v12[3] = &unk_1E30C5B40;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  dispatch_async(calloutQueue, v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __57__MRAVRoutingDiscoverySession_addEndpointsAddedCallback___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "availableEndpoints");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removeEndpointsAddedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRAVRoutingDiscoverySession_removeEndpointsAddedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __60__MRAVRoutingDiscoverySession_removeEndpointsAddedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)addEndpointsRemovedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MRAVRoutingDiscoverySession_addEndpointsRemovedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__MRAVRoutingDiscoverySession_addEndpointsRemovedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)removeEndpointsRemovedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRAVRoutingDiscoverySession_removeEndpointsRemovedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __62__MRAVRoutingDiscoverySession_removeEndpointsRemovedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)addEndpointsModifiedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MRAVRoutingDiscoverySession_addEndpointsModifiedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__MRAVRoutingDiscoverySession_addEndpointsModifiedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)removeEndpointsModifiedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRAVRoutingDiscoverySession_removeEndpointsModifiedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __63__MRAVRoutingDiscoverySession_removeEndpointsModifiedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)addOutputDevicesAddedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  id v7;
  NSObject *calloutQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__28;
  v21 = __Block_byref_object_dispose__28;
  v22 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v16 = &v17;
  block[4] = self;
  v7 = v4;
  v15 = v7;
  dispatch_sync(serialQueue, block);
  calloutQueue = self->_calloutQueue;
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke_2;
  v12[3] = &unk_1E30C5B40;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  dispatch_async(calloutQueue, v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

void __61__MRAVRoutingDiscoverySession_addOutputDevicesAddedCallback___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "availableOutputDevices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)removeOutputDevicesAddedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRAVRoutingDiscoverySession_removeOutputDevicesAddedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __64__MRAVRoutingDiscoverySession_removeOutputDevicesAddedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)addOutputDevicesRemovedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRAVRoutingDiscoverySession_addOutputDevicesRemovedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__MRAVRoutingDiscoverySession_addOutputDevicesRemovedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)removeOutputDevicesRemovedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRAVRoutingDiscoverySession_removeOutputDevicesRemovedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __66__MRAVRoutingDiscoverySession_removeOutputDevicesRemovedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

- (id)addOutputDevicesModifiedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRAVRoutingDiscoverySession_addOutputDevicesModifiedCallback___block_invoke;
  block[3] = &unk_1E30CBEF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __64__MRAVRoutingDiscoverySession_addOutputDevicesModifiedCallback___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v5 = (void *)MEMORY[0x194036C44]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)removeOutputDevicesModifiedCallback:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MRAVRoutingDiscoverySession_removeOutputDevicesModifiedCallback___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __67__MRAVRoutingDiscoverySession_removeOutputDevicesModifiedCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

+ (void)registerDiscoverySessionFactory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "discoverySessionFactories");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x194036C44](v6);
  objc_msgSend(v4, "addObject:", v5);

  objc_sync_exit(v4);
}

- (void)notifyEndpointsChanged:(id)a3
{
  -[MRAVRoutingDiscoverySession notifyAvailableEndpointsChanged:discoveredEndpoints:](self, "notifyAvailableEndpointsChanged:discoveredEndpoints:", a3, a3);
}

uint64_t __85__MRAVRoutingDiscoverySession__determineModifiedOutputDevices_previousOutputDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verboseDiscoveryLogging");

    if (v8)
    {
      v20 = 0;
      v21 = 0;
      v19 = 0;
      v9 = objc_msgSend(v3, "isEqualToOutputDevice:denyList:addedProperties:removedProperties:changedProperties:", v6, 0, &v21, &v20, &v19);
      v10 = v21;
      v11 = v20;
      v12 = v19;
      if ((v9 & 1) == 0)
      {
        MRLogCategoryDiscoveryOversize();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v23 = v14;
          _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - OutputDevice modified", buf, 0xCu);
        }

      }
      if (objc_msgSend(v10, "count"))
      {
        MRLogCategoryDiscoveryOversize();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v10;
          _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Added Fields: %{public}@", buf, 0xCu);
        }

      }
      if (objc_msgSend(v11, "count"))
      {
        MRLogCategoryDiscoveryOversize();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v11;
          _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Removed Fields: %{public}@", buf, 0xCu);
        }

      }
      if (objc_msgSend(v12, "count"))
      {
        MRLogCategoryDiscoveryOversize();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v12;
          _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, "Changed Values: %{public}@", buf, 0xCu);
        }

      }
    }
    else
    {
      v9 = objc_msgSend(v3, "isEqualToOutputDevice:", v6);
    }
    v5 = v9 ^ 1u;

  }
  return v5;
}

- (void)setAlwaysAllowUpdates:(BOOL)a3
{
  self->_alwaysAllowUpdates = a3;
}

- (BOOL)onlyDiscoversBluetoothDevices
{
  return self->_onlyDiscoversBluetoothDevices;
}

- (void)setOnlyDiscoversBluetoothDevices:(BOOL)a3
{
  self->_onlyDiscoversBluetoothDevices = a3;
}

- (BOOL)alwaysLogUpdates
{
  return self->_alwaysLogUpdates;
}

- (void)setAlwaysLogUpdates:(BOOL)a3
{
  self->_alwaysLogUpdates = a3;
}

- (void)setEndpointsChangedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsChangedCallbacks, a3);
}

- (void)setEndpointsAddedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsAddedCallbacks, a3);
}

- (void)setEndpointsRemovedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsRemovedCallbacks, a3);
}

- (void)setEndpointsModifiedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_endpointsModifiedCallbacks, a3);
}

- (void)setOutputDevicesChangedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevicesChangedCallbacks, a3);
}

- (void)setOutputDevicesAddedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevicesAddedCallbacks, a3);
}

- (void)setOutputDevicesRemovedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevicesRemovedCallbacks, a3);
}

- (void)setOutputDevicesModifiedCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevicesModifiedCallbacks, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setClientDiscoveryStates:(id)a3
{
  objc_storeStrong((id *)&self->_clientDiscoveryStates, a3);
}

- (MRAVRoutingDiscoverySessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)populatesExternalDevice
{
  return self->_populatesExternalDevice;
}

- (void)setPopulatesExternalDevice:(BOOL)a3
{
  self->_populatesExternalDevice = a3;
}

@end
