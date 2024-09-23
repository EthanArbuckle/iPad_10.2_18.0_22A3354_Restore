@implementation GEOEVChargerAvailability

- (GEOEVChargerAvailability)initWithPlaceData:(id)a3
{
  id v4;
  GEOEVChargerAvailability *v5;
  uint64_t v6;
  GEOPDEVCharger *charger;
  unsigned int *v8;
  unint64_t v9;
  unsigned int *v10;
  unint64_t v11;
  GEOPDEVCharger *v12;
  GEOEVChargerAvailability *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOEVChargerAvailability;
  v5 = -[GEOEVChargerAvailability init](&v15, sel_init);
  if (!v5)
    goto LABEL_10;
  +[GEOPDEVCharger evChargerFromPlaceData:](GEOPDEVCharger, "evChargerFromPlaceData:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  charger = v5->_charger;
  v5->_charger = (GEOPDEVCharger *)v6;

  -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&v5->_charger->super.super.isa);
  v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  v9 = v8 ? v8[6] : 0;
  v5->_totalEVChargers = v9;

  -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&v5->_charger->super.super.isa);
  v10 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  v11 = v10 ? v10[4] : 0;
  v5->_availableEVChargers = v11;

  v12 = v5->_charger;
  if (v12)
    v12 = (GEOPDEVCharger *)v12->_ttlSeconds;
  v5->_ttlSeconds = (unint64_t)v12;
  v5->_aggregatedAvailable = -1;
  v5->_aggregatedTotal = -1;
  if (v5->_totalEVChargers || v5->_availableEVChargers)
LABEL_10:
    v13 = v5;
  else
    v13 = 0;

  return v13;
}

- (int64_t)aggregatedAvailableCount:(id)a3
{
  id v4;
  int64_t aggregatedAvailable;
  uint64_t v6;
  int v7;
  unsigned int *v8;
  int64_t v9;

  v4 = a3;
  aggregatedAvailable = self->_aggregatedAvailable;
  if (aggregatedAvailable == -1)
  {
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6 && (*(_BYTE *)(v6 + 28) & 2) != 0)
    {
      v7 = *(_DWORD *)(v6 + 20);

      if (v7)
      {
        -[GEOEVChargerAvailability _filterAggregatedChargers:](self, "_filterAggregatedChargers:", v4);
LABEL_10:
        aggregatedAvailable = self->_aggregatedAvailable;
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8[4];
    else
      v9 = 0;
    self->_aggregatedAvailable = v9;

    goto LABEL_10;
  }
LABEL_11:

  return aggregatedAvailable;
}

- (int64_t)aggregatedTotalCount:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  unsigned int *v7;
  int64_t v8;
  int64_t aggregatedTotal;

  v4 = a3;
  if (self->_aggregatedTotal == -1 || !-[NSArray isEqualToArray:](self->_supportedTypes, "isEqualToArray:", v4))
  {
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5 && (*(_BYTE *)(v5 + 28) & 2) != 0)
    {
      v6 = *(_DWORD *)(v5 + 20);

      if (v6)
      {
        -[GEOEVChargerAvailability _filterAggregatedChargers:](self, "_filterAggregatedChargers:", v4);
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    v7 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7[6];
    else
      v8 = 0;
    self->_aggregatedTotal = v8;

  }
LABEL_11:
  aggregatedTotal = self->_aggregatedTotal;

  return aggregatedTotal;
}

- (int)_availabilityStatus
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (*(_BYTE *)(v3 + 28) & 2) != 0)
    v4 = *(unsigned int *)(v3 + 20);
  else
    v4 = 0;

  return -[GEOEVChargerAvailability _realTimePlugStatus:](self, "_realTimePlugStatus:", v4);
}

- (int)_realTimePlugAvailabilityStatus
{
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;

  if (self->_aggregatedTotal != -1 && self->_aggregatedAvailable != -1)
  {
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3 && (*(_BYTE *)(v3 + 28) & 2) != 0)
    {
      v4 = *(_DWORD *)(v3 + 20);

      if (v4)
      {
        if (self->_aggregatedAvailable)
          return 1;
        else
          return 2;
      }
    }
    else
    {

    }
  }
  -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6 && (*(_BYTE *)(v6 + 28) & 2) != 0)
    v7 = *(unsigned int *)(v6 + 20);
  else
    v7 = 0;

  return -[GEOEVChargerAvailability _realTimePlugStatus:](self, "_realTimePlugStatus:", v7);
}

- (void)_filterAggregatedChargers:(id)a3
{
  id v5;
  id v6;
  uint64_t i;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  id *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  void *v18;
  id *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  GEOEVChargerAvailability *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = self;
  objc_storeStrong((id *)&self->_supportedTypes, a3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "integerValue");
        if (v8)
        {
          v33 = i;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          -[GEOPDEVCharger plugs]((id *)&v30->_charger->super.super.isa);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v36 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(id **)(*((_QWORD *)&v35 + 1) + 8 * j);
                if (-[GEOPDPlug connectorType]((uint64_t)v14) == v8)
                {
                  -[GEOPDPlug chargerInfo](v14);
                  v15 = objc_claimAutoreleasedReturnValue();
                  if (v15)
                  {
                    v16 = (void *)v15;
                    -[GEOPDPlug chargerInfo](v14);
                    v17 = (id *)objc_claimAutoreleasedReturnValue();
                    -[GEOPDChargerInfo totalChargerIds](v17);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v18)
                    {
                      -[GEOPDPlug chargerInfo](v14);
                      v19 = (id *)objc_claimAutoreleasedReturnValue();
                      -[GEOPDChargerInfo totalChargerIds](v19);
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "addObjectsFromArray:", v20);

                    }
                  }
                  -[GEOPDPlug chargerInfo](v14);
                  v21 = objc_claimAutoreleasedReturnValue();
                  if (v21)
                  {
                    v22 = (void *)v21;
                    -[GEOPDPlug chargerInfo](v14);
                    v23 = (id *)objc_claimAutoreleasedReturnValue();
                    -[GEOPDChargerInfo availableChargerIds](v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24)
                    {
                      -[GEOPDPlug chargerInfo](v14);
                      v25 = (id *)objc_claimAutoreleasedReturnValue();
                      -[GEOPDChargerInfo availableChargerIds](v25);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "addObjectsFromArray:", v26);

                    }
                  }
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v11);
          }

          i = v33;
        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v32);
  }

  objc_msgSend(v6, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30->_aggregatedTotal = objc_msgSend(v27, "count");

  objc_msgSend(v34, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30->_aggregatedAvailable = objc_msgSend(v28, "count");

}

- (int)_realTimePlugStatus:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (unint64_t)totalEVChargers
{
  return self->_totalEVChargers;
}

- (void)setTotalEVChargers:(unint64_t)a3
{
  self->_totalEVChargers = a3;
}

- (unint64_t)availableEVChargers
{
  return self->_availableEVChargers;
}

- (void)setAvailableEVChargers:(unint64_t)a3
{
  self->_availableEVChargers = a3;
}

- (unint64_t)ttlSeconds
{
  return self->_ttlSeconds;
}

- (void)setTtlSeconds:(unint64_t)a3
{
  self->_ttlSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_storeStrong((id *)&self->_charger, 0);
}

@end
