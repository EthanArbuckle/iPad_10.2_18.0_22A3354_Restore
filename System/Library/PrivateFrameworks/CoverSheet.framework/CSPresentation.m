@implementation CSPresentation

+ (id)presentation
{
  return objc_alloc_init((Class)a1);
}

+ (CSPresentation)presentationWithCoordinateSpace:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[CSPresentation presentation](CSPresentation, "presentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCoordinateSpace:", v3);

  return (CSPresentation *)v4;
}

+ (id)presentationForProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "presentationCoordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "presentationWithCoordinateSpace:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unionPresentation:", v4);
  objc_msgSend(v4, "coverSheetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", v7);
  return v6;
}

- (CSPresentation)init
{
  CSPresentation *v2;
  uint64_t v3;
  NSMutableArray *regions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSPresentation;
  v2 = -[CSPresentation init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    regions = v2->_regions;
    v2->_regions = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[CSPresentation coordinateSpace](self, "coordinateSpace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "regionForCoordinateSpace:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (v7)
    {
      -[NSMutableArray addObject:](self->_regions, "addObject:", v7);
      v6 = v7;
    }

  }
}

- (void)addRegions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CSPresentation addRegion:](self, "addRegion:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)unionPresentation:(id)a3
{
  id v4;

  objc_msgSend(a3, "presentationRegions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPresentation addRegions:](self, "addRegions:", v4);

}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_regions, "removeAllObjects");
}

- (id)presentationForRole:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  -[CSPresentation coordinateSpace](self, "coordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSPresentation presentationWithCoordinateSpace:](CSPresentation, "presentationWithCoordinateSpace:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSPresentation identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIdentifier:", v7);

  if (a3)
  {
    -[CSPresentation regions](self, "regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__CSPresentation_presentationForRole___block_invoke;
    v11[3] = &__block_descriptor_40_e18_B16__0__CSRegion_8l;
    v11[4] = a3;
    objc_msgSend(v8, "bs_filter:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addRegions:", v9);

  }
  return v6;
}

BOOL __38__CSPresentation_presentationForRole___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "role") == *(_QWORD *)(a1 + 32);
}

- (BOOL)intersectsCoordinateSpace:(id)a3
{
  void *v3;
  BOOL v4;

  -[CSPresentation firstRegionIntersectingCoordinateSpace:](self, "firstRegionIntersectingCoordinateSpace:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)firstRegionIntersectingCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CSPresentation regions](self, "regions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "isHidden") & 1) == 0 && (objc_msgSend(v9, "intersectsCoordinateSpace:", v4) & 1) != 0)
          {
            v6 = v9;
            goto LABEL_14;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)firstRegionIntersectingCoordinateSpace:(id)a3 excludingRegionsWithRole:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CSPresentation regions](self, "regions", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isHidden") & 1) == 0
            && objc_msgSend(v12, "role") != a4
            && (objc_msgSend(v12, "intersectsCoordinateSpace:", v6) & 1) != 0)
          {
            v13 = v12;
            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_15:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)regionsIntersectingCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CSPresentation regions](self, "regions", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isHidden") & 1) == 0
            && objc_msgSend(v11, "intersectsCoordinateSpace:", v4))
          {
            v12 = (void *)objc_msgSend(v11, "copy");
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)suggestedInsetsForPreferredContentFrame:(CGRect)a3
{
  unsigned int (**v4)(_QWORD, double, double, double, double);
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t j;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double MaxY;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  CGRect v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  UIEdgeInsets result;
  CGRect v73;
  CGRect v74;

  v61 = *MEMORY[0x1E0C80C00];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __58__CSPresentation_suggestedInsetsForPreferredContentFrame___block_invoke;
  v57[3] = &__block_descriptor_64_e39_B40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  v58 = a3;
  v4 = (unsigned int (**)(_QWORD, double, double, double, double))MEMORY[0x1D17E1614](v57, a2);
  -[CSPresentation presentationForRole:](self, "presentationForRole:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v5, "regions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  v45 = height;
  v46 = width;
  v47 = y;
  v44 = x;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v15, "extent");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        if ((objc_msgSend(v15, "isHidden") & 1) == 0 && v4[2](v4, v17, v19, v21, v23))
        {
          v62.origin.x = x;
          v62.origin.y = y;
          v62.size.width = width;
          v62.size.height = height;
          v73.origin.x = v17;
          v73.origin.y = v19;
          v73.size.width = v21;
          v73.size.height = v23;
          v63 = CGRectUnion(v62, v73);
          x = v63.origin.x;
          y = v63.origin.y;
          width = v63.size.width;
          height = v63.size.height;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v12);
  }

  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  MaxY = 0.0;
  if (!CGRectIsEmpty(v64))
  {
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    MaxY = CGRectGetMaxY(v65);
  }
  -[CSPresentation presentationForRole:](self, "presentationForRole:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v24, "regions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v50;
    v30 = v46;
    v29 = v47;
    v32 = v44;
    v31 = v45;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v50 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "extent");
        v34 = v66.origin.x;
        v35 = v66.origin.y;
        v36 = v66.size.width;
        v37 = v66.size.height;
        if (CGRectGetMinY(v66) > MaxY && v4[2](v4, v34, v35, v36, v37))
        {
          v67.origin.x = v32;
          v67.origin.y = v29;
          v67.size.width = v30;
          v67.size.height = v31;
          v74.origin.x = v34;
          v74.origin.y = v35;
          v74.size.width = v36;
          v74.size.height = v37;
          v68 = CGRectUnion(v67, v74);
          v32 = v68.origin.x;
          v29 = v68.origin.y;
          v30 = v68.size.width;
          v31 = v68.size.height;
        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v27);
  }
  else
  {
    v30 = v46;
    v29 = v47;
    v32 = v44;
    v31 = v45;
  }

  v69.origin.x = v32;
  v69.origin.y = v29;
  v69.size.width = v30;
  v69.size.height = v31;
  v38 = 0.0;
  if (!CGRectIsEmpty(v69))
  {
    -[CSPresentation bounds](self, "bounds");
    v39 = CGRectGetHeight(v70);
    v71.origin.x = v32;
    v71.origin.y = v29;
    v71.size.width = v30;
    v71.size.height = v31;
    v38 = v39 - CGRectGetMinY(v71);
  }

  v40 = 0.0;
  v41 = 0.0;
  v42 = MaxY;
  v43 = v38;
  result.right = v41;
  result.bottom = v43;
  result.left = v40;
  result.top = v42;
  return result;
}

BOOL __58__CSPresentation_suggestedInsetsForPreferredContentFrame___block_invoke(CGRect *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MinX;
  double MaxX;
  CGRect v13;

  MinX = CGRectGetMinX(*(CGRect *)&a2);
  if (MinX > CGRectGetMaxX(a1[1]))
    return 0;
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  MaxX = CGRectGetMaxX(v13);
  return MaxX >= CGRectGetMinX(a1[1]);
}

- (BOOL)isEqual:(id)a3
{
  CSPresentation *v4;
  NSString *identifier;
  void *v6;
  NSMutableArray *regions;
  void *v8;
  char v9;

  v4 = (CSPresentation *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (-[CSPresentation isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (identifier = self->_identifier,
             -[CSPresentation identifier](v4, "identifier"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             LODWORD(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v6),
             v6,
             (_DWORD)identifier))
  {
    regions = self->_regions;
    -[CSPresentation regions](v4, "regions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSMutableArray isEqualToArray:](regions, "isEqualToArray:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[CSPresentation descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CSPresentation coordinateSpace](self, "coordinateSpace", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSPresentation presentationWithCoordinateSpace:](CSPresentation, "presentationWithCoordinateSpace:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSPresentation identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "unionPresentation:", self);
  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CSPresentation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_regions, "count"), CFSTR("regions"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CSPresentation descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  CSPresentation *v9;

  v4 = a3;
  -[CSPresentation succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_regions, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CSPresentation_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E8E2DC00;
    v8 = v5;
    v9 = self;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  }
  return v5;
}

void __56__CSPresentation_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "regions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("regions"), 1);

}

- (CGRect)bounds
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  objc_msgSend(WeakRetained, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertRect:toCoordinateSpace:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UICoordinateSpace **p_coordinateSpace;
  id v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_coordinateSpace = &self->_coordinateSpace;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinateSpace);
  objc_msgSend(WeakRetained, "convertRect:fromCoordinateSpace:", v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UICoordinateSpace)coordinateSpace
{
  return (UICoordinateSpace *)objc_loadWeakRetained((id *)&self->_coordinateSpace);
}

- (void)setCoordinateSpace:(id)a3
{
  objc_storeWeak((id *)&self->_coordinateSpace, a3);
}

- (NSArray)regions
{
  return &self->_regions->super;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_storeStrong((id *)&self->_regions, 0);
}

@end
