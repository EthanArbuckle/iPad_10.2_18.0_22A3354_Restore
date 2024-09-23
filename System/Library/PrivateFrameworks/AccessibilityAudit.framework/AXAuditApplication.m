@implementation AXAuditApplication

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportPropertyEntry *v7;
  AXAuditObjectTransportPropertyEntry *v8;
  AXAuditObjectTransportInfoPropertyBased *v9;

  v3 = a3;
  v9 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditApplication_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("IconValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_20);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_7_1);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("DisplayNameValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_13);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_15_1);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("BundleIdentifierValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_19_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_20_3);
  v7 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v7);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v7, "setTransportKey:", CFSTR("PidValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v7, "setLocalValueToTransportValue:", &__block_literal_global_24_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v7, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_27_0);
  v8 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v9, "addPropertyEntry:", v8);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v8, "setTransportKey:", CFSTR("PsnValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v8, "setLocalValueToTransportValue:", &__block_literal_global_31);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v8, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_33_0);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v9);

}

id __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  UIImage *v2;
  void *v3;

  objc_msgSend(a2, "icon");
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v4);
    objc_msgSend(v6, "setIcon:", v5);

  }
}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayName");
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setDisplayName:", v4);

}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setBundleIdentifier:", v4);

}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "pid"));
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPid:", objc_msgSend(v4, "integerValue"));

}

uint64_t __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "psnObj");
}

void __61__AXAuditApplication_registerTransportableObjectWithManager___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setPsnObj:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXAuditApplication psnObj](self, "psnObj");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPsnObj:", v6);

  objc_msgSend(v4, "setPid:", -[AXAuditApplication pid](self, "pid"));
  -[AXAuditApplication displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v7);

  -[AXAuditApplication bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v8);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  -[AXAuditApplication psnObj](self, "psnObj");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[AXAuditApplication pid](self, "pid");
  -[AXAuditApplication displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[AXAuditApplication bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditApplication *v4;
  AXAuditApplication *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = (AXAuditApplication *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AXAuditApplication psnObj](self, "psnObj");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditApplication psnObj](v5, "psnObj");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[AXAuditApplication pid](v5, "pid");
      if (v8 == -[AXAuditApplication pid](self, "pid")
        && (!(v6 | v7) || objc_msgSend((id)v6, "isEqual:", v7)))
      {
        -[AXAuditApplication displayName](self, "displayName");
        v9 = objc_claimAutoreleasedReturnValue();
        -[AXAuditApplication displayName](v5, "displayName");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v9 | v10 && !objc_msgSend((id)v9, "isEqual:", v10))
        {
          v13 = 0;
        }
        else
        {
          -[AXAuditApplication bundleIdentifier](self, "bundleIdentifier");
          v11 = objc_claimAutoreleasedReturnValue();
          -[AXAuditApplication bundleIdentifier](v5, "bundleIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = !(v11 | v12) || objc_msgSend((id)v11, "isEqual:", v12);

        }
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (AXAuditPSN)psnObj
{
  return self->_psnObj;
}

- (void)setPsnObj:(id)a3
{
  objc_storeStrong((id *)&self->_psnObj, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_psnObj, 0);
}

@end
