@implementation AXAuditElement

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportInfoPropertyBased *v6;

  v3 = a3;
  v6 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditElement_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("PlatformElementValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_9);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v4);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("AccessibilityIdentifier_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_12);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_14);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v5);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v6);

}

id __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "platformElementToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v5, "setPlatformElementToken:", v4);

}

uint64_t __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityIdentifier");
}

void __57__AXAuditElement_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AXAuditElement platformElementToken](self, "platformElementToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditElement accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditElement *v4;
  AXAuditElement *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = (AXAuditElement *)a3;
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
      -[AXAuditElement platformElementToken](self, "platformElementToken");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditElement platformElementToken](v5, "platformElementToken");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
      {
        v10 = 0;
      }
      else
      {
        -[AXAuditElement accessibilityIdentifier](self, "accessibilityIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        -[AXAuditElement accessibilityIdentifier](v5, "accessibilityIdentifier");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = !(v8 | v9) || objc_msgSend((id)v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXAuditElement platformElementToken](self, "platformElementToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlatformElementToken:", v5);

  -[AXAuditElement accessibilityIdentifier](self, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", v6);

  return v4;
}

- (__AXUIElement)createAxElementRefForXCTest
{
  void *v2;
  __AXUIElement *v3;
  __AXUIElement *v4;

  -[AXAuditElement axElement](self, "axElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__AXUIElement *)objc_msgSend(v2, "elementRef");
  v4 = v3;
  if (v3)
    CFRetain(v3);

  return v4;
}

- (id)platformElementToken
{
  return self->_platformElementToken;
}

- (void)setPlatformElementToken:(id)a3
{
  objc_storeStrong(&self->_platformElementToken, a3);
}

- (id)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessibilityIdentifier, 0);
  objc_storeStrong(&self->_platformElementToken, 0);
}

+ (id)auditElementWithElement:(id)a3 identifier:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setAxElement:", v6);

    objc_msgSend(v4, "setAccessibilityIdentifier:", v5);
  }
  return v4;
}

- (void)setAxElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *Data;
  AXAuditElement *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uiElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "axElement");

    if (v6)
    {
      Data = (void *)_AXUIElementCreateData();
      if (Data)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_9:

          goto LABEL_10;
        }
        v8 = self;
        v9 = Data;
      }
      else
      {
        v8 = self;
        v9 = 0;
      }
      -[AXAuditElement setPlatformElementToken:](v8, "setPlatformElementToken:", v9);
      goto LABEL_9;
    }
  }
  -[AXAuditElement setPlatformElementToken:](self, "setPlatformElementToken:", 0);
LABEL_10:

}

- (AXElement)axElement
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  void *v6;

  -[AXAuditElement platformElementToken](self, "platformElementToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("ElementData"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v4 = _AXUIElementCreateWithData()) != 0)
  {
    v5 = (const void *)v4;
    objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return (AXElement *)v6;
}

@end
