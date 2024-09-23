@implementation MKLaneDirectionCollisionCalculator

- (MKLaneDirectionCollisionCalculator)initWithDirections:(id)a3
{
  id v4;
  MKLaneDirectionCollisionCalculator *v5;
  uint64_t v6;
  NSMutableArray *directions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKLaneDirectionCollisionCalculator;
  v5 = -[MKLaneDirectionCollisionCalculator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    directions = v5->_directions;
    v5->_directions = (NSMutableArray *)v6;

    -[MKLaneDirectionCollisionCalculator _recalculateCollisions](v5, "_recalculateCollisions");
  }

  return v5;
}

- (NSArray)directions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_directions, "copy");
}

- (void)_recalculateCollisions
{
  NSNumber *directionWithMostCollisions;
  NSMutableDictionary *v4;
  NSMutableDictionary *collisionsForDirection;
  NSMutableArray *directions;
  _QWORD v7[6];
  _QWORD v8[4];

  self->_hasCollisions = 0;
  directionWithMostCollisions = self->_directionWithMostCollisions;
  self->_directionWithMostCollisions = 0;

  -[NSMutableDictionary removeAllObjects](self->_collisionsForDirection, "removeAllObjects");
  if (!self->_collisionsForDirection)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    collisionsForDirection = self->_collisionsForDirection;
    self->_collisionsForDirection = v4;

  }
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  directions = self->_directions;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MKLaneDirectionCollisionCalculator__recalculateCollisions__block_invoke;
  v7[3] = &unk_1E20DCF90;
  v7[4] = self;
  v7[5] = v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](directions, "enumerateObjectsUsingBlock:", v7);
  _Block_object_dispose(v8, 8);
}

void __60__MKLaneDirectionCollisionCalculator__recalculateCollisions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  int v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ii;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t n;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t jj;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t kk;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t mm;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  void *v111;
  uint64_t v112;
  _QWORD v113[3];

  v113[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    v6 = a3 + 1;
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", a3 - 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 < v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v9;
      v113[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_9;
    }
    v112 = v8;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v112;
LABEL_7:
    objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") >= 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v9;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = (uint64_t *)&v111;
    goto LABEL_7;
  }
  v11 = 0;
LABEL_9:
  v14 = objc_msgSend(v5, "_mk_laneDirectionValue");
  v15 = 0;
  if (v14 > 15)
  {
    if (v14 <= 63)
    {
      if (v14 == 16)
      {
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v16 = v11;
        v56 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
        if (v56)
        {
          v57 = v56;
          v15 = 0;
          v58 = *(_QWORD *)v99;
          do
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v99 != v58)
                objc_enumerationMutation(v16);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * i), "_mk_laneDirectionValue") == 32)
                ++v15;
            }
            v57 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
          }
          while (v57);
          goto LABEL_114;
        }
      }
      else
      {
        if (v14 != 32)
          goto LABEL_121;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v16 = v11;
        v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
        if (v26)
        {
          v27 = v26;
          v15 = 0;
          v28 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v95 != v28)
                objc_enumerationMutation(v16);
              v30 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
              if (objc_msgSend(v30, "_mk_laneDirectionValue") == 16
                || objc_msgSend(v30, "_mk_laneDirectionValue") == 64)
              {
                ++v15;
              }
            }
            v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
          }
          while (v27);
          goto LABEL_114;
        }
      }
    }
    else
    {
      switch(v14)
      {
        case 64:
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v16 = v11;
          v46 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
          if (v46)
          {
            v47 = v46;
            v15 = 0;
            v48 = *(_QWORD *)v91;
            do
            {
              for (k = 0; k != v47; ++k)
              {
                if (*(_QWORD *)v91 != v48)
                  objc_enumerationMutation(v16);
                v50 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * k);
                if (objc_msgSend(v50, "_mk_laneDirectionValue") == 32
                  || objc_msgSend(v50, "_mk_laneDirectionValue") == 128)
                {
                  ++v15;
                }
              }
              v47 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
            }
            while (v47);
            goto LABEL_114;
          }
          break;
        case 128:
          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v16 = v11;
          v51 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v107, 16);
          if (v51)
          {
            v52 = v51;
            v15 = 0;
            v53 = *(_QWORD *)v87;
            do
            {
              for (m = 0; m != v52; ++m)
              {
                if (*(_QWORD *)v87 != v53)
                  objc_enumerationMutation(v16);
                v55 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * m);
                if (objc_msgSend(v55, "_mk_laneDirectionValue") == 64
                  || objc_msgSend(v55, "_mk_laneDirectionValue") == 1)
                {
                  ++v15;
                }
              }
              v52 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v86, v107, 16);
            }
            while (v52);
            goto LABEL_114;
          }
          break;
        case 256:
          v68 = 0u;
          v69 = 0u;
          v66 = 0u;
          v67 = 0u;
          v16 = v11;
          v22 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v102, 16);
          if (v22)
          {
            v23 = v22;
            v15 = 0;
            v24 = *(_QWORD *)v67;
            do
            {
              for (n = 0; n != v23; ++n)
              {
                if (*(_QWORD *)v67 != v24)
                  objc_enumerationMutation(v16);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * n), "_mk_laneDirectionValue", (_QWORD)v66) == 32)++v15;
              }
              v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v66, v102, 16);
            }
            while (v23);
LABEL_114:

            if (!v15)
              goto LABEL_121;
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
            v60 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v61 = *(_QWORD *)(v60 + 24);
            if (v15 <= v61)
            {
              if (v15 != v61)
                goto LABEL_121;
              v64 = *(_QWORD *)(a1 + 32);
              v16 = *(id *)(v64 + 24);
              *(_QWORD *)(v64 + 24) = 0;
            }
            else
            {
              *(_QWORD *)(v60 + 24) = v15;
              v62 = *(_QWORD *)(a1 + 32);
              v63 = v5;
              v16 = *(id *)(v62 + 24);
              *(_QWORD *)(v62 + 24) = v63;
            }
LABEL_120:

            goto LABEL_121;
          }
          break;
        default:
          goto LABEL_121;
      }
    }
LABEL_117:
    v15 = 0;
    goto LABEL_120;
  }
  switch(v14)
  {
    case 0:
    case 1:
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v16 = v11;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v106, 16);
      if (!v17)
        goto LABEL_117;
      v18 = v17;
      v15 = 0;
      v19 = *(_QWORD *)v83;
      do
      {
        for (ii = 0; ii != v18; ++ii)
        {
          if (*(_QWORD *)v83 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * ii);
          if (objc_msgSend(v21, "_mk_laneDirectionValue") == 128
            || objc_msgSend(v21, "_mk_laneDirectionValue") == 2)
          {
            ++v15;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v106, 16);
      }
      while (v18);
      goto LABEL_114;
    case 2:
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v16 = v11;
      v31 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v105, 16);
      if (!v31)
        goto LABEL_117;
      v32 = v31;
      v15 = 0;
      v33 = *(_QWORD *)v79;
      do
      {
        for (jj = 0; jj != v32; ++jj)
        {
          if (*(_QWORD *)v79 != v33)
            objc_enumerationMutation(v16);
          v35 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * jj);
          if (objc_msgSend(v35, "_mk_laneDirectionValue") == 1
            || objc_msgSend(v35, "_mk_laneDirectionValue") == 4)
          {
            ++v15;
          }
        }
        v32 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v78, v105, 16);
      }
      while (v32);
      goto LABEL_114;
    case 4:
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v16 = v11;
      v36 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v104, 16);
      if (!v36)
        goto LABEL_117;
      v37 = v36;
      v15 = 0;
      v38 = *(_QWORD *)v75;
      do
      {
        for (kk = 0; kk != v37; ++kk)
        {
          if (*(_QWORD *)v75 != v38)
            objc_enumerationMutation(v16);
          v40 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * kk);
          if (objc_msgSend(v40, "_mk_laneDirectionValue") == 2
            || objc_msgSend(v40, "_mk_laneDirectionValue") == 8)
          {
            ++v15;
          }
        }
        v37 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v104, 16);
      }
      while (v37);
      goto LABEL_114;
    case 8:
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v16 = v11;
      v41 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v103, 16);
      if (!v41)
        goto LABEL_117;
      v42 = v41;
      v15 = 0;
      v43 = *(_QWORD *)v71;
      do
      {
        for (mm = 0; mm != v42; ++mm)
        {
          if (*(_QWORD *)v71 != v43)
            objc_enumerationMutation(v16);
          v45 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * mm);
          if (objc_msgSend(v45, "_mk_laneDirectionValue") == 4
            || objc_msgSend(v45, "_mk_laneDirectionValue") == 256)
          {
            ++v15;
          }
        }
        v42 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v70, v103, 16);
      }
      while (v42);
      goto LABEL_114;
    default:
      break;
  }
LABEL_121:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = v15 != 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v65, v5);

}

- (BOOL)hasDirectionWithMaxCollisions
{
  return self->_directionWithMostCollisions != 0;
}

- (void)removeNextDirectionWithCollisions
{
  uint64_t (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  if (-[MKLaneDirectionCollisionCalculator hasCollisions](self, "hasCollisions"))
  {
    if (-[MKLaneDirectionCollisionCalculator hasDirectionWithMaxCollisions](self, "hasDirectionWithMaxCollisions"))
    {
      -[NSMutableArray removeObject:](self->_directions, "removeObject:", self->_directionWithMostCollisions);
    }
    else
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __71__MKLaneDirectionCollisionCalculator_removeNextDirectionWithCollisions__block_invoke;
      v4[3] = &unk_1E20DCFB8;
      v4[4] = self;
      v3 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x18D778DB8](v4);
      if ((v3[2](v3, 256) & 1) == 0
        && (v3[2](v3, 16) & 1) == 0
        && (v3[2](v3, 8) & 1) == 0
        && (v3[2](v3, 32) & 1) == 0
        && (v3[2](v3, 2) & 1) == 0
        && (v3[2](v3, 128) & 1) == 0
        && (v3[2](v3, 4) & 1) == 0
        && (v3[2](v3, 64) & 1) == 0
        && !v3[2](v3, 1))
      {

        return;
      }

    }
    -[MKLaneDirectionCollisionCalculator _recalculateCollisions](self, "_recalculateCollisions");
  }
}

uint64_t __71__MKLaneDirectionCollisionCalculator_removeNextDirectionWithCollisions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);
  if ((_DWORD)v6)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (!v10)
      return 0;
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v5);
  }

  return v6;
}

- (void)removeDirectionWithCollisionsLeastSimilarToDirection:(int)a3
{
  uint64_t v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  _QWORD v12[5];

  if (-[MKLaneDirectionCollisionCalculator hasCollisions](self, "hasCollisions"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__MKLaneDirectionCollisionCalculator_removeDirectionWithCollisionsLeastSimilarToDirection___block_invoke;
    v12[3] = &unk_1E20DCFB8;
    v12[4] = self;
    v5 = MEMORY[0x18D778DB8](v12);
    v6 = (uint64_t (**)(_QWORD, _QWORD))v5;
    if (a3 <= 15)
    {
      switch(a3)
      {
        case 0:
        case 1:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) == 0
            && (v6[2](v6, 16) & 1) == 0
            && (v6[2](v6, 8) & 1) == 0
            && (v6[2](v6, 32) & 1) == 0
            && (v6[2](v6, 4) & 1) == 0
            && (v6[2](v6, 64) & 1) == 0
            && (v6[2](v6, 2) & 1) == 0)
          {
            v7 = 128;
            goto LABEL_81;
          }
          break;
        case 2:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
            && (v6[2](v6, 32) & 1) == 0
            && (v6[2](v6, 64) & 1) == 0
            && (v6[2](v6, 128) & 1) == 0
            && (v6[2](v6, 256) & 1) == 0
            && (v6[2](v6, 8) & 1) == 0)
          {
            v9 = v6[2](v6, 1);
            goto LABEL_56;
          }
          break;
        case 4:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
            && (v6[2](v6, 32) & 1) == 0
            && (v6[2](v6, 64) & 1) == 0
            && (v6[2](v6, 128) & 1) == 0
            && (v6[2](v6, 256) & 1) == 0
            && (v6[2](v6, 1) & 1) == 0)
          {
            v8 = v6[2](v6, 2);
            goto LABEL_47;
          }
          break;
        case 8:
          if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) == 0
            && (v6[2](v6, 32) & 1) == 0
            && (v6[2](v6, 64) & 1) == 0
            && (v6[2](v6, 128) & 1) == 0
            && (v6[2](v6, 1) & 1) == 0
            && (v6[2](v6, 2) & 1) == 0)
          {
            v9 = v6[2](v6, 256);
LABEL_56:
            if ((v9 & 1) == 0)
            {
              v7 = 4;
              goto LABEL_81;
            }
          }
          break;
        default:
          goto LABEL_82;
      }
      goto LABEL_82;
    }
    if (a3 <= 63)
    {
      if (a3 != 16)
      {
        if (a3 != 32
          || ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) != 0
          || (v6[2](v6, 8) & 1) != 0
          || (v6[2](v6, 4) & 1) != 0
          || (v6[2](v6, 2) & 1) != 0
          || (v6[2](v6, 1) & 1) != 0
          || (v6[2](v6, 16) & 1) != 0
          || (v6[2](v6, 128) & 1) != 0)
        {
          goto LABEL_82;
        }
        v7 = 64;
        goto LABEL_81;
      }
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) != 0
        || (v6[2](v6, 8) & 1) != 0
        || (v6[2](v6, 4) & 1) != 0
        || (v6[2](v6, 2) & 1) != 0
        || (v6[2](v6, 1) & 1) != 0)
      {
        goto LABEL_82;
      }
      v11 = v6[2](v6, 128);
    }
    else
    {
      if (a3 == 64)
      {
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) != 0
          || (v6[2](v6, 8) & 1) != 0
          || (v6[2](v6, 4) & 1) != 0
          || (v6[2](v6, 2) & 1) != 0
          || (v6[2](v6, 1) & 1) != 0
          || (v6[2](v6, 16) & 1) != 0)
        {
          goto LABEL_82;
        }
        v10 = v6[2](v6, 128);
        goto LABEL_79;
      }
      if (a3 != 128)
      {
        if (a3 != 256
          || ((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 16) & 1) != 0
          || (v6[2](v6, 32) & 1) != 0
          || (v6[2](v6, 64) & 1) != 0
          || (v6[2](v6, 128) & 1) != 0
          || (v6[2](v6, 1) & 1) != 0
          || (v6[2](v6, 2) & 1) != 0)
        {
          goto LABEL_82;
        }
        v8 = v6[2](v6, 4);
LABEL_47:
        if ((v8 & 1) != 0)
          goto LABEL_82;
        v7 = 8;
        goto LABEL_81;
      }
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, 256) & 1) != 0
        || (v6[2](v6, 8) & 1) != 0
        || (v6[2](v6, 4) & 1) != 0
        || (v6[2](v6, 2) & 1) != 0
        || (v6[2](v6, 1) & 1) != 0)
      {
        goto LABEL_82;
      }
      v11 = v6[2](v6, 16);
    }
    if ((v11 & 1) != 0)
      goto LABEL_82;
    v10 = v6[2](v6, 64);
LABEL_79:
    if ((v10 & 1) == 0)
    {
      v7 = 32;
LABEL_81:
      v6[2](v6, v7);
    }
LABEL_82:

  }
}

uint64_t __91__MKLaneDirectionCollisionCalculator_removeDirectionWithCollisionsLeastSimilarToDirection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObject:", v11);

      objc_msgSend(*(id *)(a1 + 32), "_recalculateCollisions");
      return 1;
    }
  }
  else
  {

  }
  return 0;
}

- (BOOL)hasCollisions
{
  return self->_hasCollisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionWithMostCollisions, 0);
  objc_storeStrong((id *)&self->_directions, 0);
  objc_storeStrong((id *)&self->_collisionsForDirection, 0);
}

@end
