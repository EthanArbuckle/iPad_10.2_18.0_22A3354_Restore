@implementation GEOFlyoverRegionVersions

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    self->_regionsSpace = 0;
    self->_regionsCount = 0;
    free(self->_regions);
    self->_regions = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOFlyoverRegionVersions;
  -[GEOFlyoverRegionVersions dealloc](&v3, sel_dealloc);
}

- (uint64_t)_reserveRegions:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 16);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 24);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (16 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 16 * v9, 0x6110FBE8uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 8) = result;
      bzero((void *)(result + 16 * *(_QWORD *)(a1 + 16)), 16 * (v9 - *(_QWORD *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (uint64_t)addRegion:(uint64_t)a3
{
  uint64_t v5;
  _QWORD *v6;

  if (result)
  {
    v5 = result;
    result = -[GEOFlyoverRegionVersions _reserveRegions:](result, 1uLL);
    if ((_DWORD)result)
    {
      v6 = (_QWORD *)(*(_QWORD *)(v5 + 8) + 16 * *(_QWORD *)(v5 + 16));
      *v6 = a2;
      v6[1] = a3;
      ++*(_QWORD *)(v5 + 16);
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOFlyoverRegionVersions;
  -[GEOFlyoverRegionVersions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOFlyoverRegionVersions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFlyoverRegionVersions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  const __CFString *v21;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = 0x1EDF0A000uLL;
    if (*(_QWORD *)(a1 + 16))
    {
      v20 = (void *)v4;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 16));
      if (*(_QWORD *)(a1 + 16))
      {
        v8 = 0;
        v9 = 0;
        v10 = CFSTR("data_version");
        if (a2)
          v10 = CFSTR("dataVersion");
        v21 = v10;
        do
        {
          v11 = v6;
          v12 = *(_QWORD *)(a1 + 8);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v12 + v8;
          v15 = *(_BYTE *)(v12 + v8 + 12);
          if ((v15 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v12 + v8));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKey:", v17, v21);

            v15 = *(_BYTE *)(v14 + 12);
            if ((v15 & 2) != 0)
            {
LABEL_14:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v12 + v8 + 4));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("region"));

              if ((*(_BYTE *)(v14 + 12) & 4) == 0)
                goto LABEL_11;
LABEL_10:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v12 + v8 + 8));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("version"));

              goto LABEL_11;
            }
          }
          else if ((*(_BYTE *)(v12 + v8 + 12) & 2) != 0)
          {
            goto LABEL_14;
          }
          if ((v15 & 4) != 0)
            goto LABEL_10;
LABEL_11:
          objc_msgSend(v7, "addObject:", v13);

          ++v9;
          v6 = v11;
          v8 += 16;
        }
        while (v9 < *(_QWORD *)(a1 + *(int *)(v11 + 2108)));
      }
      v5 = v20;
      objc_msgSend(v20, "setObject:forKey:", v7, CFSTR("region"), v20);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOFlyoverRegionVersions _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  char *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  GEOFlyoverRegion *v18;
  $162FAC071EAEBA15A6F8D573D0754DF6 *p_var3;
  char v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  int v26;
  unint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  BOOL v35;
  GEOFlyoverRegion *p_var2;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  BOOL v47;

  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E0D82BF0];
    v6 = (int *)MEMORY[0x1E0D82BD8];
    v7 = (int *)MEMORY[0x1E0D82BC8];
    if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
    {
      v8 = (int *)MEMORY[0x1E0D82BB8];
      do
      {
        if (v4[*v7])
          break;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = *v5;
          v13 = *(_QWORD *)&v4[v12];
          if (v13 == -1 || v13 >= *(_QWORD *)&v4[*v6])
            break;
          v14 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
          *(_QWORD *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0)
            goto LABEL_13;
          v9 += 7;
          v15 = v10++ >= 9;
          if (v15)
          {
            v11 = 0;
            v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        v16 = v4[*v7];
        if (v4[*v7])
          v11 = 0;
LABEL_15:
        if (v16 || (v11 & 7) == 4)
          break;
        if ((v11 >> 3) == 1)
        {
          if (!PBReaderPlaceMark())
            goto LABEL_82;
          -[GEOFlyoverRegionVersions _reserveRegions:]((uint64_t)self, 1uLL);
          if (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6])
          {
            v18 = &self->_regions[self->_regionsCount];
            p_var3 = &v18->var3;
            do
            {
              if (v4[*v7])
                break;
              v20 = 0;
              v21 = 0;
              v22 = 0;
              while (1)
              {
                v23 = *v5;
                v24 = *(_QWORD *)&v4[v23];
                if (v24 == -1 || v24 >= *(_QWORD *)&v4[*v6])
                  break;
                v25 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v24);
                *(_QWORD *)&v4[v23] = v24 + 1;
                v22 |= (unint64_t)(v25 & 0x7F) << v20;
                if ((v25 & 0x80) == 0)
                  goto LABEL_32;
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  v22 = 0;
                  v26 = v4[*v7];
                  goto LABEL_34;
                }
              }
              v4[*v7] = 1;
LABEL_32:
              v26 = v4[*v7];
              if (v4[*v7])
                v22 = 0;
LABEL_34:
              if (v26 || (v22 & 7) == 4)
                break;
              v28 = v22 >> 3;
              if ((v22 >> 3) == 3)
              {
                v37 = 0;
                v38 = 0;
                v31 = 0;
                *(_BYTE *)p_var3 |= 1u;
                while (1)
                {
                  v39 = *v5;
                  v40 = *(_QWORD *)&v4[v39];
                  if (v40 == -1 || v40 >= *(_QWORD *)&v4[*v6])
                    break;
                  v41 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v40);
                  *(_QWORD *)&v4[v39] = v40 + 1;
                  v31 |= (unint64_t)(v41 & 0x7F) << v37;
                  if ((v41 & 0x80) == 0)
                  {
                    p_var2 = v18;
                    goto LABEL_68;
                  }
                  v37 += 7;
                  v35 = v38++ > 8;
                  if (v35)
                  {
                    LODWORD(v31) = 0;
                    p_var2 = v18;
                    goto LABEL_70;
                  }
                }
                p_var2 = v18;
LABEL_67:
                v4[*v7] = 1;
              }
              else if ((_DWORD)v28 == 2)
              {
                v42 = 0;
                v43 = 0;
                v31 = 0;
                *(_BYTE *)p_var3 |= 4u;
                while (1)
                {
                  v44 = *v5;
                  v45 = *(_QWORD *)&v4[v44];
                  if (v45 == -1 || v45 >= *(_QWORD *)&v4[*v6])
                  {
                    p_var2 = (GEOFlyoverRegion *)&v18->var2;
                    goto LABEL_67;
                  }
                  v46 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v45);
                  *(_QWORD *)&v4[v44] = v45 + 1;
                  v31 |= (unint64_t)(v46 & 0x7F) << v42;
                  if ((v46 & 0x80) == 0)
                    break;
                  v42 += 7;
                  v35 = v43++ > 8;
                  if (v35)
                  {
                    LODWORD(v31) = 0;
                    p_var2 = (GEOFlyoverRegion *)&v18->var2;
                    goto LABEL_70;
                  }
                }
                p_var2 = (GEOFlyoverRegion *)&v18->var2;
              }
              else
              {
                if ((_DWORD)v28 != 1)
                {
                  if ((PBReaderSkipValueWithTag() & 1) == 0)
                    goto LABEL_82;
                  continue;
                }
                v29 = 0;
                v30 = 0;
                v31 = 0;
                *(_BYTE *)p_var3 |= 2u;
                while (1)
                {
                  v32 = *v5;
                  v33 = *(_QWORD *)&v4[v32];
                  if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v6])
                  {
                    p_var2 = (GEOFlyoverRegion *)&v18->var1;
                    goto LABEL_67;
                  }
                  v34 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v33);
                  *(_QWORD *)&v4[v32] = v33 + 1;
                  v31 |= (unint64_t)(v34 & 0x7F) << v29;
                  if ((v34 & 0x80) == 0)
                    break;
                  v29 += 7;
                  v35 = v30++ > 8;
                  if (v35)
                  {
                    LODWORD(v31) = 0;
                    p_var2 = (GEOFlyoverRegion *)&v18->var1;
                    goto LABEL_70;
                  }
                }
                p_var2 = (GEOFlyoverRegion *)&v18->var1;
              }
LABEL_68:
              if (v4[*v7])
                LODWORD(v31) = 0;
LABEL_70:
              p_var2->var0 = v31;
            }
            while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
          }
          if (v4[*v7])
            goto LABEL_82;
          PBReaderRecallMark();
          ++self->_regionsCount;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_82;
        }
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v47 = v4[*v7] == 0;
  }
  else
  {
LABEL_82:
    v47 = 0;
  }
  objc_sync_exit(v4);

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t i;
  GEOFlyoverRegion *v7;
  char var3;

  v4 = a3;
  if (self->_regionsCount)
  {
    v5 = 0;
    for (i = 0; i < self->_regionsCount; ++i)
    {
      PBDataWriterPlaceMark();
      v7 = &self->_regions[v5];
      var3 = (char)v7->var3;
      if ((var3 & 2) != 0)
      {
        PBDataWriterWriteUint32Field();
        var3 = (char)v7->var3;
        if ((var3 & 4) != 0)
        {
LABEL_10:
          PBDataWriterWriteUint32Field();
          if ((*(_BYTE *)&v7->var3 & 1) == 0)
            goto LABEL_7;
LABEL_6:
          PBDataWriterWriteUint32Field();
          goto LABEL_7;
        }
      }
      else if ((*(_BYTE *)&v7->var3 & 4) != 0)
      {
        goto LABEL_10;
      }
      if ((var3 & 1) != 0)
        goto LABEL_6;
LABEL_7:
      PBDataWriterRecallMark();
      ++v5;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t regionsCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    -[GEOFlyoverRegionVersions _reserveRegions:](v4, regionsCount);
    memcpy(*(void **)(v5 + 8), self->_regions, 16 * self->_regionsCount);
    *(_QWORD *)(v5 + 16) = self->_regionsCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t regionsCount;
  BOOL v6;

  v4 = (const void **)a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (regionsCount = self->_regionsCount, (const void *)regionsCount == v4[2])
    && memcmp(self->_regions, v4[1], 16 * regionsCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  return PBHashBytes();
}

@end
