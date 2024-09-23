@implementation GEOTerritoryRegulatoryInfo

- (NSString)iso3166CountryCode2
{
  return self->_iso3166CountryCode2;
}

- (BOOL)isDisputed
{
  return self->_disputed;
}

- (GEOTerritoryRegulatoryInfo)initWithUnsafeTerritoryData:(id)a3 nameDB:(id)a4 iso3to2Mapping:(id)a5
{
  _QWORD *v8;
  id v9;
  GEOTerritoryRegulatoryInfo *v10;
  GEOTerritoryRegulatoryInfo *v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *interestedPartyIso3166CountryCodes3;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *interestedPartyIso3166CountryCodes2;
  GEOTerritoryRegulatoryInfo *v25;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[4];
  GEOTerritoryRegulatoryInfo *v41;
  id v42;
  objc_super v43;

  v8 = a3;
  v28 = a4;
  v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)GEOTerritoryRegulatoryInfo;
  v10 = -[GEOTerritoryRegulatoryInfo init](&v43, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_21;
  if (v8)
  {
    v10->_uniqueIdentifier = v8[8];
    v10->_coastalWaters = 0;
    v10->_disputed = 0;
    -[GEOTerritoryDataTerritoryInfo _readTerritoryTypes]((uint64_t)v8);
    if (v8[6])
    {
      v12 = 0;
      do
      {
        v13 = -[GEOTerritoryDataTerritoryInfo territoryTypeAtIndex:]((uint64_t)v8, v12);
        if (v13 == 3)
        {
          v11->_coastalWaters = 1;
        }
        else if (v13 == 2)
        {
          v11->_disputed = 1;
        }
        ++v12;
        -[GEOTerritoryDataTerritoryInfo _readTerritoryTypes]((uint64_t)v8);
      }
      while (v12 < v8[6]);
    }
    if ((v8[14] & 2) != 0)
    {
      v14 = *((unsigned int *)v8 + 27);
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke;
      v40[3] = &unk_1E1C004A8;
      v41 = v11;
      v42 = v9;
      LODWORD(v14) = objc_msgSend(v28, "unsafeDataForQuadKey:result:", v14, v40);

      if (!(_DWORD)v14)
        goto LABEL_21;
    }
    if (v11->_disputed)
    {
      v27 = v9;
      v15 = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__1;
      v38 = __Block_byref_object_dispose__1;
      v39 = 0;
      v16 = MEMORY[0x1E0C809B0];
      while (1)
      {
        -[GEOTerritoryDataTerritoryInfo _readInterestedPartys]((uint64_t)v8);
        if (v15 >= v8[3])
          break;
        v17 = -[GEOTerritoryDataTerritoryInfo interestedPartyAtIndex:]((uint64_t)v8, v15);
        v31[0] = v16;
        v31[1] = 3221225472;
        v18 = v17;
        v31[2] = __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_1;
        v31[3] = &unk_1E1C004D0;
        v33 = &v34;
        v32 = v8;
        objc_msgSend(v28, "unsafeDataForQuadKey:result:", v18, v31);

        ++v15;
      }
      objc_msgSend((id)v35[5], "sortedArrayUsingSelector:", sel_compare_);
      v19 = objc_claimAutoreleasedReturnValue();
      interestedPartyIso3166CountryCodes3 = v11->_interestedPartyIso3166CountryCodes3;
      v11->_interestedPartyIso3166CountryCodes3 = (NSArray *)v19;

      v21 = (void *)v35[5];
      v29[0] = v16;
      v29[1] = 3221225472;
      v29[2] = __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_2;
      v29[3] = &unk_1E1C004F8;
      v30 = v27;
      objc_msgSend(v21, "_geo_compactMap:", v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      interestedPartyIso3166CountryCodes2 = v11->_interestedPartyIso3166CountryCodes2;
      v11->_interestedPartyIso3166CountryCodes2 = (NSArray *)v23;

      _Block_object_dispose(&v34, 8);
      v9 = v27;
    }
  }
  else
  {
    v10->_uniqueIdentifier = 0;
    v10->_coastalWaters = 0;
    v10->_disputed = 0;
  }
  if (!-[NSString length](v11->_iso3166CountryCode3, "length", v27)
    && !-[NSString length](v11->_disputedTerritoryName, "length")
    && !-[NSArray count](v11->_interestedPartyIso3166CountryCodes3, "count"))
  {
LABEL_21:
    v25 = 0;
    goto LABEL_22;
  }
  v25 = v11;
LABEL_22:

  return v25;
}

BOOL __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = objc_msgSend(v5, "copy");
    v9 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
    }
    else
    {
      v11 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = v8;

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "copy");
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 32);
      *(_QWORD *)(v13 + 32) = v12;

    }
  }

  return v6 != 0;
}

- (int64_t)isCoastalWaters
{
  return self->_coastalWaters;
}

- (unint64_t)hash
{
  unint64_t result;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  result = self->_uniqueIdentifier;
  if (!result)
  {
    v4 = (self->_coastalWaters << 10) | ((unint64_t)self->_disputed << 8);
    v5 = v4 ^ -[NSString hash](self->_iso3166CountryCode3, "hash");
    v6 = (-[NSString hash](self->_disputedTerritoryName, "hash") << 8) ^ (v5 << 16);
    return v6 ^ -[NSArray hash](self->_interestedPartyIso3166CountryCodes3, "hash");
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedPartyIso3166CountryCodes2, 0);
  objc_storeStrong((id *)&self->_interestedPartyIso3166CountryCodes3, 0);
  objc_storeStrong((id *)&self->_disputedTerritoryName, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode2, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode3, 0);
}

uint64_t __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_1(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  if (objc_msgSend(v5, "length"))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0C99DE8];
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        -[GEOTerritoryDataTerritoryInfo _readInterestedPartys](*(_QWORD *)(a1 + 32));
        v9 = *(_QWORD *)(v8 + 24);
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v7, "arrayWithCapacity:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v5);
  }

  return 1;
}

id __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)iso3166CountryCode
{
  return self->_iso3166CountryCode3;
}

- (NSArray)interestedPartyIso3166CountryCodes
{
  return self->_interestedPartyIso3166CountryCodes3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[GEOTerritoryRegulatoryInfo isEqualToGEOTerritoryRegulatoryInfo:](self, "isEqualToGEOTerritoryRegulatoryInfo:", v4);

  return v5;
}

- (BOOL)isEqualToGEOTerritoryRegulatoryInfo:(id)a3
{
  _QWORD *v4;
  id v5;
  unint64_t uniqueIdentifier;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  NSUInteger v10;
  NSArray *interestedPartyIso3166CountryCodes3;
  uint8_t v13[16];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: other != ((void *)0)", v13, 2u);
    }
    goto LABEL_21;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  v7 = v4[2];
  if (!uniqueIdentifier)
  {
    if (!v7 && self->_disputed == *((unsigned __int8 *)v4 + 8) && self->_coastalWaters == v4[8])
    {
      if (-[NSString isEqual:](self->_iso3166CountryCode3, "isEqual:", v4[3]))
      {
        v10 = -[NSArray count](self->_interestedPartyIso3166CountryCodes3, "count");
        if (v10 == objc_msgSend(*((id *)v5 + 6), "count"))
        {
          interestedPartyIso3166CountryCodes3 = self->_interestedPartyIso3166CountryCodes3;
          if ((!interestedPartyIso3166CountryCodes3
             || -[NSArray isEqual:](interestedPartyIso3166CountryCodes3, "isEqual:", *((_QWORD *)v5 + 6)))
            && (!self->_disputed
             || -[NSString isEqual:](self->_disputedTerritoryName, "isEqual:", *((_QWORD *)v5 + 5))))
          {
            v9 = 1;
            goto LABEL_22;
          }
        }
      }
    }
LABEL_21:
    v9 = 0;
    goto LABEL_22;
  }
  if (v7)
    v8 = uniqueIdentifier == v7;
  else
    v8 = 0;
  v9 = v8;
LABEL_22:

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSString **p_disputedTerritoryName;
  const __CFString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(" %p id: %#llx"), self, self->_uniqueIdentifier);
  objc_msgSend(v3, "appendString:", CFSTR(" cc/name: \"));
  v6 = 40;
  if (!self->_disputed)
    v6 = 24;
  objc_msgSend(v3, "appendString:", *(Class *)((char *)&self->super.isa + v6));
  if (self->_disputed)
  {
    p_disputedTerritoryName = &self->_disputedTerritoryName;
    objc_msgSend(v3, "appendString:", CFSTR(" name: \"));
  }
  else
  {
    objc_msgSend(v3, "appendString:", CFSTR(" cc3/2: \"));
    objc_msgSend(v3, "appendString:", self->_iso3166CountryCode3);
    objc_msgSend(v3, "appendString:", CFSTR("\" / \"));
    p_disputedTerritoryName = &self->_iso3166CountryCode2;
  }
  objc_msgSend(v3, "appendString:", *p_disputedTerritoryName);
  objc_msgSend(v3, "appendString:", CFSTR("\" is_disputed: "));
  if (self->_disputed)
    v8 = CFSTR("yes");
  else
    v8 = CFSTR("no");
  objc_msgSend(v3, "appendString:", v8);
  if (self->_disputed)
  {
    objc_msgSend(v3, "appendString:", CFSTR(" by: ["));
    if (-[NSArray count](self->_interestedPartyIso3166CountryCodes3, "count"))
    {
      -[NSArray componentsJoinedByString:](self->_interestedPartyIso3166CountryCodes3, "componentsJoinedByString:", CFSTR(", "));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v9);

    }
    objc_msgSend(v3, "appendString:", CFSTR("]"));
    objc_msgSend(v3, "appendString:", CFSTR(" / ["));
    if (-[NSArray count](self->_interestedPartyIso3166CountryCodes2, "count"))
    {
      -[NSArray componentsJoinedByString:](self->_interestedPartyIso3166CountryCodes2, "componentsJoinedByString:", CFSTR(", "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v10);

    }
    objc_msgSend(v3, "appendString:", CFSTR("]"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(" is_coastal_waters: "));
  v11 = self->_coastalWaters + 1;
  if (v11 > 2)
    v12 = CFSTR("invalid");
  else
    v12 = off_1E1C00518[v11];
  objc_msgSend(v3, "appendString:", v12);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)iso3166CountryCode3
{
  return self->_iso3166CountryCode3;
}

- (NSString)disputedTerritoryName
{
  return self->_disputedTerritoryName;
}

- (NSArray)interestedPartyIso3166CountryCodes3
{
  return self->_interestedPartyIso3166CountryCodes3;
}

- (NSArray)interestedPartyIso3166CountryCodes2
{
  return self->_interestedPartyIso3166CountryCodes2;
}

@end
