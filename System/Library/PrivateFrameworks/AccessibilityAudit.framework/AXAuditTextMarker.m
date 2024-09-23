@implementation AXAuditTextMarker

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportInfoPropertyBased *v6;

  v3 = a3;
  v6 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditTextMarker_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("PlatformMarkerValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_22);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_9_3);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v4);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v6);

  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v6, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("MarkerDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_13_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_15_2);

}

id __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "platformMarker");
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

void __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend(v5, "setPlatformMarker:", v4);

}

uint64_t __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markerDescription");
}

void __60__AXAuditTextMarker_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMarkerDescription:", v4);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AXAuditTextMarker platformMarker](self, "platformMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditTextMarker markerDescription](self, "markerDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditTextMarker *v4;
  AXAuditTextMarker *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = (AXAuditTextMarker *)a3;
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
      -[AXAuditTextMarker platformMarker](self, "platformMarker");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditTextMarker platformMarker](v5, "platformMarker");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
      {
        v10 = 0;
      }
      else
      {
        -[AXAuditTextMarker markerDescription](self, "markerDescription");
        v8 = objc_claimAutoreleasedReturnValue();
        -[AXAuditTextMarker markerDescription](v5, "markerDescription");
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
  -[AXAuditTextMarker platformMarker](self, "platformMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlatformMarker:", v5);

  -[AXAuditTextMarker markerDescription](self, "markerDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkerDescription:", v6);

  return v4;
}

- (id)platformMarker
{
  return self->_platformMarker;
}

- (void)setPlatformMarker:(id)a3
{
  objc_storeStrong(&self->_platformMarker, a3);
}

- (NSString)markerDescription
{
  return self->_markerDescription;
}

- (void)setMarkerDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerDescription, 0);
  objc_storeStrong(&self->_platformMarker, 0);
}

@end
