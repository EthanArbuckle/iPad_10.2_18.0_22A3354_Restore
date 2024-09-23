@implementation NSObject(MSVDebugUtilities)

- (uint64_t)__msv_objectDescription
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), a1);
}

- (uint64_t)__msv_inspect
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 285278466);
}

- (uint64_t)__msv_ivars
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 256);
}

- (uint64_t)__msv_methods
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 285212674);
}

- (uint64_t)__msv_properties
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 65538);
}

- (id)__msv_inspectWithOptions:()MSVDebugUtilities
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;

  if (MSVProcessIsDebugging())
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    v7 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke;
    v27[3] = &unk_1E43E8B30;
    v8 = v5;
    v28 = v8;
    v29 = a3;
    _MSVEnumerateClassHierarchy(v6, 1, v27);
    if ((a3 & 0x100) != 0)
    {
      objc_msgSend(v8, "appendString:", CFSTR("{\n"));
      v13 = (void *)objc_opt_class();
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_3;
      v25[3] = &unk_1E43E8B80;
      v25[4] = a1;
      v14 = v8;
      v26 = v14;
      _MSVEnumerateClassHierarchy(v13, 0, v25);
      objc_msgSend(v14, "appendString:", CFSTR("}\n"));

      if ((a3 & 0x10000) != 0)
      {
LABEL_4:
        objc_msgSend(v8, "appendString:", CFSTR("\n# Properties\n"));
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_opt_class();
        v21[0] = v7;
        v21[1] = 3221225472;
        v21[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_5;
        v21[3] = &unk_1E43E8BD0;
        v24 = a3;
        v21[4] = a1;
        v11 = v9;
        v22 = v11;
        v23 = v8;
        _MSVEnumerateClassHierarchy(v10, 0, v21);

        if ((a3 & 0x1000000) == 0)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR("\n"));
      if ((a3 & 0x10000) != 0)
        goto LABEL_4;
    }
    v11 = 0;
    if ((a3 & 0x1000000) == 0)
    {
LABEL_10:
      v12 = v8;

      return v12;
    }
LABEL_9:
    objc_msgSend(v8, "appendString:", CFSTR("\n# Methods\n"));
    v15 = (void *)objc_opt_class();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_7;
    v17[3] = &unk_1E43E8C70;
    v20 = a3;
    v18 = v11;
    v19 = v8;
    _MSVEnumerateClassHierarchy(v15, 0, v17);

    goto LABEL_10;
  }
  v12 = 0;
  return v12;
}

@end
