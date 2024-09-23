@implementation GEOResultRefinementToggle

- (GEOResultRefinementToggle)initWithDisplayName:(id)a3 isSelected:(BOOL)a4 metadata:(id)a5 toggleType:(unint64_t)a6 evChargingConnectorType:(int)a7 selectionSequenceNumber:(id)a8 selectionFromView:(BOOL)a9 refinementKey:(id)a10 showAsSelected:(BOOL)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  GEOResultRefinementToggle *v20;
  GEOResultRefinementToggle *v21;
  uint64_t v22;
  NSString *displayName;
  objc_super v27;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v18 = a10;
  v19 = objc_msgSend(v15, "length");
  v20 = 0;
  if (v16 && v19)
  {
    v27.receiver = self;
    v27.super_class = (Class)GEOResultRefinementToggle;
    v21 = -[GEOResultRefinementToggle init](&v27, sel_init);
    if (v21)
    {
      v22 = objc_msgSend(v15, "copy");
      displayName = v21->_displayName;
      v21->_displayName = (NSString *)v22;

      v21->_isSelected = a4;
      objc_storeStrong((id *)&v21->_metadata, a5);
      v21->_toggleType = a6;
      v21->_evChargingConnectorType = a7;
      objc_storeStrong((id *)&v21->_selectionSequenceNumber, a8);
      v21->_selectionFromView = a9;
      objc_storeStrong((id *)&v21->_refinementKey, a10);
      v21->_showAsSelected = a11;
    }
    self = v21;
    v20 = self;
  }

  return v20;
}

- (GEOResultRefinementToggle)initWithResultRefinementToggle:(id)a3
{
  id *v4;
  int v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  GEOResultRefinementToggle *v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22;

  v4 = (id *)a3;
  v5 = -[GEOPDResultRefinementToggle toggleType]((uint64_t)v4);
  v6 = -[GEOPDResultRefinementToggle evChargingConnectorType]((uint64_t)v4) - 1;
  if (v6 > 9)
    v21 = 0;
  else
    v21 = dword_189CDF028[v6];
  v22 = v5;
  if (v4)
  {
    if ((*((_WORD *)v4 + 34) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v4 + 14));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    -[GEOPDResultRefinementToggle displayName](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *((_BYTE *)v4 + 64) != 0;
    -[GEOPDResultRefinementToggle metadata](v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *((_BYTE *)v4 + 65) != 0;
  }
  else
  {
    -[GEOPDResultRefinementToggle displayName](0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDResultRefinementToggle metadata](0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v9 = 0;
    v11 = 0;
  }
  -[GEOPDResultRefinementToggle metadata](v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataDefault");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "refinementKey");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v4)
    v16 = *((_BYTE *)v4 + 66) != 0;
  else
    v16 = 0;
  LOBYTE(v20) = v16;
  LOBYTE(v19) = v11;
  v17 = -[GEOResultRefinementToggle initWithDisplayName:isSelected:metadata:toggleType:evChargingConnectorType:selectionSequenceNumber:selectionFromView:refinementKey:showAsSelected:](self, "initWithDisplayName:isSelected:metadata:toggleType:evChargingConnectorType:selectionSequenceNumber:selectionFromView:refinementKey:showAsSelected:", v8, v9, v10, v22 == 1, v21, v7, v19, v14, v20);

  return v17;
}

- (id)convertToGEOPDResultRefinementToggle
{
  GEOPDResultRefinementToggle *v3;
  void *v4;
  BOOL v5;
  void *v6;
  unint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  BOOL v14;

  v3 = objc_alloc_init(GEOPDResultRefinementToggle);
  -[GEOResultRefinementToggle displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementToggle setDisplayName:]((uint64_t)v3, v4);

  v5 = -[GEOResultRefinementToggle isSelected](self, "isSelected");
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 8u;
    v3->_isSelected = v5;
  }
  -[GEOResultRefinementToggle metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinementToggle setMetadata:]((uint64_t)v3, v6);

  v7 = -[GEOResultRefinementToggle toggleType](self, "toggleType");
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 4u;
    v3->_toggleType = v7 == 1;
  }
  v8 = -[GEOResultRefinementToggle evChargingConnectorType](self, "evChargingConnectorType") - 1;
  if (v8 > 8)
    v9 = 0;
  else
    v9 = dword_189CDF050[v8];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 1u;
    v3->_evChargingConnectorType = v9;
  }
  -[GEOResultRefinementToggle selectionSequenceNumber](self, "selectionSequenceNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GEOResultRefinementToggle selectionSequenceNumber](self, "selectionSequenceNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");
    if (v3)
    {
      *(_WORD *)&v3->_flags |= 0x200u;
      *(_WORD *)&v3->_flags |= 2u;
      v3->_selectionSequenceNumber = v12;
    }

  }
  v13 = -[GEOResultRefinementToggle selectionFromView](self, "selectionFromView");
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 0x10u;
    v3->_selectionFromView = v13;
    v14 = -[GEOResultRefinementToggle showAsSelected](self, "showAsSelected");
    *(_WORD *)&v3->_flags |= 0x200u;
    *(_WORD *)&v3->_flags |= 0x20u;
    v3->_showAsSelected = v14;
  }
  else
  {
    -[GEOResultRefinementToggle showAsSelected](self, "showAsSelected");
  }
  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (unint64_t)toggleType
{
  return self->_toggleType;
}

- (int)evChargingConnectorType
{
  return self->_evChargingConnectorType;
}

- (NSNumber)selectionSequenceNumber
{
  return self->_selectionSequenceNumber;
}

- (BOOL)selectionFromView
{
  return self->_selectionFromView;
}

- (NSString)refinementKey
{
  return self->_refinementKey;
}

- (BOOL)showAsSelected
{
  return self->_showAsSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementKey, 0);
  objc_storeStrong((id *)&self->_selectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
