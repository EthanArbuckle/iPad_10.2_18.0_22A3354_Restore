@implementation GEOEVChargerPlug

- (GEOEVChargerPlug)initWithPDPlug:(id)a3
{
  id v5;
  GEOEVChargerPlug *v6;
  GEOEVChargerPlug *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOEVChargerPlug;
  v6 = -[GEOEVChargerPlug init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pdPlug, a3);

  return v7;
}

- (int)connectorType
{
  unsigned int v2;

  v2 = -[GEOPDPlug connectorType]((uint64_t)self->_pdPlug) - 1;
  if (v2 > 9)
    return 0;
  else
    return dword_189CE3D20[v2];
}

- (NSString)connectorTypeDisplayText
{
  return -[GEOPDPlug connectorTypeDisplayText]((id *)&self->_pdPlug->super.super.isa);
}

- (NSString)currentTypeDisplayText
{
  return -[GEOPDPlug currentTypeDisplayText]((id *)&self->_pdPlug->super.super.isa);
}

- (unint64_t)powerWatts
{
  GEOPDPlug *pdPlug;

  pdPlug = self->_pdPlug;
  if (pdPlug)
    return pdPlug->_powerWatts;
  else
    return 0;
}

- (unint64_t)totalNumberOfChargers
{
  unsigned int *v2;
  unint64_t v3;

  -[GEOPDPlug availabilityInfo]((id *)&self->_pdPlug->super.super.isa);
  v2 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[6];
  else
    v3 = 0;

  return v3;
}

- (unint64_t)availableNumberOfChargers
{
  unsigned int *v2;
  unint64_t v3;

  -[GEOPDPlug availabilityInfo]((id *)&self->_pdPlug->super.super.isa);
  v2 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[4];
  else
    v3 = 0;

  return v3;
}

- (int)realtimeStatus
{
  uint64_t v2;
  int v4;

  -[GEOPDPlug availabilityInfo]((id *)&self->_pdPlug->super.super.isa);
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2 && (*(_BYTE *)(v2 + 28) & 2) != 0)
  {
    v4 = *(_DWORD *)(v2 + 20);

    if (v4 == 2)
      return 2;
    else
      return v4 == 1;
  }
  else
  {

    return 0;
  }
}

+ (id)plugsFromPDPlugs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOEVChargerPlug *v11;
  GEOEVChargerPlug *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [GEOEVChargerPlug alloc];
        v12 = -[GEOEVChargerPlug initWithPDPlug:](v11, "initWithPDPlug:", v10, (_QWORD)v15);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdPlug, 0);
}

@end
