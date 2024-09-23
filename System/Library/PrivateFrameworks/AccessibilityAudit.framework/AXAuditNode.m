@implementation AXAuditNode

- (AXAuditNode)initWithAuditElement:(id)a3 description:(id)a4 roleDescription:(id)a5
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  AXAuditNode *v11;
  AXAuditNode *v12;
  const __CFString *v13;
  const __CFString *v14;
  objc_super v16;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  v16.receiver = self;
  v16.super_class = (Class)AXAuditNode;
  v11 = -[AXAuditNode init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[AXAuditNode setAuditElement:](v11, "setAuditElement:", v8);
    if (v9)
      v13 = v9;
    else
      v13 = &stru_25071BA38;
    -[AXAuditNode setHumanReadableDescription:](v12, "setHumanReadableDescription:", v13);
    if (v10)
      v14 = v10;
    else
      v14 = &stru_25071BA38;
    -[AXAuditNode setHumanReadableRoleDescription:](v12, "setHumanReadableRoleDescription:", v14);
  }

  return v12;
}

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportPropertyEntry *v7;
  AXAuditObjectTransportPropertyEntry *v8;
  AXAuditObjectTransportPropertyEntry *v9;
  AXAuditObjectTransportInfoPropertyBased *v10;

  v3 = a3;
  v10 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditNode_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v10, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("AuditElementValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_15);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_9_2);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v10, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("HumanReadableRoleDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_14_2);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_16_3);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v10, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("HumanReadableDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_20_2);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_21_2);
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v10, "addPropertyEntry:", v7);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v7, "setTransportKey:", CFSTR("ClassNameValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v7, "setLocalValueToTransportValue:", &__block_literal_global_24);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v7, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_25_0);
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v10, "addPropertyEntry:", v8);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v8, "setTransportKey:", CFSTR("IsIgnoredValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v8, "setLocalValueToTransportValue:", &__block_literal_global_29_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v8, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_30);
  v9 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v10, "addPropertyEntry:", v9);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v9, "setTransportKey:", CFSTR("ChildrenValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v9, "setLocalValueToTransportValue:", &__block_literal_global_37_1);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v9, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_39_0);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v10);

}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "auditElement");
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAuditElement:", v4);

}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "humanReadableRoleDescription");
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setHumanReadableRoleDescription:", v4);

}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "humanReadableDescription");
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setHumanReadableDescription:", v4);

}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "className");
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setClassName:", v4);

}

id __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isIgnored"))
    return MEMORY[0x24BDBD1C8];
  else
    return MEMORY[0x24BDBD1C0];
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setIsIgnored:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "children");
}

void __54__AXAuditNode_registerTransportableObjectWithManager___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setChildren:", v4);

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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;

  -[AXAuditNode auditElement](self, "auditElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditNode humanReadableDescription](self, "humanReadableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AXAuditNode children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[AXAuditNode humanReadableRoleDescription](self, "humanReadableRoleDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[AXAuditNode className](self, "className");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = v10 ^ (v12 + -[AXAuditNode isIgnored](self, "isIgnored"));

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditNode *v4;
  AXAuditNode *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = (AXAuditNode *)a3;
  if (self == v4)
  {
    v20 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXAuditNode auditElement](v5, "auditElement");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditNode auditElement](self, "auditElement");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
      {
        v20 = 0;
      }
      else
      {
        -[AXAuditNode className](v5, "className");
        v8 = objc_claimAutoreleasedReturnValue();
        -[AXAuditNode className](self, "className");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v8 | v9 && !objc_msgSend((id)v8, "isEqual:", v9))
        {
          v20 = 0;
        }
        else
        {
          -[AXAuditNode humanReadableDescription](v5, "humanReadableDescription");
          v10 = objc_claimAutoreleasedReturnValue();
          -[AXAuditNode humanReadableDescription](self, "humanReadableDescription");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v10 | v11 && !objc_msgSend((id)v10, "isEqual:", v11))
          {
            v20 = 0;
          }
          else
          {
            -[AXAuditNode humanReadableRoleDescription](v5, "humanReadableRoleDescription");
            v12 = objc_claimAutoreleasedReturnValue();
            -[AXAuditNode humanReadableRoleDescription](self, "humanReadableRoleDescription");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v12 | v25 && !objc_msgSend((id)v12, "isEqual:", v25))
            {
              v20 = 0;
            }
            else
            {
              v23 = v12;
              v24 = v11;
              -[AXAuditNode children](v5, "children");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXAuditNode children](self, "children");
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v14;
              if (v13 && v14 && !objc_msgSend(v13, "isEqualToArray:", v14))
              {
                v20 = 0;
              }
              else
              {
                v22 = v9;
                v16 = v10;
                v17 = v8;
                v18 = -[AXAuditNode isIgnored](v5, "isIgnored");
                v19 = v18 ^ -[AXAuditNode isIgnored](self, "isIgnored");
                v8 = v17;
                v10 = v16;
                v9 = v22;
                v20 = v19 ^ 1;
              }

              v12 = v23;
              v11 = v24;
            }

          }
        }

      }
    }
    else
    {
      v20 = 0;
    }
  }

  return v20;
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
  -[AXAuditNode auditElement](self, "auditElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAuditElement:", v5);

  -[AXAuditNode humanReadableDescription](self, "humanReadableDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHumanReadableDescription:", v6);

  -[AXAuditNode humanReadableRoleDescription](self, "humanReadableRoleDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHumanReadableRoleDescription:", v7);

  -[AXAuditNode className](self, "className");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClassName:", v8);

  -[AXAuditNode children](self, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChildren:", v9);

  objc_msgSend(v4, "setIsIgnored:", -[AXAuditNode isIgnored](self, "isIgnored"));
  return v4;
}

- (void)debugPrintDescendants
{
  -[AXAuditNode _printDescendantsWithLevel:](self, "_printDescendantsWithLevel:", 1);
}

- (void)_printDescendantsWithLevel:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[AXAuditNode humanReadableDescription](self, "humanReadableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditNode humanReadableRoleDescription](self, "humanReadableRoleDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("AXAuditNode[%ld]:%@ (%@)"), a3, v5, v6);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AXAuditNode children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = a3 + 1;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_printDescendantsWithLevel:", v10);
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXAuditNode;
  -[AXAuditNode description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditNode humanReadableDescription](self, "humanReadableDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditNode humanReadableRoleDescription](self, "humanReadableRoleDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditNode children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@(%@) with %ld children"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (AXAuditElement)auditElement
{
  return self->_auditElement;
}

- (void)setAuditElement:(id)a3
{
  objc_storeStrong((id *)&self->_auditElement, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSString)humanReadableDescription
{
  return self->_humanReadableDescription;
}

- (void)setHumanReadableDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)humanReadableRoleDescription
{
  return self->_humanReadableRoleDescription;
}

- (void)setHumanReadableRoleDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)className
{
  return self->_className;
}

- (void)setClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isIgnored
{
  return self->_isIgnored;
}

- (void)setIsIgnored:(BOOL)a3
{
  self->_isIgnored = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_humanReadableRoleDescription, 0);
  objc_storeStrong((id *)&self->_humanReadableDescription, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_auditElement, 0);
}

@end
