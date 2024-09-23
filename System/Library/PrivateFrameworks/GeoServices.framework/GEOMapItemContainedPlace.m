@implementation GEOMapItemContainedPlace

- (GEOMapItemContainedPlace)init
{
  GEOMapItemContainedPlace *result;

  result = (GEOMapItemContainedPlace *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapItemContainedPlace)initWithContainedPlace:(id)a3
{
  id v5;
  GEOMapItemContainedPlace *v6;
  GEOMapItemContainedPlace *v7;
  uint64_t *p_containedPlace;
  GEOPDContainedPlace *containedPlace;
  GEOMapItemContainedPlaceLinkedPlace *v10;
  void *v11;
  uint64_t v12;
  GEOMapItem *parent;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GEOMapItemContainedPlaceLinkedPlace *v21;
  uint64_t v22;
  NSArray *children;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  GEOMapItemContainedPlaceLinkedPlace *v32;
  GEOMapItemContainedPlaceLinkedPlace *v33;
  uint64_t v34;
  NSArray *siblings;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)GEOMapItemContainedPlace;
  v6 = -[GEOMapItemContainedPlace init](&v45, sel_init);
  v7 = v6;
  if (v6)
  {
    p_containedPlace = (uint64_t *)&v6->_containedPlace;
    objc_storeStrong((id *)&v6->_containedPlace, a3);
    containedPlace = v7->_containedPlace;
    if (containedPlace)
    {
      -[GEOPDContainedPlace _readParentPlace]((uint64_t)v7->_containedPlace);
      if (containedPlace->_parentPlace)
      {
        v10 = [GEOMapItemContainedPlaceLinkedPlace alloc];
        -[GEOPDContainedPlace parentPlace]((id *)&v7->_containedPlace->super.super.isa);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[GEOMapItemContainedPlaceLinkedPlace initWithLinkedPlace:](v10, "initWithLinkedPlace:", v11);
        parent = v7->_parent;
        v7->_parent = (GEOMapItem *)v12;

      }
      v14 = *p_containedPlace;
      if (*p_containedPlace)
      {
        -[GEOPDContainedPlace _readChildPlaces](*p_containedPlace);
        if (objc_msgSend(*(id *)(v14 + 24), "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          -[GEOPDContainedPlace childPlaces]((id *)*p_containedPlace);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v42;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v42 != v19)
                  objc_enumerationMutation(v16);
                v21 = -[GEOMapItemContainedPlaceLinkedPlace initWithLinkedPlace:]([GEOMapItemContainedPlaceLinkedPlace alloc], "initWithLinkedPlace:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v20));
                objc_msgSend(v15, "addObject:", v21);

                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
            }
            while (v18);
          }

          v22 = objc_msgSend(v15, "copy");
          children = v7->_children;
          v7->_children = (NSArray *)v22;

        }
        v24 = *p_containedPlace;
        if (*p_containedPlace)
        {
          -[GEOPDContainedPlace _readSiblingPlaces](*p_containedPlace);
          if (objc_msgSend(*(id *)(v24 + 48), "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            -[GEOPDContainedPlace siblingPlaces]((id *)*p_containedPlace);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v38;
              do
              {
                v30 = 0;
                do
                {
                  if (*(_QWORD *)v38 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v30);
                  v32 = [GEOMapItemContainedPlaceLinkedPlace alloc];
                  v33 = -[GEOMapItemContainedPlaceLinkedPlace initWithLinkedPlace:](v32, "initWithLinkedPlace:", v31, (_QWORD)v37);
                  objc_msgSend(v25, "addObject:", v33);

                  ++v30;
                }
                while (v28 != v30);
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
              }
              while (v28);
            }

            v34 = objc_msgSend(v25, "copy");
            siblings = v7->_siblings;
            v7->_siblings = (NSArray *)v34;

          }
        }
      }
    }
  }

  return v7;
}

- (unint64_t)featureId
{
  GEOPDContainedPlace *containedPlace;

  containedPlace = self->_containedPlace;
  if (containedPlace)
    return containedPlace->_featureId;
  else
    return 0;
}

- (unint64_t)parentFeatureId
{
  _QWORD *v2;
  unint64_t v3;

  -[GEOPDContainedPlace parentPlace]((id *)&self->_containedPlace->super.super.isa);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[4];
  else
    v3 = 0;

  return v3;
}

- (GEOMapItem)parent
{
  return self->_parent;
}

- (NSArray)children
{
  return self->_children;
}

- (NSArray)siblings
{
  return self->_siblings;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p %@>\n%@"), self, v5, self->_containedPlace);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siblings, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_containedPlace, 0);
}

@end
