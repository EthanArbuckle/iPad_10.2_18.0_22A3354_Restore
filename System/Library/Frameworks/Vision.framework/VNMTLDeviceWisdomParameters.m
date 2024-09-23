@implementation VNMTLDeviceWisdomParameters

- (id)_wisdomResourcesPath
{
  void *v2;
  void *v3;
  void *v4;

  VNFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Wisdom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cachedMetalDeviceWisdomParametersAndReturnError:(id *)a3
{
  if (a3)
  {
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", CFSTR("wisdom parameters are not available for the system"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)wisdomParameterForMTLDevice:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNMTLDeviceWisdomParameters wisdomParameterForMTLDeviceWithName:error:](self, "wisdomParameterForMTLDeviceWithName:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wisdomParameterForMTLDeviceWithName:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  -[VNMTLDeviceWisdomParameters _cachedMetalDeviceWisdomParametersAndReturnError:](self, "_cachedMetalDeviceWisdomParametersAndReturnError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__8993;
    v20 = __Block_byref_object_dispose__8994;
    v21 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__VNMTLDeviceWisdomParameters_wisdomParameterForMTLDeviceWithName_error___block_invoke;
    v13[3] = &unk_1E4544B60;
    v8 = v6;
    v14 = v8;
    v15 = &v16;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    v9 = (void *)v17[5];
    if (v9)
    {
      v10 = v9;
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wisdom parameters are not available for the device \"%@\"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __73__VNMTLDeviceWisdomParameters_wisdomParameterForMTLDeviceWithName_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "containsString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

@end
