@implementation AXAuditInspectorFocus

- (void)setInspectorSections:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSArray *inspectorSections;
  AXAuditInspectorFocus *v16;
  NSArray *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = self;
  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = (NSArray *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "title", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v10, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v4, "containsObject:", v13);

            if ((v14 & 1) != 0)
              continue;
            -[NSArray addObject:](v17, "addObject:", v10);
            objc_msgSend(v10, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);
          }
          else
          {

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  inspectorSections = v16->_inspectorSections;
  v16->_inspectorSections = v17;

}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportPropertyEntry *v7;
  AXAuditObjectTransportInfoPropertyBased *v8;

  v3 = a3;
  v8 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditInspectorFocus_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v8, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("ElementValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_9);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_9_0);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v8, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("CaptionTextValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_14_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_16_1);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v8, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("SpokenDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_20_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_21);
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v8, "addPropertyEntry:", v7);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v7, "setTransportKey:", CFSTR("InspectorSectionsValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v7, "setLocalValueToTransportValue:", &__block_literal_global_25);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v7, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_27);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v8);

}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "element");
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setElement:", v4);

}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "captionText");
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setCaptionText:", v4);

}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "spokenDescription");
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setSpokenDescription:", v4);

}

uint64_t __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "inspectorSections");
}

void __64__AXAuditInspectorFocus_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setInspectorSections:", v4);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[AXAuditInspectorFocus element](self, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditInspectorFocus captionText](self, "captionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AXAuditInspectorFocus inspectorSections](self, "inspectorSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[AXAuditInspectorFocus spokenDescription](self, "spokenDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditInspectorFocus *v4;
  AXAuditInspectorFocus *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;

  v4 = (AXAuditInspectorFocus *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXAuditInspectorFocus element](v5, "element");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditInspectorFocus element](self, "element");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
      {
        v14 = 0;
      }
      else
      {
        -[AXAuditInspectorFocus inspectorSections](v5, "inspectorSections");
        v8 = objc_claimAutoreleasedReturnValue();
        -[AXAuditInspectorFocus inspectorSections](self, "inspectorSections");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v8 | v9 && !objc_msgSend((id)v8, "isEqual:", v9))
        {
          v14 = 0;
        }
        else
        {
          -[AXAuditInspectorFocus captionText](v5, "captionText");
          v10 = objc_claimAutoreleasedReturnValue();
          -[AXAuditInspectorFocus captionText](self, "captionText");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v10 | v11 && !objc_msgSend((id)v10, "isEqual:", v11))
          {
            v14 = 0;
          }
          else
          {
            v16 = v8;
            -[AXAuditInspectorFocus spokenDescription](v5, "spokenDescription");
            v12 = objc_claimAutoreleasedReturnValue();
            -[AXAuditInspectorFocus spokenDescription](self, "spokenDescription");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = !(v12 | v13) || objc_msgSend((id)v12, "isEqual:", v13);

            v8 = v16;
          }

        }
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AXAuditInspectorFocus element](self, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setElement:", v5);

  -[AXAuditInspectorFocus inspectorSections](self, "inspectorSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setInspectorSections:", v7);

  -[AXAuditInspectorFocus captionText](self, "captionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptionText:", v8);

  -[AXAuditInspectorFocus spokenDescription](self, "spokenDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenDescription:", v9);

  return v4;
}

- (AXAuditElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (NSArray)inspectorSections
{
  return self->_inspectorSections;
}

- (NSString)captionText
{
  return self->_captionText;
}

- (void)setCaptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)spokenDescription
{
  return self->_spokenDescription;
}

- (void)setSpokenDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenDescription, 0);
  objc_storeStrong((id *)&self->_captionText, 0);
  objc_storeStrong((id *)&self->_inspectorSections, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
