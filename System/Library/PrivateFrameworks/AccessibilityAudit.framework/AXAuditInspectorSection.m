@implementation AXAuditInspectorSection

- (AXAuditInspectorSection)init
{
  AXAuditInspectorSection *v2;
  uint64_t v3;
  NSMutableArray *elementAttributes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXAuditInspectorSection;
  v2 = -[AXAuditInspectorSection init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    elementAttributes = v2->__elementAttributes;
    v2->__elementAttributes = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)addAttribute:(id)a3 performsAction:(BOOL)a4 humanReadable:(id)a5 settable:(BOOL)a6 valueType:(int64_t)a7 isInternal:(BOOL)a8
{
  _BOOL8 v9;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v25;
  _BOOL4 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v25 = a6;
  v26 = a8;
  v9 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v27 = a5;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[AXAuditInspectorSection elementAttributes](self, "elementAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v13)
  {
LABEL_12:

    goto LABEL_15;
  }
  v14 = v13;
  v15 = *(_QWORD *)v29;
LABEL_3:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v15)
      objc_enumerationMutation(v12);
    v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
    objc_msgSend(v17, "attributeName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isEqual:", v11))
    {

      goto LABEL_10;
    }
    v19 = objc_msgSend(v17, "performsAction");

    if (v19 == v9)
      break;
LABEL_10:
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v14)
        goto LABEL_3;
      goto LABEL_12;
    }
  }
  v20 = v17;

  if (v20)
  {
    v21 = 0;
    v22 = v27;
    goto LABEL_16;
  }
LABEL_15:
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setAttributeName:", v11);
  objc_msgSend(v21, "setPerformsAction:", v9);
  v22 = v27;
  objc_msgSend(v21, "setHumanReadableName:", v27);
  objc_msgSend(v21, "setValueType:", a7);
  objc_msgSend(v21, "setSettable:", v25);
  objc_msgSend(v21, "setIsInternal:", v26);
  -[AXAuditInspectorSection addAttribute:](self, "addAttribute:", v21);
  v20 = 0;
LABEL_16:

  return v21;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportInfoPropertyBased *v7;

  v3 = a3;
  v7 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditInspectorSection_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v7, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("ElementAttributesValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_10);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_9_1);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v7, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("TitleValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_14_1);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_16_2);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v7, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("IdentifierValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_20_1);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_21_0);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v7);

}

uint64_t __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementAttributes");
}

void __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "set_elementAttributes:", v5);

  }
}

uint64_t __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "title");
}

void __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setTitle:", v4);

}

uint64_t __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

void __66__AXAuditInspectorSection_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setIdentifier:", v4);

}

- (void)addAttribute:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[AXAuditInspectorSection _elementAttributes](self, "_elementAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (NSArray)elementAttributes
{
  void *v2;
  void *v3;

  -[AXAuditInspectorSection _elementAttributes](self, "_elementAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[AXAuditInspectorSection title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditInspectorSection elementAttributes](self, "elementAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AXAuditInspectorSection identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditInspectorSection *v4;
  AXAuditInspectorSection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v4 = (AXAuditInspectorSection *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXAuditInspectorSection title](self, "title");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditInspectorSection title](v5, "title");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
      {
        v12 = 0;
      }
      else
      {
        -[AXAuditInspectorSection elementAttributes](self, "elementAttributes");
        v8 = objc_claimAutoreleasedReturnValue();
        -[AXAuditInspectorSection elementAttributes](v5, "elementAttributes");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v8 | v9 && !objc_msgSend((id)v8, "isEqual:", v9))
        {
          v12 = 0;
        }
        else
        {
          -[AXAuditInspectorSection identifier](self, "identifier");
          v10 = objc_claimAutoreleasedReturnValue();
          -[AXAuditInspectorSection identifier](v5, "identifier");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = !(v10 | v11) || objc_msgSend((id)v10, "isEqual:", v11);

        }
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXAuditInspectorSection title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[AXAuditInspectorSection identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  -[AXAuditInspectorSection _elementAttributes](self, "_elementAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v4, "set_elementAttributes:", v8);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXAuditInspectorSection;
  -[AXAuditInspectorSection description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditInspectorSection title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)_elementAttributes
{
  return self->__elementAttributes;
}

- (void)set_elementAttributes:(id)a3
{
  objc_storeStrong((id *)&self->__elementAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__elementAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
