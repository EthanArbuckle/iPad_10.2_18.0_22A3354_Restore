@implementation CFXFilterEffectContentDataSource

- (CFXFilterEffectContentDataSource)initWithEffectID:(id)a3
{
  id v4;
  CFXFilterEffectContentDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  NSString *contentVersion;
  NSNumber *requiredProVideoVersion;
  void *v26;
  uint64_t v27;
  NSString *localizedDisplayName;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSNumber *isExpensive;
  uint64_t v34;
  NSNumber *proxyRenderScale;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  CFXFilterEffectContentDataSource *v41;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CFXFilterEffectContentDataSource;
  v5 = -[CFXFilterEffectContentDataSource init](&v54, sel_init);
  if (!v5)
    goto LABEL_33;
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v6, "pathForResource:ofType:", kJFXEffectPropertiesResourceFile, kJFXEffectPropertiesPlistKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("Filters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_14;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("effects"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v49 = v13;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v16)
      {
        v17 = v16;
        v46 = v12;
        v47 = v9;
        v48 = v6;
        v18 = *(_QWORD *)v51;
LABEL_7:
        v19 = 0;
        while (1)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v19);
          objc_msgSend(v20, "objectForKey:", CFSTR("identifier"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isEqualToString:", v4) & 1) != 0)
            break;

          if (v17 == ++v19)
          {
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            if (v17)
              goto LABEL_7;
            v22 = 0;
            v23 = 1;
            v9 = v47;
            v6 = v48;
            v12 = v46;
            goto LABEL_28;
          }
        }
        v22 = v20;

        if (!v22)
        {
          v23 = 1;
          v9 = v47;
          v6 = v48;
          goto LABEL_21;
        }
        v9 = v47;
        v6 = v48;
        if ((unint64_t)objc_msgSend(v22, "count") < 3)
        {
          v23 = 1;
LABEL_21:
          v12 = v46;
          goto LABEL_29;
        }
        v5->_isContentAvailable = 0;
        contentVersion = v5->_contentVersion;
        v5->_contentAvailability = 0;
        v5->_contentVersion = (NSString *)CFSTR("nodatasource");

        requiredProVideoVersion = v5->_requiredProVideoVersion;
        v5->_requiredProVideoVersion = 0;

        v5->_isContentNew = 0;
        objc_msgSend(v4, "stringByAppendingString:", CFSTR("_Display Name"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", v15, &stru_24EE5C428, 0);
        v27 = objc_claimAutoreleasedReturnValue();

        localizedDisplayName = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v27;

        objc_msgSend(v4, "stringByAppendingString:", CFSTR("_Accessibility Name"));
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", v29, &stru_24EE5C428, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong((id *)&v5->_localizedAccessibilityName, v31);
        objc_msgSend(v22, "objectForKey:", CFSTR("isExpensive"));
        v32 = objc_claimAutoreleasedReturnValue();
        isExpensive = v5->_isExpensive;
        v5->_isExpensive = (NSNumber *)v32;

        objc_msgSend(v22, "objectForKey:", CFSTR("proxyRenderScale"));
        v34 = objc_claimAutoreleasedReturnValue();
        proxyRenderScale = v5->_proxyRenderScale;
        v5->_proxyRenderScale = (NSNumber *)v34;

        objc_msgSend(v22, "objectForKey:", CFSTR("isStyleTransfer"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v31;
        v45 = (void *)v29;
        v37 = v36;
        if (v36)
          LOBYTE(v36) = objc_msgSend(v36, "BOOLValue", v31, v29);
        v5->_isStyleTransfer = (char)v36;
        objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE795C0], v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        v12 = v46;
        v40 = v38 ? (int)objc_msgSend(v38, "intValue") : 2;
        v5->_inverseToneMapOperator = v40;

        v23 = 0;
      }
      else
      {
        v22 = 0;
        v23 = 1;
      }
LABEL_28:

LABEL_29:
      v14 = v49;

    }
    else
    {
      v23 = 1;
    }

  }
  else
  {
LABEL_14:
    v23 = 1;
  }

  if (v23)
    v41 = 0;
  else
LABEL_33:
    v41 = v5;

  return v41;
}

- (BOOL)isContentAvailable
{
  return self->_isContentAvailable;
}

- (void)setIsContentAvailable:(BOOL)a3
{
  self->_isContentAvailable = a3;
}

- (unint64_t)contentAvailability
{
  return self->_contentAvailability;
}

- (void)setContentAvailability:(unint64_t)a3
{
  self->_contentAvailability = a3;
}

- (NSString)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_contentVersion, a3);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedDisplayName, a3);
}

- (NSString)localizedAccessibilityName
{
  return self->_localizedAccessibilityName;
}

- (void)setLocalizedAccessibilityName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAccessibilityName, a3);
}

- (NSNumber)requiredProVideoVersion
{
  return self->_requiredProVideoVersion;
}

- (void)setRequiredProVideoVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requiredProVideoVersion, a3);
}

- (BOOL)isContentNew
{
  return self->_isContentNew;
}

- (void)setIsContentNew:(BOOL)a3
{
  self->_isContentNew = a3;
}

- (NSNumber)isExpensive
{
  return self->_isExpensive;
}

- (void)setIsExpensive:(id)a3
{
  objc_storeStrong((id *)&self->_isExpensive, a3);
}

- (BOOL)isStyleTransfer
{
  return self->_isStyleTransfer;
}

- (void)setIsStyleTransfer:(BOOL)a3
{
  self->_isStyleTransfer = a3;
}

- (NSNumber)proxyRenderScale
{
  return self->_proxyRenderScale;
}

- (void)setProxyRenderScale:(id)a3
{
  objc_storeStrong((id *)&self->_proxyRenderScale, a3);
}

- (int64_t)inverseToneMapOperator
{
  return self->_inverseToneMapOperator;
}

- (void)setInverseToneMapOperator:(int64_t)a3
{
  self->_inverseToneMapOperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyRenderScale, 0);
  objc_storeStrong((id *)&self->_isExpensive, 0);
  objc_storeStrong((id *)&self->_requiredProVideoVersion, 0);
  objc_storeStrong((id *)&self->_localizedAccessibilityName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
}

@end
