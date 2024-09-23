@implementation AXAuditTextMarkerRange

+ (void)registerTransportableObjectWithManager:(id)a3
{
  id v3;
  AXAuditObjectTransportPropertyEntry *v4;
  AXAuditObjectTransportPropertyEntry *v5;
  AXAuditObjectTransportPropertyEntry *v6;
  AXAuditObjectTransportInfoPropertyBased *v7;

  v3 = a3;
  v7 = -[AXAuditObjectTransportInfoPropertyBased initWithClass:transportKey:]([AXAuditObjectTransportInfoPropertyBased alloc], "initWithClass:transportKey:", objc_opt_class(), CFSTR("AXAuditTextMarkerRange_v1"));
  v4 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v7, "addPropertyEntry:", v4);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v4, "setTransportKey:", CFSTR("StartMarkerValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v4, "setLocalValueToTransportValue:", &__block_literal_global_5);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v4, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_7_0);
  v5 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v7, "addPropertyEntry:", v5);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v5, "setTransportKey:", CFSTR("EndMarkerValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v5, "setLocalValueToTransportValue:", &__block_literal_global_11_1);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v5, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_12_2);
  v6 = objc_alloc_init(AXAuditObjectTransportPropertyEntry);
  -[AXAuditObjectTransportInfoPropertyBased addPropertyEntry:](v7, "addPropertyEntry:", v6);
  -[AXAuditObjectTransportPropertyEntry setTransportKey:](v6, "setTransportKey:", CFSTR("MarkerRangeDescriptionValue_v1"));
  -[AXAuditObjectTransportPropertyEntry setLocalValueToTransportValue:](v6, "setLocalValueToTransportValue:", &__block_literal_global_16_0);
  -[AXAuditObjectTransportPropertyEntry setPopulateLocalObjectWithTransportValue:](v6, "setPopulateLocalObjectWithTransportValue:", &__block_literal_global_17);
  objc_msgSend(v3, "registerTransportInfoPropertyBased:", v7);

}

uint64_t __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startMarker");
}

void __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setStartMarker:", v4);

}

uint64_t __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "endMarker");
}

void __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setEndMarker:", v4);

}

uint64_t __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markerRangeDescription");
}

void __65__AXAuditTextMarkerRange_registerTransportableObjectWithManager___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMarkerRangeDescription:", v4);

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[AXAuditTextMarkerRange endMarker](self, "endMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXAuditTextMarkerRange startMarker](self, "startMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AXAuditTextMarkerRange markerRangeDescription](self, "markerRangeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AXAuditTextMarkerRange *v4;
  AXAuditTextMarkerRange *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v4 = (AXAuditTextMarkerRange *)a3;
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
      -[AXAuditTextMarkerRange startMarker](self, "startMarker");
      v6 = objc_claimAutoreleasedReturnValue();
      -[AXAuditTextMarkerRange startMarker](v5, "startMarker");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
      {
        v12 = 0;
      }
      else
      {
        -[AXAuditTextMarkerRange endMarker](self, "endMarker");
        v8 = objc_claimAutoreleasedReturnValue();
        -[AXAuditTextMarkerRange endMarker](v5, "endMarker");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v8 | v9 && !objc_msgSend((id)v8, "isEqual:", v9))
        {
          v12 = 0;
        }
        else
        {
          -[AXAuditTextMarkerRange markerRangeDescription](self, "markerRangeDescription");
          v10 = objc_claimAutoreleasedReturnValue();
          -[AXAuditTextMarkerRange markerRangeDescription](v5, "markerRangeDescription");
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[AXAuditTextMarkerRange startMarker](self, "startMarker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStartMarker:", v5);

  -[AXAuditTextMarkerRange endMarker](self, "endMarker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndMarker:", v6);

  -[AXAuditTextMarkerRange markerRangeDescription](self, "markerRangeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkerRangeDescription:", v7);

  return v4;
}

- (NSString)markerRangeDescription
{
  return self->_markerRangeDescription;
}

- (void)setMarkerRangeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AXAuditTextMarker)startMarker
{
  return self->_startMarker;
}

- (void)setStartMarker:(id)a3
{
  objc_storeStrong((id *)&self->_startMarker, a3);
}

- (AXAuditTextMarker)endMarker
{
  return self->_endMarker;
}

- (void)setEndMarker:(id)a3
{
  objc_storeStrong((id *)&self->_endMarker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endMarker, 0);
  objc_storeStrong((id *)&self->_startMarker, 0);
  objc_storeStrong((id *)&self->_markerRangeDescription, 0);
}

@end
