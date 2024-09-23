@implementation AXAuditElementAttribute

- (AXAuditElementAttribute)init
{
  AXAuditElementAttribute *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXAuditElementAttribute;
  result = -[AXAuditElementAttribute init](&v3, sel_init);
  if (result)
    result->_valueType = 1;
  return result;
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
  AXAuditObjectTransportPropertyEntry *v10;
  AXAuditObjectTransportPropertyEntry *v11;
  AXAuditObjectTransportPropertyEntry *v12;
  AXAuditObjectTransportInfoPropertyBased *v13;

  v3 = a3;
  v13 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditElementAttribute_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("AttributeNameValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_2);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_7);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("HumanReadableNameValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_11_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_12_1);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("DeveloperAPISelectorValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_15);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_16);
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v7);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v7, "setTransportKey:", CFSTR("SettableValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v7, "setLocalValueToTransportValue:", &__block_literal_global_20);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v7, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_23);
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v8);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v8, "setTransportKey:", CFSTR("PerformsActionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v8, "setLocalValueToTransportValue:", &__block_literal_global_28);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v8, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_29);
  v9 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v9);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v9, "setTransportKey:", CFSTR("ValueTypeValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v9, "setLocalValueToTransportValue:", &__block_literal_global_32_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v9, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_33);
  v10 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v10);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v10, "setTransportKey:", CFSTR("DisplayInlineValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v10, "setLocalValueToTransportValue:", &__block_literal_global_36);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v10, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_37_0);
  v11 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v11);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v11, "setTransportKey:", CFSTR("DisplayAsTree_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v11, "setLocalValueToTransportValue:", &__block_literal_global_40);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v11, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_41);
  v12 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v13, "addPropertyEntry:", v12);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v12, "setTransportKey:", CFSTR("IsInternal_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v12, "setLocalValueToTransportValue:", &__block_literal_global_44_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v12, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_45);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v13);

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributeName");
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAttributeName:", v4);

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "humanReadableName");
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setHumanReadableName:", v4);

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "developerAPISelector");
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setDeveloperAPISelector:", v4);

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "isSettable"));
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setSettable:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "performsAction"));
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setPerformsAction:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "valueType"));
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setValueType:", objc_msgSend(v4, "integerValue"));

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "displayInline"));
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setDisplayInline:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "displayAsTree"));
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setDisplayAsTree:", objc_msgSend(v4, "BOOLValue"));

}

uint64_t __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_17(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a2, "isInternal"));
}

void __66__AXAuditElementAttribute_registerTransportableObjectWithManager___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setIsInternal:", objc_msgSend(v4, "BOOLValue"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXAuditElementAttribute attributeName](self, "attributeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributeName:", v5);

  -[AXAuditElementAttribute humanReadableName](self, "humanReadableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHumanReadableName:", v6);

  objc_msgSend(v4, "setSettable:", -[AXAuditElementAttribute isSettable](self, "isSettable"));
  objc_msgSend(v4, "setPerformsAction:", -[AXAuditElementAttribute performsAction](self, "performsAction"));
  objc_msgSend(v4, "setValueType:", -[AXAuditElementAttribute valueType](self, "valueType"));
  -[AXAuditElementAttribute developerAPISelector](self, "developerAPISelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeveloperAPISelector:", v7);

  objc_msgSend(v4, "setDisplayAsTree:", -[AXAuditElementAttribute displayAsTree](self, "displayAsTree"));
  objc_msgSend(v4, "setIsInternal:", -[AXAuditElementAttribute isInternal](self, "isInternal"));
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  -[AXAuditElementAttribute attributeName](self, "attributeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditElementAttribute humanReadableName](self, "humanReadableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[AXAuditElementAttribute isSettable](self, "isSettable");
  v8 = -[AXAuditElementAttribute performsAction](self, "performsAction");
  v9 = v7 ^ v8 ^ -[AXAuditElementAttribute valueType](self, "valueType");
  -[AXAuditElementAttribute developerAPISelector](self, "developerAPISelector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v9 ^ v11 ^ -[AXAuditElementAttribute isInternal](self, "isInternal");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditElementAttribute *v4;
  AXAuditElementAttribute *v5;
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (AXAuditElementAttribute *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[AXAuditElementAttribute valueType](v5, "valueType");
      if (v6 == -[AXAuditElementAttribute valueType](self, "valueType")
        && (v7 = -[AXAuditElementAttribute isSettable](v5, "isSettable"),
            v7 == -[AXAuditElementAttribute isSettable](self, "isSettable"))
        && (v8 = -[AXAuditElementAttribute performsAction](v5, "performsAction"),
            v8 == -[AXAuditElementAttribute performsAction](self, "performsAction"))
        && (v9 = -[AXAuditElementAttribute isInternal](v5, "isInternal"),
            v9 == -[AXAuditElementAttribute isInternal](self, "isInternal")))
      {
        -[AXAuditElementAttribute attributeName](self, "attributeName");
        v12 = objc_claimAutoreleasedReturnValue();
        -[AXAuditElementAttribute attributeName](v5, "attributeName");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v12 | v13 && !objc_msgSend((id)v12, "isEqual:", v13))
        {
          v10 = 0;
        }
        else
        {
          -[AXAuditElementAttribute humanReadableName](self, "humanReadableName");
          v14 = objc_claimAutoreleasedReturnValue();
          -[AXAuditElementAttribute humanReadableName](v5, "humanReadableName");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v14 | v15 && !objc_msgSend((id)v14, "isEqual:", v15))
          {
            v10 = 0;
          }
          else
          {
            -[AXAuditElementAttribute developerAPISelector](self, "developerAPISelector");
            v16 = objc_claimAutoreleasedReturnValue();
            -[AXAuditElementAttribute developerAPISelector](v5, "developerAPISelector");
            v17 = objc_claimAutoreleasedReturnValue();
            v10 = !(v16 | v17) || objc_msgSend((id)v16, "isEqual:", v17);

          }
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXAuditElementAttribute;
  -[AXAuditElementAttribute description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAuditElementAttribute attributeName](self, "attributeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXAuditElementAttribute isSettable](self, "isSettable"))
    v5 = CFSTR("settable");
  else
    v5 = &stru_25071BA38;
  v6 = -[AXAuditElementAttribute isInternal](self, "isInternal");
  v7 = CFSTR("internal");
  if (!v6)
    v7 = &stru_25071BA38;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("name:%@ %@ %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)attributeName
{
  return self->_attributeName;
}

- (void)setAttributeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)developerAPISelector
{
  return self->_developerAPISelector;
}

- (void)setDeveloperAPISelector:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (void)setHumanReadableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void)setSettable:(BOOL)a3
{
  self->_settable = a3;
}

- (BOOL)performsAction
{
  return self->_performsAction;
}

- (void)setPerformsAction:(BOOL)a3
{
  self->_performsAction = a3;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)displayInline
{
  return self->_displayInline;
}

- (void)setDisplayInline:(BOOL)a3
{
  self->_displayInline = a3;
}

- (BOOL)displayAsTree
{
  return self->_displayAsTree;
}

- (void)setDisplayAsTree:(BOOL)a3
{
  self->_displayAsTree = a3;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(int64_t)a3
{
  self->_valueType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_developerAPISelector, 0);
  objc_storeStrong((id *)&self->_attributeName, 0);
}

@end
