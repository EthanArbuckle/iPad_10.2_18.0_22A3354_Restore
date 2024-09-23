@implementation DUStructuredEntityResponseObjC

- (DUStructuredEntityResponseObjC)init
{
  DUStructuredEntityResponseObjC *v2;
  _TtC21DocumentUnderstanding26DUStructuredEntityResponse *v3;
  _TtC21DocumentUnderstanding26DUStructuredEntityResponse *underlying;
  DUStructuredEntityResponseObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUStructuredEntityResponseObjC;
  v2 = -[DUStructuredEntityResponseObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding26DUStructuredEntityResponse);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)structuredEntities
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DUStructuredEntityResponse structuredEntities](self->_underlying, "structuredEntities", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[DUObjCCompatibilityUtils objCStructuredEntityForStructuredEntity:](DUObjCCompatibilityUtils, "objCStructuredEntityForStructuredEntity:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setStructuredEntities:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        +[DUObjCCompatibilityUtils structuredEntityForObjCStructuredEntity:](DUObjCCompatibilityUtils, "structuredEntityForObjCStructuredEntity:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[DUStructuredEntityResponse setStructuredEntities:](self->_underlying, "setStructuredEntities:", v5);
}

- (DUDebugInfoObjC)responseDebugInfo
{
  void *v2;
  void *v3;

  -[DUStructuredEntityResponse responseDebugInfo](self->_underlying, "responseDebugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[DUObjCCompatibilityUtils objcDebugInfoForDebugInfo:](DUObjCCompatibilityUtils, "objcDebugInfoForDebugInfo:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DUDebugInfoObjC *)v3;
}

- (void)setResponseDebugInfo:(id)a3
{
  id v4;

  +[DUObjCCompatibilityUtils debugInfoForObjCDebugInfo:](DUObjCCompatibilityUtils, "debugInfoForObjCDebugInfo:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DUStructuredEntityResponse setResponseDebugInfo:](self->_underlying, "setResponseDebugInfo:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
